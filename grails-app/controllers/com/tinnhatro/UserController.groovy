package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured

@Secured("IS_AUTHENTICATED_FULLY")
class UserController {

    def index() { }

    def create() {

    }

    @Secured('permitAll')
    def register() {

    }
}
