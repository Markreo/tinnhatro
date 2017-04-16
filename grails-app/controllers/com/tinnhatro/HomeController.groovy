package com.tinnhatro

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def index() { }

    def testmap() {

    }

    def getJsonFile() {
        render([
                "data": [
                        [
                                "id": 1,
                                "title": "2151 Mulberry Avenue",
                                "location": "63 Birch Street",
                                "latitude": 51.538395,
                                "longitude": -0.097418,
                                "url": "assets/pages/items/1_e.html",
                                "type": "Apartment",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/1.jpg",
                                                "assets/items/2.jpg",
                                                "assets/items/3.jpg"
                                        ],
                                "price": "\$2500",
                                "overview":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 2,
                                                "rooms": 4,
                                                "garages": 1,
                                                "area": 240
                                        ],
                                "description": "Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu."
                        ],
                        [
                                "id": 2,
                                "title": "3295 Valley Street",
                                "location": "Collingswood",
                                "latitude": 51.541599,
                                "longitude": -0.112588,
                                "url": "assets/pages/items/2_e.html",
                                "type": "House",
                                "type_icon": "",
                                "rating": 5,
                                "price": "\$120",
                                "gallery":
                                        [
                                                "assets/items/2.jpg",
                                                "assets/items/5.jpg",
                                                "assets/items/4.jpg"
                                        ],
                                "overview":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 2,
                                                "rooms": 4,
                                                "garages": 1,
                                                "area": 240
                                        ],
                                "description": "Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu."
                        ],
                        [
                                "id": 3,
                                "title": "534 Roosevelt Street",
                                "location": "San Francisco",
                                "latitude": 51.551489,
                                "longitude": -0.067077,
                                "url": "assets/pages/items/3_e.html",
                                "type": "Cottage",
                                "type_icon": "",
                                "rating": 5,
                                "price": "\$120",
                                "gallery":
                                        [
                                                "assets/items/3.jpg",
                                                "assets/items/5.jpg",
                                                "assets/items/4.jpg"
                                        ],
                                "overview":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 2,
                                                "rooms": 4,
                                                "garages": 1,
                                                "area": 240
                                        ],
                                "description": "Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu."
                        ],
                        [
                                "id": 4,
                                "title": "Saguaro Tavern",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.539212,
                                "longitude": -0.118403,
                                "url": "assets/pages/items/4_e.html",
                                "type": "Construction Site",
                                "type_icon": "",
                                "rating": 5,
                                "price": "\$120",
                                "gallery":
                                        [
                                                "assets/items/4.jpg",
                                                "assets/items/5.jpg",
                                                "assets/items/6.jpg"
                                        ],
                                "overview":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 2,
                                                "rooms": 4,
                                                "garages": 1,
                                                "area": 240
                                        ],
                                "description": "Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu."
                        ],


                        [
                                "id": 5,
                                "title": "Max Five Lounge",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.522340,
                                "longitude": -0.037894,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/5.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 6,
                                "title": "Lavadome",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.503965,
                                "longitude": -0.058837,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 5,
                                "gallery":
                                        [
                                                "assets/items/6.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 7,
                                "title": "Café Roosterville Kitchen",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.486758,
                                "longitude": -0.112739,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/7.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 8,
                                "title": "Magma Bar and Grill",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.555385,
                                "longitude": -0.128274,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "featured": 0,
                                "gallery":
                                        [
                                                "assets/items/2.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 9,
                                "title": "Guilt Trattoria",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.560935,
                                "longitude": -0.111365,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/5.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 10,
                                "title": "Hot Dogma",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.530189,
                                "longitude": -0.078750,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/1.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 11,
                                "title": "Roadhouse Cantina",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.543803,
                                "longitude": -0.036607,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "featured": 0,
                                "gallery":
                                        [
                                                "assets/items/3.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 12,
                                "title": "Jetstream",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.518334,
                                "longitude": -0.125012,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/6.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 13,
                                "title": "Benephisto Tavern",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.527306,
                                "longitude": -0.140977,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/2.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 14,
                                "title": "Benephisto Tavern",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.545244,
                                "longitude": -0.070939,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/5.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 15,
                                "title": "Benephisto Tavern",
                                "location": "1882 Trainer Avenue",
                                "latitude": 51.558907,
                                "longitude": -0.041842,
                                "url": "item-detail.html",
                                "type": "Restaurant",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/5.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 16,
                                "title": "Café Goat and Guru",
                                "location": "2194 Thrash Trail",
                                "latitude": 51.551026,
                                "longitude": -0.102321,
                                "url": "item-detail.html",
                                "type": "Restaurant / Grill & Steak",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/4.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 17,
                                "title": "Socrates Cantina",
                                "location": "143 Young Road",
                                "latitude": 51.550644,
                                "longitude": -0.103493,
                                "url": "item-detail.html",
                                "type": "Restaurant / Grill & Steak",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/8.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 18,
                                "title": "Deja Brew Café",
                                "location": "2469 Hartway Street",
                                "latitude": 51.532112,
                                "longitude": -0.051885,
                                "url": "item-detail.html",
                                "type": "Restaurant / Coffee",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/8.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 19,
                                "title": "Deja Brew Café",
                                "location": "1087 Massachusetts Avenue",
                                "latitude": 51.531364,
                                "longitude": -0.054545,
                                "url": "item-detail.html",
                                "type": "Restaurant / Coffee",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/7.jpg"
                                        ],
                                "color": ""
                        ],
                        [
                                "id": 20,
                                "title": "Blue Horizon Grill",
                                "location": "684 Cambridge Place",
                                "latitude": 51.531311,
                                "longitude": -0.052314,
                                "url": "item-detail.html",
                                "type": "Restaurant / Grill",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/6.jpg"
                                        ],
                                "color": ""
                        ],

                        [
                                "id": 21,
                                "category": "real_estate",
                                "title": "Steak House Restaurant666",
                                "location": "63 Birch Street",
                                "latitude": 51.530189,
                                "longitude": -0.078750,
                                "url": "item-detail.html",
                                "type": "Apartment",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/4.jpg"
                                        ],
                                "item_specific":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 2,
                                                "rooms": 4,
                                                "garages": 1,
                                                "area": 240
                                        ]
                        ],
                        [
                                "id": 22,
                                "category": "real_estate",
                                "title": "Another same position",
                                "location": "63 Birch Street",
                                "latitude": 51.530189,
                                "longitude": -0.078750,
                                "url": "item-detail.html",
                                "type": "Apartment",
                                "type_icon": "",
                                "rating": 4,
                                "gallery":
                                        [
                                                "assets/items/3.jpg"
                                        ],
                                "item_specific":
                                        [
                                                "bedrooms": 2,
                                                "bathrooms": 1,
                                                "rooms": 3,
                                                "area": 153
                                        ]
                        ]


                ]
        ] as JSON)
    }
}
