package com.tinnhatro

import grails.plugin.springsecurity.annotation.Secured
import org.grails.web.json.JSONObject
import org.grails.web.json.JSONArray
import org.hibernate.mapping.IdGenerator

//TODO:re-set all role
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
        def result = new JSONObject()
        def dataTable = new JSONArray()
        def users = User.createCriteria().list([max: params.int("length"), offset: params.int("start"), sort: params.field, order: params."order[0][dir]"]) {
            if (params.search) {
                or {
                    //TODO: search
                }
            }

        }
//        int i = params.int("start") + 1
        users.each { User user->
            def data = new JSONArray()
            data.put("1")
            data.put(user.name)
            data.put(user.username)
            data.put(user.phone)
            data.put(user.email)
            //TODO: change class like post
            data.put("""<a href="${createLink(controller: 'user', action: 'disable', id: user.id)}" class="btn btn-outline btn-primary btn-xs"><i class="fa fa-search"></i> TODO: Disable/Enable</a>
                            <a href="${createLink(controller: 'user', action: 'edit', id: user.id)}" class="btn btn-outline btn-success btn-xs" rel='bootbox'><i class="fa fa-edit"></i> Edit</a>
                            <a href="${createLink(controller: 'user', action: 'delete', id: user.id)}" class="btn btn-outline btn-danger btn-xs" onclick="return confirm('Are you sure ?')"><i class="fa fa-trash-o"></i> Delete</a>""")
            dataTable.put(data)
        }

        int total = users.totalCount
        result.put("draw", params.int("draw"))
        result.put("recordsTotal", total)
        result.put("recordsFiltered", total)
        result.put("data", dataTable)
        render(result)
    }


    def posts() {

        def posts = Post.createCriteria().list([max: params.int("length"), offset: params.int("start")]){}

        def result = new JSONObject()
        def aaData = new JSONArray()
        List<String> ddd = []
        //TODO:search by createcriteria
        posts.eachWithIndex{ Post p, int i ->
            def arr = new JSONArray()
            arr.put(i+1)
            arr.put("${p.user?.name}(${p.user?.username})")
            arr.put(p.tieude)
            arr.put(p.loai?.toString())
            arr.put("""<span class="label label-${p.trangThai.color}"> ${p.trangThai.name} </span>""")
            arr.put(p.phuong + " " + p.quanhuyen)
            //TODO: link to image
            arr.put(p.image*.id)
            arr.put(p.gia)
            arr.put(p.mota)
            arr.put(p.namxay)
            arr.put(p.doituong)
            arr.put(p.rating)
            arr.put(p.fbPageId ? """<a href='https://facebook.com/${p.fbPageId}' target='_blank'><i class='fa fa-facebook-official'></i> Link</a>""" : """<a href="${createLink(controller: 'post', action: 'pushPage', id: p.id)}" class="btn btn-default btn-xs themesecondary"><i class="fa fa-share-alt"></i>Fanpage</a>""")
            arr.put(p.fbGroupId ? """<a href='https://facebook.com/${p.fbGroupId}' target='_blank'>${p.fbGroupId}</a>""" : """<a href="${createLink(controller: 'post', action: 'pushGroup', id: p.id)}" class="btn btn-default btn-xs themethirdcolor"><i class="fa fa-share-alt"></i>Group</a>""")
            arr.put("""
<a href="${createLink(controller: 'post', action: 'up', id: p.id)}" class="btn btn-xs btn-default shiny info"><i class="fa fa-arrow-up"></i>Up</a>
<a href="${createLink(controller: 'post', action: 'edit', id: p.id)}" class="btn btn-xs btn-default shiny success"><i class="fa fa-edit"></i>Edit</a>
<a href="${createLink(controller: 'post', action: 'delete', id: p.id)}" class="btn btn-xs btn-default shiny danger" onclick="return confirm('Bạn có muốn xóa?')"><i class="fa fa-trash-o"></i>Delete</a>""")
            aaData.put(arr)
        }

        result.put("draw", params.int("draw"))
        result.put("recordsTotal", posts.totalCount)
        result.put("recordsFiltered", posts.totalCount)
        result.put("data", aaData)
        render result
    }

}
