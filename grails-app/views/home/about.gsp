<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>About Us</title>
</head>
<body class="external">

<div id="about" class="content-container">
    <div class="row">
        <div class="col-md-12">
            <div class="inner">
                <h1>About Us</h1>
                <article class="animate move_from_bottom_short">
                    <h3>Our Story</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis libero sem, fringilla quis molestie ut,
                    pharetra quis arcu. Donec posuere, tortor ac tincidunt mollis, turpis eros condimentum augue, at
                    blandit augue quam at urna. Vivamus efficitur tempor dignissim. Mauris volutpat sem a odio laoreet,
                    non eleifend orci lobortis.</p>
                </article>
                <article class="animate move_from_bottom_short">
                    <div class="promotion-box">
                        <div class="left">
                            <div class="image">
                                <img src="assets/about.jpg" alt="">
                            </div>
                        </div>
                        <div class="right average-color">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis libero sem, fringilla quis
                            molestie ut, pharetra quis </p>
                        </div>
                    </div>
                </article>
                <article class="animate move_from_bottom_short">
                    <h3>Why Us?</h3>
                    <p>Duis vestibulum nisi suscipit, tempor diam ut, mollis ligula. Nullam auctor eros quis odio egestas,
                    et feugiat augue finibus. Phasellus ac congue ante. Fusce varius dui nulla, finibus elementum augue
                    gravida in. Proin vestibulum mollis turpis in elementum. Fusce vel convallis ligula, sit amet
                    tincidunt nisi. Cras placerat nulla nibh, vel sodales enim sollicitudin vel. Sed tempus ullamcorper
                    nibh nec porttitor. Suspendisse porttitor luctus neque a auctor.</p>
                </article>
                <article class="animate move_from_bottom_short">
                    <h3>Our Satisfied Client</h3>
                    <div class="review block">
                        <figure class="person-image">
                            <img src="assets/person-01.jpg" alt="">
                        </figure>
                        <header>Catherine Brown</header>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vestibulum,
                        sem ut sollicitudin consectetur, augue diam ornare massa, ac vehicula leo
                        turpis eget purus. Nunc pellentesque vestibulum mauris, eget suscipit mauris
                        imperdiet vel. Nulla et massa metus.
                        </p>
                    </div>
                </article>
            </div>
        </div>
        <!--end .col-md-8-->
    </div>
    <!--end .row-->
</div>
<!--end #item-detail-->

<script>
    var element = document.querySelector('body');

    if( hasClass(element, 'external') ){
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "../assets/external.js";
        head.appendChild(script);
    }
    else {
        averageColor( $('.content-container') );
    }

    function hasClass(element, cls) {
        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
    }
</script>


</body>
</html>