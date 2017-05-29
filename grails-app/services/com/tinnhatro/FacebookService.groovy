package com.tinnhatro

import com.restfb.BinaryAttachment
import com.restfb.Connection
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

    def testTagA() {

    }

    def postPhotoToGroup(Post post, String link = '') {
        String tieni = ""
        post.tienich.each {
            tieni = tieni + " \t- " + it.name + "\n"
        }
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)

        FacebookType response = fbClient.publish(groupId + (post.image ? "/photos" : "/feed"),
                FacebookType.class,
                post.image ? BinaryAttachment.with("file-name", new File(post.image.first().path).bytes) : null,
                Parameter.with("message", post.tieude.toUpperCase() + "\n" + post.mota +  "\n" + "* Địa chỉ: " + post.diachi + "\n" + tieni + "\n<a>" + link +"</a>")
        );
        return response.getId()
    }

    def postPhotoToPage(Post post, String link = '') {
        String tieni = ""
        post.tienich.each {
            tieni = tieni + " \t- " + it.name + "\n"
        }
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)

        FacebookType response = fbClient.publish(groupId + (post.image ? "/photos" : "/feed"),
                FacebookType.class,
                post.image ? BinaryAttachment.with("file-name", new File(post.image.first().path).bytes) : null,
                Parameter.with("message", post.tieude.toUpperCase() + "\n" + post.mota +  "\n" + "* Địa chỉ: " + post.diachi + "\n" + tieni + "\n<a>" + link +"</a>")
        );
        return response.getId()
    }


    def testPrice() {
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)

        FacebookType response = fbClient.publish(groupId + "/feed",
                FacebookType.class,
                Parameter.with("message",
                        "+ Nhà trọ giá nước: 100.000đ/người\n" +
                        "+ Rác và dọn vệ sinh hành lang: 40.000đ/phòng/tháng.\n" +
                        "+ Giữ xe máy: 150.000đ/chiếc xe số/tháng, 200.000/chiếc xe ga/tháng.\n" +
                        "+ Thang máy: 100.000đ/người.\n" +
                        "+ Giờ giấc tự do.\n" +
                        "+ Hợp đồng kí tối thiểu 6 tháng, đặt cọc 5.000.000đ +1 tháng tiền phòng.\n" +
                        "* Địa chỉ: 300 Nguyễn Đình Chiểu, Hồ Chí Minh, Việt Nam\n" )
        )
        return response.getId()
    }

    def getFeed(String id = '101678373762384') {
        FacebookClient fbClient = new DefaultFacebookClient(longAccessToken)
        com.restfb.types.Post post = fbClient.fetchObject("801952856622339", com.restfb.types.Post.class);
        println("Post: " + post.getId() + " : " + post.getMessage());
       /* for (Comment comment : commentData) {
            com.restfb.types.FacebookComment fbComment = FacebookComment.create(null, comment);
            println("fbComment: {}", fbComment);
            println("CommentMessage : {} ", fbComment.getMessage());
        }*/

    }
}
