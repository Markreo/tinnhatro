package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_FULLY")
class UserController {

    def springSecurityService

    def index() { }

    //role admin
    def create() {//phải ở một action khác với register() vì phân quyền, bảo mật
        //TODO: create admin user, acion = 'saveAdmin'
    }

    //role admin
    def saveAdmin() {
        //TODO: create admin user, role = ROLE_ADMIN
    }

    @Secured('permitAll')
    def register() {

    }

    @Secured('ROLE_SYSADMIN')
    def edit(){
        User user = params.id ? User.get(params.id as Long) : new User()
        render view: 'register', model: [user: user]
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

    //role sysadmin
    def disable(long id) {
        //TODO: disable user
    }

    //role admin
    def delete(long id) {
        //TODO: delete user
    }
}
