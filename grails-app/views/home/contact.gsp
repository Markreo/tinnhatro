<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
    #map-simple { min-height: 240px; }
    </style>

    <title>Contact</title>
</head>
<body class="external">

<div id="contact" class="content-container">
    <div class="row">
        <div class="col-md-12">
            <div class="inner">
                <h1>Contact</h1>
                <article class="animate move_from_bottom_short">
                    <div class="row">
                        <div class="col-md-5">
                            <h3>Address</h3>
                            <address>
                                Real Estate Limited<br>
                                63 Birch Street<br>
                                Granada Hills, CA 91344<br>
                                <br>
                                <a href="tel:818-832-5258">818-832-5258</a><br>
                                <a href="tel:+1 123 456 789">+1 123 456 789</a><br>
                                <a href="mailto:hello@example.com">hello@example.com</a><br>
                                <a href="http://www.example.com">www.example.com</a>
                            </address>
                        </div>
                        <div class="col-md-7">
                            <h3>Map</h3>
                            <div id="map-simple"></div>
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h3>Contact Form</h3>
                    <form role="form" method="post" class="clearfix">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="person-name" name="person-name" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control" id="person-email" name="person-email" placeholder="Email">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="4" placeholder="Message"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Send Message</button>
                        </div>
                    </form>
                </article>
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

<script>
    var _latitude = 51.541599;
    var _longitude = -0.112588;
    var draggableMarker = false;
    var scrollwheel = true;
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "../assets/external.js";
        head.appendChild(script);
    }
    else {
        simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }

</script>


</body>
</html>