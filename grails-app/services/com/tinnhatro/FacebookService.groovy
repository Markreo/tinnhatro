package com.tinnhatro

import com.restfb.DefaultFacebookClient

import com.restfb.FacebookClient
import com.restfb.FacebookClient.AccessToken
import com.restfb.types.FacebookType
import com.restfb.Parameter
import grails.transaction.Transactional

@Transactional
class FacebookService {

    private final String appId = "1760086690683134"
    private final String appSecret = "c04234e57e0b834c8fcd0866e0992e41"
    private final String groupId = "655549507972910"
    private final String fanPageId = "131743174046075"

    private String accessToken = ""

    def postFeedToGroup(String message) {
        this.getAccessToken()
        println(accessToken)
        FacebookClient fbClient = new DefaultFacebookClient(accessToken)
        FacebookType response = fbClient.publish(groupId + "/feed", FacebookType.class, Parameter.with("message", message));
        return "fb.com/" + response.getId()
    }

    def postFeedToFanpage(String message) {
        this.getAccessToken()
        println("accessToken" + accessToken)
        FacebookClient fbClient = new DefaultFacebookClient(accessToken)
        FacebookType response = fbClient.publish(fanPageId + "/feed", FacebookType.class, Parameter.with("message", message));
        return "fb.com/" + response.getId()
    }

    def getAccessToken() {
        AccessToken access_token = new DefaultFacebookClient().obtainAppAccessToken(appId, appSecret)
        this.accessToken = access_token.getAccessToken();
    }
}
