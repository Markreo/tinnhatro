package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CHOTHUE','ROLE_SYSADMIN'])
class AdminController {

    def index() { }

    def users() {
        println("here")
    }

    def post() {
        
    }
}
