<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <asset:link rel="stylesheet" href="fonts/font-awesome.css" type="text/css"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,400,300' rel='stylesheet' type='text/css'>

    <asset:link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
    <asset:link rel="stylesheet" href="bootstrap-select.min.css" type="text/css"/>
    <asset:link rel="stylesheet" href="owl.carousel.css" type="text/css"/>
    <asset:link rel="stylesheet" href="jquery.nouislider.min.css" type="text/css"/>
    <asset:link rel="stylesheet" href="style.css" type="text/css"/>
    <asset:link rel="stylesheet" href="fileinput.css" type="text/css"/>
    <asset:link rel="shortcut icon" href="assets/favicon.ico" type="image/x-icon"/>

    <title>Tin nhà trọ</title>
    <asset:javascript  src="myjavascript.js" />
    <asset:javascript  src="bootbox.min.js" />
    <script>
        var contextPath = '${request.contextPath}';
    </script>

    <style>
    .gallery img {
        display: none;
    }
    .gallery img.active {
        display: block;
    }
    </style>

</head>

<body id="page-top" class="has-map">
<div id="fb-root"></div>
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=1370513073041989";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div id="page-wrapper">
    <!--end User area-->
    <header class="animate" id="header">
        <div class="container">
            <div class="header-inner">
                <nav class="secondary">
                    <ul>
                        <li>
                            <sec:ifLoggedIn>
                                Xin chào <tnt:userInfo field="name"/>!
                            </li> <li><g:link controller='logout'>Log out</g:link>
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
                                <li><a href="#">Bản đồ toàn màn hình</a></li>
                                <li><a href="#">Bản đồ với danh sách</a></li>
                                <li><a href="#">Tìm kiếm</a></li>
                            </ul>
                        </li>
                        <li><a href="${createLink(controller: 'home', action: 'about')}" data-expand-width="col-8" data-transition-parent=".content-loader" data-external="true">Chúng tôi</a></li>
                        <li><a href="${createLink(controller: 'home', action: 'FAQ')}" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">FAQ</a></li>
                        <li><a href="${createLink(controller: 'home', action: 'contact')}" data-expand-width="col-6" data-transition-parent=".content-loader" data-external="true">Liên hệ</a></li>
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
                <a id="search-collapse-btn" href="#search-collapse" class="btn btn-default btn-sm show-filter" data-toggle="collapse" aria-expanded="false" aria-controls="search-collapse">Tìm kiếm</a>
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
                                    <option value="PHONGTRO">Nhà trọ,phòng trọ</option>
                                    <option value="NGUYENCAN">Nhà thuê nguyên căn</option>
                                    <option value="CANHO">Cho thuê căn hộ</option>
                                    <option value="TIMNGUOIOGHEP">Tìm người ở ghép</option>
                                    <option value="KHACHSAN">Khách sạn</option>
                                </select>
                            </div>
                            <!-- /.form-group -->
                        </div>
                        <!--/.col-md-6-->
                        %{--<div class="col-md-3 col-sm-3">
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
                        </div>--}%
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
                                <div class="ui-slider" id="price-slider" data-value-min="0" data-value-max="20000000" data-value-type="price" data-currency="đ" data-currency-placement="after" data-step="100000">
                                    <div class="values clearfix">
                                        <input class="value-min" name="min" readonly>
                                        <input class="value-max" name="max" readonly>
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

        <g:each in="${posts.take(6)}" var="post">
            <div class="item move_from_bottom idle">
                <g:render template="/post/tile" model="[post: post]"/>
            </div>
        </g:each>
        <g:each in="${posts.drop(6)}" var="post">
            <div class="item move_from_bottom">
                <g:render template="/post/tile" model="[post: post]"/>
            </div>
        </g:each>

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
<asset:javascript src="jquery.nouislider.all.min.js"/>

<script>

    var _latitude = 10.7704207;
    var _longitude = 106.6990068;
    var loai = '';
    var min = '';
    var max = '';

    // Load JSON data and create Google Maps
    loadMarker({});

    function loadMarker( data) {
        $.getJSON('${createLink(controller: 'home', action: 'getJsonFile')}', data)
            .done(function(json) {
                createHomepageGoogleMap(_latitude,_longitude,json);
            })
            .fail(function( jqxhr, textStatus, error ) {
                console.log(error);
            })
        ;
    }

    $("select[name='type']").on('change', function (event) {
        console.log('change type')
        loai = $(this).val();
        loadMarker({type: loai, min: min, max: max})
    });

    $("#price-slider").on('change', function (event) {
        console.log('change value')
        var val = $(this).val();
        min = val[0];
        max = val[1];
        loadMarker({type: loai, min: min, max: max})


    });


    var abc = setInterval(function () {
        $("#search-collapse-btn").click();
        clearTimeout(abc)
    }, 2000);

    function left() {
        var imgAcvite = $("#viewImage").find("img.active");
        var left = $("#viewImage").find("img#" + (parseInt(imgAcvite[0].id) - 1))[0];
        if($(left).length) {
            imgAcvite.removeClass('active');
            $(left).addClass('active');
        }
    }

    function right() {
        var imgAcvite = $("#viewImage").find("img.active");
        var right = $("#viewImage").find("img#" + (parseInt(imgAcvite[0].id) + 1))[0];
        if($(right).length) {
            imgAcvite.removeClass('active');
            $(right).addClass('active');
        }
    }

</script>

</body>
</html>