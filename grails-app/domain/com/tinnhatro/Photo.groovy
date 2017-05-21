package com.tinnhatro

class Photo {

    String path
    static belongsTo = [post: Post]

    static constraints = {
        path nullable: false
    }

    static mapping = {
        version(false)
    }
}
