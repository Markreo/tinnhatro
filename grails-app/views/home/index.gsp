<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <asset:link rel="stylesheet" href="fonts/font-awesome.css" type="text/css"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>

    <asset:link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>
    <asset:link rel="stylesheet" href="bootstrap-select.min.css" type="text/css"/>
    <asset:link rel="stylesheet" href="owl.carousel.css" type="text/css"/>
    <asset:link rel="stylesheet" href="jquery.nouislider.min.css" type="text/css"/>
    <asset:link rel="stylesheet" href="style.css" type="text/css"/>
    <asset:link rel="stylesheet" href="fileinput.css" type="text/css"/>

    <title>Tin nhà trọ</title>
    <asset:javascript  src="myjavascript.js" />
    <asset:javascript  src="bootbox.min.js" />

</head>

<body id="page-top" class="has-map">

<div id="page-wrapper">
    <!--end User area-->
    <header class="animate" id="header">
        <div class="container">
            <div class="header-inner">
                <nav class="secondary">
                    <ul>
                        <li>
                            <sec:ifLoggedIn>
                                xin chào <tnt:userInfo field="name"/>!
                            </sec:ifLoggedIn>
                            <sec:ifNotLoggedIn>
                                <a href="${createLink(controller: 'login', action: 'auth')}" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">Đăng nhập</a>
                            </sec:ifNotLoggedIn>
                        </li>
                    </ul>
                </nav>
                <!--end Secondary navigation-->
                <nav class="main">
                    <div class="brand">
                        <a href="${createLink(controller: 'home')}">
                            <asset:image src="logo.png" alt="brand"/>
                        </a>
                    </div>
                    <ul>
                        <li>
                            <a href="#" class="has-child">Trang chủ</a>
                            <ul>
                                %{--<li><a href="index-listing.html">Listing</a></li>--}%
                                <li><a href="index-map-fullscreen.html">Bản đồ toàn màn hình</a></li>
                                <li><a href="index-map.html">Bản đồ với danh sách</a></li>
                                <li><a href="index-search.html">Tìm kiếm</a></li>
                            </ul>
                        </li>
                        <li><a href="assets/pages/about_e.html" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">Chúng tôi</a></li>
                        <li><a href="${createLink(controller: 'home', action: 'person')}" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Đăng tin</a></li>
                        <li><a href="assets/pages/faq_e.html" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">FAQ</a></li>
                        <li><a href="assets/pages/contact_e.html" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Liên hệ</a></li>
                    </ul>
                    <div class="toggle-nav">
                        <div class="dots">
                            <i class="fa fa-circle"></i>
                            <i class="fa fa-circle"></i>
                            <i class="fa fa-circle"></i>
                        </div>
                    </div>
                </nav>
                <!--end Main navigation-->
            </div>
            <!--end .header-inner-->
        </div>
        <!--end .container-->
        <div class="container">
            <div class="submit-container">
                <a id="search-collapse-btn" href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Bộ lọc</a>
                <sec:ifAnyGranted roles="ROLE_CHOTHUE,ROLE_SYSADMIN">
                    <a href="${createLink(controller: 'post', action: 'create')}" class="submit-button" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true"><i><asset:image src="plus.png" alt=""/></i></a>
                </sec:ifAnyGranted>
            </div>
        </div>

    </header>
    <!--end Header-->

    <div class="page-content">
        <div class="search collapse in" id="search-collapse">
            <div class="container">
                <form class="main-search" role="form" method="post" action="#">
                    <div class="row">
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="type">Loại hình</label>
                                <select name="type" multiple title="Tất cả" id="type" class="animate" data-transition-parent=".dropdown-menu">
                                    <option value="1">Nhà trọ,phòng trọ</option>
                                    <option value="2">Nhà thuê nguyên căn</option>
                                    <option value="3">Cho thuê căn hộ</option>
                                    <option value="4">Tìm người ở ghép</option>
                                    <option value="5">Cho thuê mặt bằng</option>
                                </select>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-6-->
                        <div class="col-md-3 col-sm-3">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="bedrooms">Phòng ngủ</label>
                                        <div class="input-group counter">
                                            <input type="text" class="form-control" id="bedrooms" name="bedrooms" placeholder="Tất cả">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default minus" type="button"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default plus" type="button"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!--/.col-md-3-->
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label for="bathrooms">Phòng tắm</label>
                                        <div class="input-group counter">
                                            <input type="text" class="form-control" id="bathrooms" name="bathrooms" placeholder="Tất cả">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default minus" type="button"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default plus" type="button"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!--/.col-md-3-->
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label for="location">Vị trí</label>
                                <div class="input-group location">
                                    <input type="text" class="form-control" id="location" placeholder="Nhập vào vị trí">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default animate" type="button"><i class="fa fa-map-marker geolocation" data-toggle="tooltip" data-placement="bottom" title="Find my position"></i></button>
                                    </span>
                                </div>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label>Giá</label>
                                <div class="ui-slider" id="price-slider" data-value-min="1000000" data-value-max="10000000" data-value-type="price" data-currency="đ" data-currency-placement="after">
                                    <div class="values clearfix">
                                        <input class="value-min" name="value-min[]" readonly>
                                        <input class="value-max" name="value-max[]" readonly>
                                    </div>
                                    <div class="element"></div>
                                </div>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-6-->
                    </div>
                    <!--/.row-->
                </form>
                <!-- /.main-search -->
            </div>
            <!--end .container-->
        </div>
        <!--end .search-->

        <div class="content-inner">
            <div class="container" id="main-container">
                <div class="content-loader">
                    <div class="content fade_in animate">
                        <a href="#" class="close" id="close"><asset:image src="close.png" alt=""/></a>
                        <!--external content goes here-->
                    </div>
                </div>
                <!--end Content Loader-->
            </div>
        </div>

        <div class="map-wrapper grid">
            <div class="map height-500" id="map"></div>
            <!--end .map-->
        </div>
        <!--end .map-wrapper-->

        <div class="masonry grid full-width animate">

        <g:each in="${posts}" var="post">
            <div class="item move_from_bottom idle">
                <g:render template="/post/tile" model="[post: post]"/>
            </div>
        </g:each>

        <!--end .item-->
            <!--end .item-->

          %{--  <div class="item scale_in block-transparent height-500">
                <div class="wrapper center">
                    <a href="assets/pages/submit_e.html" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">
                        <asset:image src="plus-circle.png" class="plus"/>
                        <h2>Add Your Own Property</h2>
                    </a>
                </div>
            </div>

            <div class="item move_from_bottom">
                <a href="assets/pages/items/6_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$125.000</span></div>
                            <asset:image src="items/6.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3295 Valley Street</h2>
                                <h3>Collingswood</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom" >
                <a href="assets/pages/items/5_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$59.900</span></div>
                            <asset:image src="items/5.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>1164 Bombardier Way</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/8_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$42.200</span></div>
                            <asset:image src="items/8.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>942 Hillview Drive</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/7_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$83.600</span></div>
                            <asset:image src="items/7.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>2462 Orphan Road</h2>
                                <h3>Seattle, WA 98109</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/1_e.html"  data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$25.000</span></div>
                            <asset:image src="items/1.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>2151 Mulberry Avenue</h2>
                                <h3>63 Birch Street</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/2_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$49.000</span></div>
                            <asset:image src="items/2.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3295 Valley Street</h2>
                                <h3>Collingswood</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/3_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$36.400</span></div>
                            <asset:image src="items/3.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>534 Roosevelt Street</h2>
                                <h3>San Francisco</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/4_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$72.000</span></div>
                            <asset:image src="items/4.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3311 Centennial Farm Road</h2>
                                <h3>Carroll, IA 51401</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/6_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$125.000</span></div>
                            <asset:image src="items/6.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3295 Valley Street</h2>
                                <h3>Collingswood</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom" >
                <a href="assets/pages/items/5_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$59.900</span></div>
                            <asset:image src="items/5.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>1164 Bombardier Way</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/8_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$42.200</span></div>
                            <asset:image src="items/8.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>942 Hillview Drive</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/7_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$83.600</span></div>
                            <asset:image src="items/7.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>2462 Orphan Road</h2>
                                <h3>Seattle, WA 98109</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/1_e.html"  data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$25.000</span></div>
                            <asset:image src="items/1.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>2151 Mulberry Avenue</h2>
                                <h3>63 Birch Street</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/2_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$49.000</span></div>
                            <asset:image src="items/2.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3295 Valley Street</h2>
                                <h3>Collingswood</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/3_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$36.400</span></div>
                            <asset:image src="items/3.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>534 Roosevelt Street</h2>
                                <h3>San Francisco</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/4_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$72.000</span></div>
                            <asset:image src="items/4.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3311 Centennial Farm Road</h2>
                                <h3>Carroll, IA 51401</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/6_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$125.000</span></div>
                            <asset:image src="items/6.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>3295 Valley Street</h2>
                                <h3>Collingswood</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom" >
                <a href="assets/pages/items/5_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$59.900</span></div>
                            <asset:image src="items/5.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>1164 Bombardier Way</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/8_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$42.200</span></div>
                            <asset:image src="items/8.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>942 Hillview Drive</h2>
                                <h3>Plymouth</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>
            <!--end .item-->

            <div class="item move_from_bottom">
                <a href="assets/pages/items/7_e.html" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">
                    <div class="inner">
                        <div class="image">
                            <div class="price average-color"><span>$83.600</span></div>
                            <asset:image src="items/7.jpg" alt=""/>
                        </div>
                        <div class="item-content">
                            <header class="average-color">
                                <h2>2462 Orphan Road</h2>
                                <h3>Seattle, WA 98109</h3>
                            </header>
                            <footer>
                                <dl>
                                    <dt>Bathrooms</dt>
                                    <dd>1</dd>
                                    <dt>Bedrooms</dt>
                                    <dd>2</dd>
                                    <dt>Area</dt>
                                    <dd>165m<sup>2</sup></dd>
                                    <dt>Garages</dt>
                                    <dd>1</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>
                </a>
            </div>--}%
            <!--end .item-->
        </div>

    </div>
    <!--end Page Content-->
</div>



<asset:javascript src="jquery-2.1.0.min.js"/>
<asset:javascript src="imagesloaded.pkgd.min.js"/>
<asset:javascript src="jquery-migrate-1.2.1.min.js"/>
<asset:javascript src="bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="jquery.color-2.1.2.min.js"/>
<asset:javascript src="jquery.average-color.js"/>
<asset:javascript src="masonry.pkgd.min.js"/>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&amp;libraries=places"></script>
%{--<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdCSr9vabayz2eiL6j5IrVdzmaz3uCY1Q&callback=initMap">
</script>--}%
<asset:javascript src="infobox.js"/>
<asset:javascript src="richmarker-compiled.js"/>
<asset:javascript src="markerclusterer.js"/>
<asset:javascript src="smoothscroll.js"/>
<asset:javascript src="owl.carousel.min.js"/>
<asset:javascript src="bootstrap-select.js"/>
<asset:javascript src="icheck.min.js"/>
<asset:javascript src="jquery.nouislider.all.min.js"/>
<asset:javascript src="jquery.inview.min.js"/>
<asset:javascript src="functions.js"/>
<asset:javascript src="custom.js"/>
<asset:javascript src="fileinput.js"/>

<script>

    /*var _latitude = 10.870398;
    var _longitude = 106.802923;*/
    var _latitude = 10.7704207;
    var _longitude = 106.6990068;
    var jsonPath = '${createLink(controller: 'home', action: 'getJsonFile')}';

    // Load JSON data and create Google Maps
    $.getJSON(jsonPath)
        .done(function(json) {
            createHomepageGoogleMap(_latitude,_longitude,json);
        })
        .fail(function( jqxhr, textStatus, error ) {
            console.log(error);
        })
    ;


        var abc = setInterval(function () {
            $("#search-collapse-btn").click();
            clearTimeout(abc)
        }, 2000);



</script>

</body>
</html>