package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_SYSADMIN","ROLE_ADMIN","ROLE_CHOTHUE"])
class PostController {

    def springSecurityService

    def index() { }

    def create() {
        render(template: 'createPost')
    }

    def saveCreate() {
        println(params)
        params.remove("features[]")
        def post = new Post(params)
        post.user = springSecurityService.currentUser
        if(post.hasErrors() || !post.save(flush: true)) {
            println "save post error: ${post.errors}"
            render('success')
        } else {
            render('fail')
        }
    }
}
