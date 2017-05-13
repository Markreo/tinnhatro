package com.tinnhatro

class Post {
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

    String tieude
    Loai loai = Loai.PHONGTRO
    String diachi
    String phuong
    String quanhuyen
    String tinhthanh
    String dientich
    long gia
    String mota

    String namxay = '2017'
    String doituong


    static constraints = {
        tieude nullable: false, blank: false
        loai nullable: false
        diachi nullable: true
        quanhuyen nullable: false
        tinhthanh nullable: false
        gia nullable: false
        mota nullable: false
        user nullable: true
    }

    static mapping = {
        mota type: 'text'
    }
}
