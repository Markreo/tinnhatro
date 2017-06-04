package tinnhatro

import com.restfb.types.Comment
import com.tinnhatro.User
import grails.util.Holders
import org.apache.commons.codec.binary.Base64

class TntTagLib {
    def springSecurityService
    def facebookService
    static defaultEncodeAs = [taglib:'raw']
    static namespace = 'tnt'

    def userInfo = { attrs,body->
        def field = attrs.field
        if (springSecurityService.isLoggedIn()) {
            out << (springSecurityService.currentUser as User)."${field}"
        }

    }

    def image = { attrs, body->
        try {
            String path = attrs.filename
            if(path) {
                File file = new File(path)
                if (!file.length()) {
                    file = new File("${Holders.config.folder.item}")
                }
                FileInputStream fis = new FileInputStream(file);
                def byteArray = new byte[(int) file.length()];
                fis.read(byteArray);

                String imageString = Base64.encodeBase64String(byteArray);
                out << "<img src='data:image/jpeg;base64,${imageString}' id='${attrs.id}' width='${attrs.width ?: ''}' class='${attrs.class ?: ''}'/>"
            }
        } catch (ex) {

        }
    }

    def breadcrumbs = { attrs, body ->
        out << "${g.render(template: '/layouts/breadcrumbs', model: [current: attrs.current, link: attrs.link, title: attrs.title])}"
    }

    def facebook = { attrs, body->
        def fbId = attrs.fbId
        if(fbId) {
            out << g.render(template: '/template/comments', model: [comments: facebookService.getComments(fbId)])

        }
    }
}
