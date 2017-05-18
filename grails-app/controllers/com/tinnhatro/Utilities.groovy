package com.tinnhatro

/**
 * Created by user on 5/16/2017.
 */
enum Utilities {
    VESINHRIENG(0, "Nhà vệ sinh riêng"),
    BANCONG(1, "Ban công"),
    TIVI(2, "Tivi")

    int id
    String name
    Utilities(id, name) { this.id = id; this.name = name}
}