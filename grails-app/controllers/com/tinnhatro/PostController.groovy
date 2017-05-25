package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.util.Holders
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest

@Secured(["ROLE_SYSADMIN","ROLE_ADMIN","ROLE_CHOTHUE"])
class PostController {

    def springSecurityService
    def facebookService

    def index() { }

    def create() {
        render(template: 'createPost')
    }

    def saveCreate() {
        println(params)
        def post = new Post(params)
        def files = request.getFiles('files')
        post.user = springSecurityService.currentUser
        println(post.toString())
        if(post.hasErrors() || !post.save(flush: true)) {
            println "save post error: ${post.errors}"
            render([message: 'fail'] as JSON)
        } else {
            files.each { StandardMultipartHttpServletRequest.StandardMultipartFile file ->
                File folder = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}")
                folder.mkdirs()
                File f = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}/${System.currentTimeMillis()}_" + file.getOriginalFilename())
                file.transferTo(f)
                post.addToImage(new Photo(path: f.path))
            }
            post.save(flush: true)
            if((springSecurityService.currentUser as User).isAdmin()) {
                render([message: 'refresh', html: g.render(template: 'createPost')] as JSON)
            } else {
                render([message: 'reload'] as JSON)
            }
        }
    }


    def tile(long id) {
        def post = Post.get(id)
        render(template: 'tile', model: [post: post])
    }

    def test() {

    }

    @Secured('permitAll')
    def detail(long id) {
        Post post = Post.get(id)
        if(post) {
            render(template: 'detail', model: [post: post])
        } else {
            response.sendError(404)
        }
    }

    @Secured('permitAll')
    def getInforbox(long id) {
        Post post = Post.get(id)
        if(post) {
            render(template: 'getInforbox', model: [post: post])
        } else {
            response.sendError(404)
        }
    }


    def postStatus() {
        render facebookService.postFeedToFanpage("test with \n enter")
    }

    def login() {

    }

    def postToGraph() {

    }

}
