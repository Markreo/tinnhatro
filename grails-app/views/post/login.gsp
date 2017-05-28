<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 5/24/2017
  Time: 2:52 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
</head>
<body>
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

<div class="fb-comments" data-href="https://www.facebook.com/photo.php?fbid=806931572791134&set=a.101931746624457.5112.100004228951422&type=3" data-numposts="5"></div>
</body>
</html>