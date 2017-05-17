package tinnhatro

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
            File f = new File(attrs.filename);		//change path of image according to you
            if (f.exists()) {
                FileInputStream fis = new FileInputStream(f);
                def byteArray = new byte[(int)f.length()];
                fis.read(byteArray);

                String imageString = Base64.encodeBase64String(byteArray);
                out << "<img src='data:image/jpeg;base64,${imageString}' id='image${attrs.id}'/>"
            }
        } catch (ex) {

        }
    }
}
