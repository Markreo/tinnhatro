package com.tinnhatro

import com.restfb.BinaryAttachment
import com.restfb.Connection
import com.restfb.DefaultFacebookClient

import com.restfb.FacebookClient
import com.restfb.FacebookClient.AccessToken
import com.restfb.exception.FacebookException
import com.restfb.types.Comment
import com.restfb.types.Comments
import com.restfb.types.FacebookType
import com.restfb.Parameter
import com.restfb.types.Page
import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class FacebookService {

    private final String appId = "1370513073041989"
    private final String appSecret = "9dc3909a46d66e74e89aec4d52beb403"
    private final String groupId = "655549507972910"
    private final String fanPageId = "trangtinnhatro"
    private final String longAccessToken = "EAATeeXDg8kUBADdQwB39uemaTpmf0RO3AZBLO2hI3kZBVYCAt9g8GzmpHG9p2R54SF1wvr15Izh6LO9FEynZA8ZCs5LeBFKhpZAnTZCSmyETjRB1QkXzEH1WVBZCC2uNXvNYm82lti9QLlEdxstQsVt7NILMb4eyPfF04kIKW5v7wZDZD"

    private String accessToken = ""

    def testTagA() {

    }

    def postPhotoToGroup(Post post, String link = '') {
        String tieni = ""
        post.tienich?.split(',')?.each {
            tieni = tieni + " \t- " + it + "\n"
        }
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)

        FacebookType response = fbClient.publish(groupId + (post.image ? "/photos" : "/feed"),
                FacebookType.class,
                post.image ? BinaryAttachment.with("file-name", new File(post.image.first().path).bytes) : null,
                Parameter.with("message", post.tieude.toUpperCase() + "\n" + post.mota +  "\n" + post.dieukhoan + "\n" + "* Địa chỉ: " + post.diachi + "\n" + tieni + "\n" + link)
        );
        return response.getId()
    }

    def postPhotoToPage(Post post, String link = '') {
        String tieni = ""
        post.tienich?.split(',')?.each {
            tieni = tieni + " \t- " + it + "\n"
        }

        FacebookClient fbClient = new DefaultFacebookClient(getPageToken(fanPageId, longAccessToken))


        FacebookType response = fbClient.publish(fanPageId + (post.image ? "/photos" : "/feed"),
                FacebookType.class,
                post.image ? BinaryAttachment.with("file-name", new File(post.image.first().path).bytes) : null,
                Parameter.with("message", post.tieude.toUpperCase() + "\n" + post.mota +  "\n" + "* Địa chỉ: " + post.diachi + "\n" + tieni + "\n" + link)
        );
        return response.getId()
    }


    ArrayList<Comment> getComments(String id = '1576433009047575') {
        try {
            FacebookClient fbClient = new DefaultFacebookClient(getPageToken(fanPageId, longAccessToken))
            com.restfb.types.Post post = fbClient.fetchObject(id, com.restfb.types.Post.class,
                    Parameter.with("fields", "comments"));

            ArrayList<Comment> comments = new ArrayList<Comment>()
            for (Comment c : post.comments.data) {
                Comment comment = fbClient.fetchObject(c.id, Comment.class,
                        Parameter.with("fields", "comments,likes,message,from")
                )
                comments.add(comment)
            }
            return comments
        } catch (FacebookException ex ){
            println ex.message
            return null
        }
    }

    String getPageToken(String pageId, String token) {
        RestBuilder rest = new RestBuilder()
        RestResponse resp = rest.get("https://graph.facebook.com/v2.9/${pageId}?fields=access_token&access_token=${token}")
        String page_token = new JsonSlurper().parseText(resp.json.toString()).access_token
        println(page_token)
        return page_token
    }
}
