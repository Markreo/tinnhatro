package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured
import grails.util.Holders
import org.springframework.util.IdGenerator
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest

@Secured(["ROLE_SYSADMIN","ROLE_ADMIN","ROLE_CHOTHUE"])
class PostController {

    def springSecurityService

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
            render('fail')
        } else {
            files.each { StandardMultipartHttpServletRequest.StandardMultipartFile file ->
                File folder = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}")
                folder.mkdirs()
                File f = new File(Holders.config.folder.tmp + "/${new Date().format('yyyy/MM/dd')}/${System.currentTimeMillis()}_" + file.getOriginalFilename())
                file.transferTo(f)
                post.addToImage(f.path)
            }
            post.save(flush: true)
            render('success')
        }
    }


    def tile(long id) {
        def post = Post.get(id)
        render(template: 'tile', model: [post: post])
    }


}
