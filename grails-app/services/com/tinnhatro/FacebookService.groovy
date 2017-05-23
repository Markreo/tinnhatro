package com.tinnhatro

import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.types.FacebookType
import com.restfb.Parameter
import grails.transaction.Transactional

@Transactional
class FacebookService {

    private final String appToken = "1760086690683134|_Zm65Q49LtnqjZ3Aat2uPPy5t3s"

    def serviceMethod() {

    }

    def postStatusToGroup() {
        String access_token = "EAACEdEose0cBAODPqwH1RAKJqPOBZBRSjZB9w7Wllugo31MZApxTyNbs2U0xTSZADQwGgqHuv51Ahe7Yycp0l91F7RY3fIgy2JxM0BjkZCBhlRZCZCkCWsdfzIgWCyVCeZCtAVEdZALMSQiO5y5V85bUGpZCKhRfitr7fRz3NpE39irFuVD3OoJy25ZBmZCHwYJ53nkZD";
        FacebookClient fbClient = new DefaultFacebookClient(access_token)
        FacebookType response = fbClient.publish("655549507972910/feed", FacebookType.class, Parameter.with("message", " Hello, fb World - test restfb!"));
        return "fb.com/" + response.getId()
    }
}
