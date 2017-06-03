<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
    #map-simple { min-height: 240px; }
    </style>
    <asset:javascript src="myjavascript.js"/>

    <title>${post.tieude}</title>
    <script>
        var contextPath = '${request.contextPath}';
    </script>
    <asset:link rel="shortcut icon" href="assets/favicon.ico" type="image/x-icon"/>
    <g:if test="${!isAjax}">
        <asset:stylesheet src="/fonts/font-awesome.css" type="text/css"/>
        <asset:stylesheet src="bootstrap.min.css" type="text/css"/>
        <asset:stylesheet src="style.csss" type="text/css"/>
        <asset:javascript src="functions.js"/>

        <style>
        .gallery img {
            display: none;
        }
        .gallery img.active {
            display: block;
        }
        </style>
        <script>
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
    </g:if>

</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <g:if test="${post.image.size() > 1}">
                    <div class="items-switch">
                        <a href="javascript:void(0)" onclick="left()">
                            <asset:image src="arrow-left.png"/>
                        </a>
                        <a href="javascript:void(0)">
                            <asset:image src="arrow-right.png" onclick="right()"/>
                        </a>
                    </div>
                </g:if>
                <article class="animate move_from_bottom_short">
                    <div class="gallery">
                        <div class="image" id="viewImage">
                            <g:each in="${post.image}" var="img" status="i">
                                <tnt:image filename="${img.path}" id="${i}" class="${i == 0 ? 'active' : ''}"/>
                            </g:each>
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h1>${post.tieude}</h1>
                    <h2><i class="fa fa-map-marker"></i>${post.diachi}</h2>
                    <figure class="price average-color"><span><g:formatNumber number="${post.gia}" format="###,###,###"/> đ </span></figure>
                    <p class="description">${post.mota}</p>
                </article>
                <!--end Description-->
                <article class="sidebar">
                    <div class="person animate move_from_bottom_short">
                        <div class="inner average-color">
                            <g:if test="${post.user.avatar}">
                                <figure class="person-image">
                                    <tnt:image filename="${post.user.avatar}" width="100px"/>
                                </figure>
                            </g:if>
                            <header>${post.user.name}</header>
                            <a >${post.user.phone}</a>
                            <a href="mailto:catherine.brown@example.com">${post.user.email}</a>
                            <hr>

                        </div>
                        <div id="person-detail">
                            <div class="details">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum, sem ut sollicitudin consectetur, augue diam ornare massa
                                </p>
                                <h3>Contact Me</h3>
                                <form role="form" method="post" class="clearfix">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="person-name" name="person-name" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="person-email" name="person-email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="2" placeholder="Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-link dark pull-right">Send Message</button>
                                    </div>
                                </form>

                            </div>
                            <!--end .details-->
                        </div>
                        <!--end .collapse-->
                    </div>
                    <!--end .person-->
                </article>
                <!--end Sidebar-->
                <article class="animate move_from_bottom_short">
                    <h3>Tiện ích</h3>
                    <ul class="bullets">
                        <g:each in="${post.tienich?.split(',')}" var="tienich">
                            <li>${tienich}</li>
                        </g:each>
                    </ul>
                </article>
                <!--end Features-->
                <article>
                    <h3>Map</h3>
                    <div id="map-simple"></div>
                </article>
                <!--end Map-->
                <g:if test="${post.facebookId}">
                    <script>
                        window.fbAsyncInit = function() {
                            FB.init({
                                appId      : '1760086690683134',
                                cookie     : true,  // enable cookies to allow the server to access
                                                    // the session
                                xfbml      : true,  // parse social plugins on this page
                                version    : 'v2.8' // use graph api version 2.8
                            });



                        };

                        // Load the SDK asynchronously
                        (function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/sdk.js";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));


                    </script>
                    <article>
                        <h3>Reviews</h3>
                        <div class="review block">
                            <div class="fb-comments" data-href="https://www.facebook.com/655549507972910/posts/${post.facebookId}" data-numposts="5" data-width="475"></div>
                            <tnt:facebook feed="${post.facebookId}"/>
                        </div>


                    </article>
                    <!--end Reviews-->
                </g:if>
                <sec:ifAnyGranted roles="ROLE_CHOTHUE,ROLE_SYSADMIN">
                <article class="center" id="test">
                    <a href="#" class="btn btn-circle btn-default btn-lg"><i class="fa fa-plus"></i></a>
                </article>
                <!--end Add Review-->
                </sec:ifAnyGranted>
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->
<g:if test="${!isAjax}">
    <asset:javascript src="external.js"/>
</g:if>
<script>
    var _latitude = ${post.latitude};
    var _longitude = ${post.longitude};
    var draggableMarker = false;
    var scrollwheel = true;
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        console.log("hasClass")
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = createLink({uri: 'assets/external.js'});
//        head.appendChild(script);
    }
    else {
        console.log('no class external')
        simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);
        rating();
        averageColor( $('.content-container') );
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }

</script>

</body>
</html>