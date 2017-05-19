package com.tinnhatro

import grails.converters.JSON

class Post {
    def grailsLinkGenerator
    enum Loai {
        PHONGTRO(1, "Nhà trọ, phòng trọ"),
        NGUYENCAN(2, "Nhà nguyên căn"),
        CANHO(3, "Cho thuê căn hộ"),
        TIMNGUOIOGHEP(4, "Tìm người ở ghép"),
        KHACHSAN(5, "Khách sạn, nhà nghỉ")

        int id
        String name
        Loai(id, name) {this.name = name; this.id = id}
    }

    static belongsTo = [user: User]
    static hasMany = [image: String, tienich: Utilities]

    String tieude
    Loai loai = Loai.PHONGTRO
    String diachi
    String sonha
    String tenduong
    String phuong
    String quanhuyen
    String tinhthanh
    String dientich
    String latitude
    String longitude
    long gia
    String mota

    String namxay
    String doituong

    Date dateCreated
    Date lastUpdated


    static constraints = {
        tieude nullable: false, blank: false
        loai nullable: true
        diachi nullable: true
        sonha nullable: true
        tenduong nullable: true
        phuong nullable: true
        quanhuyen nullable: false
        tinhthanh nullable: false
        dientich nullable: true
        gia nullable: false
        mota nullable: true
        user nullable: true
        namxay nullable: true
        doituong nullable: true
        latitude nullable: true
        longitude nullable: true
    }

    static mapping = {
        mota type: 'text'
    }

    JSON toJSON() {
        return [id: this.id,
                tieude: this.tieude,
                location: this.diachi,
                latitude: this.latitude,
                longitude: this.longitude,
                url: "/post/" + this.id,
                type: this.loai.name,
                type_icon: "",
                rating: 4,
                gallery: image.toList(),
                price: this.gia,
                overview: tienich?.name,
                description: this.mota] as JSON
    }
}
