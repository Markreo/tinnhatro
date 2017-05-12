package tinnhatro

import com.tinnhatro.User

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
}
