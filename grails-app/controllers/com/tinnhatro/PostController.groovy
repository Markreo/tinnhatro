package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_SYSADMIN,ROLE_ADMIN,ROLE_CHOTHUE")
class PostController {

    def springSecurityService

    def index() { }

    @Secured("permitAll")
    def create() {
        render(template: 'createPost')
    }

    def saveCreate() {

    }
}
