package com.tinnhatro

import grails.converters.JSON
import groovy.transform.ToString

@ToString
class Post {
    enum TrangThai{
        HIEULUC(0),
        HETHAN(1),
        XOA(2)

        int id
        TrangThai(id) {this.id = id}
    }

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
    static hasMany = [image: Photo]


    TrangThai trangThai = TrangThai.HIEULUC
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
    String dieukhoan

    String namxay
    String doituong
    String source

    String tienich

    int rating = 100
    int star

    String facebookId

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
        dieukhoan nullable: true
        user nullable: true
        namxay nullable: true
        doituong nullable: true
        latitude nullable: true
        longitude nullable: true
        rating nullable: true
        trangThai nullable: true
        star nullable: true
        facebookId nullable: true
        source nullable: true
        tienich nullable: true
    }

    static mapping = {
        mota type: 'text'
        dieukhoan type: 'text'
    }

    Map toJSON() {
        return [id: this.id,
                tieude: this.tieude,
                diachi: this.diachi,
                latitude: this.latitude,
                longitude: this.longitude,
                loai: this.loai.name,
                rating: this.rating,
                image: image.toList()?.id,
                gia: this.gia,
                tienich: tienich?.split(','),
                mota: this.mota.subSequence(0, this.mota.length() < 180 ? this.mota.length() : 180),
                dieukhoan: this.dieukhoan.subSequence(0, this.dieukhoan.length() < 180 ? this.dieukhoan.length() : 180),
                dateCreated: this.dateCreated.format('dd/MM/yyyy HH:mm'),
                lastUpdated: lastUpdated.format('dd/MM/yyyy: HH:mm')]
    }

    Map getFeed() {
        String tieni = ""
        this.tienich.each {
            tieni = tieni + " \t- " + it + "\n"
        }
        return [message: this.tieude.toUpperCase() + "\n" + this.mota +  "\n" + "* Địa chỉ: " + this.diachi + "\n" + tieni, image: this.image.toList()]
    }
}
