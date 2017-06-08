package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured
import org.grails.web.json.JSONObject
import org.grails.web.json.JSONArray

@Secured(['ROLE_SYSADMIN'])
class AdminController {

    def index() { }

    def post(){
        render view: 'posts'
    }

    def user(){
        render view: 'users'
    }

    def users() {
        def users = User.createCriteria().list([max: params.int("length"), offset: params.int("start")]){}
        def result = new JSONObject()
        def aaData = new JSONArray()
        users.eachWithIndex{ User u, int i ->
            def arr = new JSONArray()
            arr.put(i+ 1)
            arr.put(u.username)
            arr.put(u.name)
            arr.put(u.phone)
            arr.put(u.email)
            arr.put("""<a href="${createLink(controller: 'user', action: 'edit', id: u.id)}" rel="bootbox"><i class="fa fa-edit"></i></a>""")
            aaData.put(arr)
        }
        result.put("draw", params.int("draw"))
        result.put("recordsTotal", users.totalCount)
        result.put("recordsFiltered", users.totalCount)
        result.put("data", aaData)
        render result
    }

    def posts() {

        def posts = Post.createCriteria().list([max: params.int("length"), offset: params.int("start")]){}

        def result = new JSONObject()
        def aaData = new JSONArray()
        posts.eachWithIndex{ Post p, int i ->
            def arr = new JSONArray()
            arr.put(i+1)
            arr.put("${p.user?.name}(${p.user?.username})")
            arr.put(p.tieude)
            arr.put(p.loai.name)
            arr.put(p.trangThai)
            arr.put(p.diachi)
            arr.put(p.sonha)
            arr.put(p.tenduong)
            arr.put(p.phuong)
            arr.put(p.quanhuyen)
            arr.put(p.tinhthanh)
            arr.put(p.dientich)
            arr.put(p.gia)
            arr.put(p.mota)
            arr.put(p.namxay)
            arr.put(p.doituong)
            arr.put(p.rating)
            aaData.put(arr)
        }

        result.put("draw", params.int("draw"))
        result.put("recordsTotal", posts.totalCount)
        result.put("recordsFiltered", posts.totalCount)
        result.put("data", aaData)
        render result
    }
}
