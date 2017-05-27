package com.tinnhatro

import com.restfb.BinaryAttachment
import com.restfb.DefaultFacebookClient

import com.restfb.FacebookClient
import com.restfb.FacebookClient.AccessToken
import com.restfb.types.FacebookType
import com.restfb.Parameter
import grails.transaction.Transactional

@Transactional
class FacebookService {

    private final String appId = "1370513073041989"
    private final String appSecret = "9dc3909a46d66e74e89aec4d52beb403"
    private final String groupId = "655549507972910"
    private final String fanPageId = "trangtinnhatro"
    private final String longAccessToken = "EAATeeXDg8kUBADdQwB39uemaTpmf0RO3AZBLO2hI3kZBVYCAt9g8GzmpHG9p2R54SF1wvr15Izh6LO9FEynZA8ZCs5LeBFKhpZAnTZCSmyETjRB1QkXzEH1WVBZCC2uNXvNYm82lti9QLlEdxstQsVt7NILMb4eyPfF04kIKW5v7wZDZD"

    private String accessToken = ""

    def postFeedToGroup(String message) {
        println("longAccessToken: " + longAccessToken)
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)
        FacebookType response = fbClient.publish(groupId + "/feed", FacebookType.class, Parameter.with("message", message));
        return "fb.com/" + response.getId()
    }

    def postFeedToFanpage(String message) {
        println("longAccessToken: " + longAccessToken)
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)
        FacebookType response = fbClient.publish(fanPageId + "/feed", FacebookType.class, Parameter.with("message", message));
        return "fb.com/" + response.getId()
    }

    def postPhotoToGroup(Post post) {
        String tieni = ""
        post.tienich.each {
            tieni = tieni + " \t- " + it + "\n"
        }
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)

        FacebookType response = fbClient.publish(groupId + (post.image ? "/photos" : "/feed"),
                FacebookType.class,
                post.image ? BinaryAttachment.with("file-name", new File(post.image.first().path).bytes) : null,
                Parameter.with("message", post.tieude.toUpperCase() + "\n" + post.mota +  "\n" + "* Địa chỉ: " + post.diachi + "\n" + tieni)
        );
        return "fb.com/" + response.getId()
    }

    def getAccessToken() {
        AccessToken access_token = new DefaultFacebookClient().obtainAppAccessToken(appId, appSecret)
        this.accessToken = access_token.getAccessToken();
    }

    def post(Post post) {

    }
}
