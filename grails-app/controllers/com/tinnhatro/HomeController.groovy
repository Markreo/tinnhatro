package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def index() {
        def posts = Post.list([max: 100])
        [posts: posts]
    }

    def testmap() {

    }

    def login() {

    }

    def getJsonFile() {
        def postData = []
        def posts = Post.list()
        posts.each {
            postData.add(it.toJSON())
        }
        render([data: postData] as JSON)
    }
    }
