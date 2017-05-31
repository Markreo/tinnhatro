package com.tinnhatro

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
import java.io.InputStreamReader;
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
        def posts = Post.createCriteria().list() {
            if(types) {
                def loais = []
                types.each {
                    loais.add(Post.Loai.valueOf(it))
                }
                'in'('loai', loais)
            }
            if(params.min) {
                println(params.getDouble("min")?.longValue())
                println(params.getDouble("max")?.longValue())
                between('gia', params.getDouble("min")?.longValue(), params.getDouble("max")?.longValue())
            }
        }
        posts.each {
            postData.add(it.toJSON())
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
        String url = "https://mystay.vn/motels/search/6?searching=&price=500000%2C50000000&checkin=03%2F06%2F2017&adults=1&child=0"
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
        def motas = []
        links.each {link->
            Document doc = Jsoup.connect(link).get()
            def moTaAndChinhSach = doc.select(".go-right > .panel.panel-default p")*.text()
            motas.add(moTaAndChinhSach[0] + "\n" + moTaAndChinhSach[1])
        }



        def imgs = []
        document.select(".img_list img").each {Element img->
            println(img.attr("data-original"))
        }

        titles.eachWithIndex { title, i ->
            def p = Post.findBySource(links[i])
//            if(!p) {
                def arrAddress = address[i].split(',')
                Post post= new Post(tieude: title, gia: gias[i] as long, mota: motas[i],
                        diachi: address[i], sonha: arrAddress[0], tenduong: arrAddress[0], phuong: arrAddress[1], quanhuyen: arrAddress[2], tinhthanh: 'Hồ Chí Minh',
                        source: links[i],
                        user: User.findByUsername('admin'),
                        longitude: longitudes[i],
                        latitude: latitudes[i]
                )
                if(post.hasErrors() || !post.save(flush: true)) {
                    println("save post err - " + post.errors)
                } else {
                    println("Process ${i}: saved new post!")
                }

        }

        render("abc")

    }

    def testImage() {
        try {
            URL url = new URL("https://mystay.vn/uploads/images/hotels/slider/thumbs/253511_IMG_8512.jpg");
            Image image = ImageIO.read(url);

            File folder = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}")
            folder.mkdirs()
            File f = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}/${System.currentTimeMillis()}.png")

            ImageIO.write(f, "jpg", image)
        } catch (IOException e) {
        }

    }

    def about() {
    }

    def FAQ(){

    }

    def contact() {

    }
}
