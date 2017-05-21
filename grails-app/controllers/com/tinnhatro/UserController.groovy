package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_FULLY")
class UserController {

    def springSecurityService

    def index() { }

    def create() {

    }

    @Secured('permitAll')
    def register() {

    }

    @Secured('permitAll')
    def saveRegitser() {
        println(params)
        User user = new User(params)
        if(params.password != params.repassword) {
            return render("""<li>Mật khẩu xác nhận không đúng</li>""")
        }
        if(user.hasErrors() || !user.save(flush: true)) {
            println("save errror user : " +  user.errors)
            render(g.renderErrors(bean: user, as: 'list'))
        } else {
            def roleCHOTHUE = Role.findOrCreateWhere(authority: 'ROLE_CHOTHUE')
            def userRole = UserRole.findOrCreateWhere(user: user, role: roleCHOTHUE)
            if(userRole.save(flush: true)) {
                springSecurityService.reauthenticate(user.username)
            }
            render([success: true] as JSON)
        }
    }
}
