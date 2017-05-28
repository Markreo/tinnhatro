package tinnhatro

import com.tinnhatro.Photo
import com.tinnhatro.User
import org.apache.commons.codec.binary.Base64

class TntTagLib {
    def springSecurityService
    static defaultEncodeAs = [taglib:'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
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
                    file = new File('D:\\Project\\tinnhatro\\grails-app\\assets\\images\\default-item.png')
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
        def feedId = attrs.feed

    }
}
