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
</head>
<body class="external">

<div id="item-detail" class="content-container">
    <div class="row">
        <div class="col-md-8">
            <div class="inner">
                <div class="items-switch">
                    <a href="javascript:void(0)" onclick="left()">
                        <asset:image src="arrow-left.png"/>
                    </a>
                    <a href="javascript:void(0)">
                        <asset:image src="arrow-right.png" onclick="right()"/>
                    </a>
                </div>
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
                    <p>${post.mota}</p>
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
                        <g:each in="${post.tienich}" var="tienich">
                            <li>${tienich.name}</li>
                        </g:each>
                    </ul>
                </article>
                <!--end Features-->
                <article>
                    <h3>Map</h3>
                    <div id="map-simple"></div>
                </article>
                <!--end Map-->
                <article>
                    <h3>Reviews</h3>
                    <div class="review block">
                        <figure class="person-image">
                            <asset:image src="person-01.jpg" width="100px"/>
                        </figure>
                        <header>Catherine Brown</header>
                        <div class="rating" data-rating="4"></div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum,
                        sem ut sollicitudin consectetur, augue diam ornare massa, ac vehicula leo
                        turpis eget purus. Nunc pellentesque vestibulum mauris, eget suscipit mauris
                        imperdiet vel. Nulla et massa metus.
                        </p>
                    </div>
                </article>
                <!--end Reviews-->
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

<script>
    var _latitude = ${post.latitude};
    var _longitude = ${post.longitude};
    var draggableMarker = false;
    var scrollwheel = true;
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = createLink({uri: 'assets/external.js'});
        head.appendChild(script);
    }
    else {
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