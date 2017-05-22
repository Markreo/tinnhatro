package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def index() {
        def posts = Post.list([max: 10])
        [posts: posts]
    }

    def testmap() {

    }

    def login() {

    }

    // http://12333:/media/image/<i>
    def image(String id) {
        // out content type image
        //response.outputStream << image.out
    }

    def getJsonFile() {
        def postData = []
        def posts = Post.list([max: 10])
        posts.each {
            println it.toJSON()
            postData.add(it.toJSON())
        }
        render([data: postData] as JSON)
    }
}
