package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_SYSADMIN'])
class AdminController {

    def index() { }

    def users() {//TODO: them xoa sua user//ROLE CHOTHUE
    }

    def posts() { //TODO:them xoa sua post

    }
}
