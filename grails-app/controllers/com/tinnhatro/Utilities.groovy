package com.tinnhatro

/**
 * Created by user on 5/16/2017.
 */
enum Utilities {
    WIFI(0, "Wi-Fi Internet"),
    TOILETRIENG(1, "Toilet riêng"),
    KHOAVANTAY(2, "Khóa vân tay"),
    PCCC(3, "Hệ thống PCCC"),
    PARK(4, "Bãi đậu xe"),
    NAUAN(5, "Nấu ăn tự do"),
    FULLTIENNGHI(2, "Đầy đủ tiện nghi"),
    TUDO(2, "Giờ giấc tự do"),
    LOIDIRIENG(2, "Lối đi riêng"),
    CAMERA(2, "Camera an ninh"),
    BANCONG(2, "Ban công"),
    MAYLANH(2, "Máy lạnh"),
    THANGMAY(2, "Thang máy"),
    BAOVE(2, "Bảo vệ"),
    SANPHAN(2, "Sân phơi đồ"),
    SANTHUONG(2, "Sân thượng"),
    TRUYENHINH(2, "Truyền hình cáp"),
    NHABEP(2, "Nhà bếp"),
    GIATUI(2, "Giặt ủi"),
    GYM(2, "Phòng Gym"),
    DIENTHOAI(2, "Điện thoại nội bộ"),
    CUAANNINH(2, "Cửa an ninh"),
    DICHVU(2, "Dịch vụ dọn phòng"),
    THOATHIEM(2, "Lối thoát hiểm"),
    QUANLI(2, "Người quản lý")

    int id
    String name
    Utilities(id, name) { this.id = id; this.name = name}
}