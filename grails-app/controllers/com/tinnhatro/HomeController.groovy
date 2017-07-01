package com.tinnhatro

import app.HttpsTrustManager
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.util.Holders
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import org.jsoup.select.Elements

import javax.imageio.ImageIO
import java.awt.Image
import java.awt.image.BufferedImage
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection
import java.nio.file.Files;

@Secured('permitAll')
class HomeController {

    def index() {
        def posts = Post.list([max: 100])
        [posts: posts]
    }

    def testmap() {

    }

    def login() {

    }



    def getJsonFile() {
        println("parmas: " + params)
        def types = params.getList("type[]")
        def postData = []
        def posts = Post.createCriteria().list([sort:'dateCreated', order: 'desc']) {
            if(types) {
                def loais = []
                types.each {
                    loais.add(Post.Loai.valueOf(it))
                }
                'in'('loai', loais)
            }
            if(params.min) {
                between('gia', params.getDouble("min")?.longValue(), params.getDouble("max")?.longValue())
            }
        }
        posts.each { Post post ->
            postData.add(post.toJSON())
        }
        render([data: postData] as JSON)
    }

    def getData() {
        println(params)
        def titles = params.getList('title[]')
        def address = params.getList('address[]')
        def tienichss = params.getList('tienichs[]')

        address.eachWithIndex {String a, int i->
            def addres = a.substring(a.indexOf("title=\"") + 7, a.indexOf("\"><i"))
            def link = a.substring(a.indexOf("showMap('") + 9,a.indexOf("','modal')") )
            def title = (titles[i] as String).replace("  <span class=\"go-right\"></span>", '')
            def tienichs =  params.getList("tienichs[${i}][]")
            println("-------------------------------------------------------------------------------------\n\n\n")
            println(title)
            println(link)
            println(addres)
            println(tienichs)
        }

        render("return")
    }


    def func() {
        int page = 1
        HttpsTrustManager.allowAllSSL()
        while (page < 5) {
            String url = "https://mystay.vn/motels/search/${page}?searching=&price=500000%2C50000000&checkin=03%2F06%2F2017&adults=1&child=0"
            render("process " + url + "</br>")
            Document document = Jsoup.connect(url).get();
            Elements itemlabel3 = document.select(".itemlabel3")
            def titles = itemlabel3.select("a b")*.text()
            def addresss = itemlabel3.select("a.go-right")
            def latitudes = []
            def longitudes = []
            def address = addresss*.text()
            def linksArr = (addresss)*.attr('onclick')
            linksArr*.split("/").each {
                latitudes.add(it[5])
                longitudes.add(it[6])
            }

            def arrTienichs = []
            itemlabel3.each { item->
                def tienIchs = item.select(".facilities_item div")
                arrTienichs.add(tienIchs*.text())
            }

            def gias = itemlabel3.select("span.green.size18 b")*.text()*.replaceAll(",", '')*.replaceAll(" đ", '')
            def links = itemlabel3.select("h4 a")*.attr("abs:href")
            ArrayList<String> motas = []
            ArrayList<String> dieukhoans = []
            links.each {link->
                Document doc = Jsoup.connect(link).get()
                def moTaAndChinhSach = doc.select(".go-right > .panel.panel-default p")*.text()
                motas.add(moTaAndChinhSach[0].replace("+", "\n+"))
                dieukhoans.add(moTaAndChinhSach[1].replace("+", "\n+"))
            }



            def imgs = []
            document.select(".img_list img").each {Element img->
                imgs.add(img.attr("data-original"))
            }

            titles.eachWithIndex { title, i ->
                def p = Post.findBySource(links[i])
                if(!p) {
                    def arrAddress = address[i].split(',')
                    Post post = new Post(tieude: title, gia: gias[i] as long, mota: motas[i], dieukhoan: dieukhoans[i],
                            diachi: address[i], sonha: arrAddress[0], tenduong: arrAddress[0], phuong: arrAddress[1], quanhuyen: arrAddress[2], tinhthanh: 'Hồ Chí Minh',
                            source: links[i],
                            user: User.findByUsername('admin'),
                            longitude: longitudes[i],
                            latitude: latitudes[i],
                            tienich: arrTienichs[i]?.toString()?.replace(']', '')?.replace('[', '')
                    )
                    if(post.tieude?.indexOf("Nhà trọ") != -1) {
                        post.loai = Post.Loai.PHONGTRO
                    } else if(post.tieude?.indexOf('Căn hộ') != -1) {
                        post.loai = Post.Loai.CANHO
                    } else if(post.tieude?.indexOf('Nhà nguyên căn') != -1) {
                        post.loai = Post.Loai.NGUYENCAN
                    }

                    post.addToImage(new Photo(path: saveImage(imgs[i], '/data/clone')))

                    if (post.hasErrors() || !post.save(flush: true)) {
                        render("save post err - " + post.errors + "</br>")
                    } else {
                        render("Process ${i}: saved new post!</br>")
                    }
                } else {
                    render("alreay exists!</br>")
                }

            }
            page++
        }


    }

    def saveImage(String link, String path) {
        HttpsTrustManager.allowAllSSL()
        //See javax.imageio package for more info. That's using the AWT image. Otherwise you could do:

        URL url = new URL(link);
        InputStream inStream = new BufferedInputStream(url.openStream());
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];
        int n = 0;
        while (-1!=(n=inStream.read(buf)))
        {
            out.write(buf, 0, n);
        }
        out.close();
        inStream.close();
        byte[] response = out.toByteArray();
        //And you may then want to save the image so do:
        File f = new File(path)
        f.mkdirs()
        String fileName = path+"/${System.currentTimeMillis()}.jpg"
        FileOutputStream fos = new FileOutputStream(fileName);
        fos.write(response);
        fos.close();
        return fileName
    }

    def about() {
    }

    def FAQ(){

    }

    def contact() {

    }
}
