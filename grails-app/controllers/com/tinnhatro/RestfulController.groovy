package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonBuilder
import org.springframework.http.HttpStatus

@Secured(['permitAll'])
class RestfulController {

    protected boolean isJSONRequest() {
        try {
            return request.JSON
        } catch (ex) {}
        return false
    }

    protected Map getRequestParameters() {
        try {
            return (Map) request.JSON
        } catch (ex) {
            return [:]
        }
    }


    protected void sendError(Map props, HttpStatus status) {
        render(text: new JsonBuilder(props).toString(), contentType: "application/json", status: status.value())
    }

    protected void sendResponse(Map props, HttpStatus status) {
        sendResponse(new JsonBuilder(props).toString(), status);
    }

    protected void sendResponse(String message, HttpStatus status) {
        render(text: message, contentType: "application/json", status: status.value())
    }
}

