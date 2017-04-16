package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class PostController {

    def springSecurityService

    def index() { }

    @Secured("permitAll")
    def create() {
        if(springSecurityService.isLoggedIn() || true){
            render(template: 'createPost')
        } else {
            render(template: '/user/createUser')
        }
    }
}
