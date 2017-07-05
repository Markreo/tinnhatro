package com.tinnhatro.api

import com.tinnhatro.RestfulController
import com.tinnhatro.Role
import com.tinnhatro.User
import com.tinnhatro.UserRole
import org.springframework.http.HttpStatus

class ApiController extends RestfulController {

    def index() { }

    def createuser() {
        println("call here")
        if (!isJSONRequest()) {
            return sendResponse([message: 'Invalid JSON request'], HttpStatus.UNAUTHORIZED)
        } else {
            Map props = getRequestParameters()
            println(props)
            if (!props.username || !props.password || !props.name || !props.email) {
                println("mission params")
                return sendResponse([message: "Field username/password/channel_id is missing"], HttpStatus.UNAUTHORIZED)
            } else {
                User user = new User(username: props.username, password: props.password, phone: props.username, email: props.email, name: props.name)
                if(user.hasErrors() || !user.save(flush: true)){
                    println(user.errors)
                    return sendResponse([message: user.errors.toString()], HttpStatus.UNAUTHORIZED)
                } else {
                    println("saved")
                    def roleCHOTHUE = Role.findOrCreateWhere(authority: 'ROLE_CHOTHUE')
                    def userRole = UserRole.findOrCreateWhere(user: user, role: roleCHOTHUE)
                    if(userRole.save(flush: true)) {
                        println('saved role')
                    }
                    return sendResponse([message: "success"], HttpStatus.OK)
                }
            }
        }
    }
}
