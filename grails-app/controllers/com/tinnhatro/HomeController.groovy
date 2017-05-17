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

    def getJsonFile() {
        def data = [:]
        def postData = []
        def posts = Post.list([max: 10])
        posts.each {
            postData.add(it.toJSON())
        }
        data << [data: posts]
        render(data as JSON)
    }
}
