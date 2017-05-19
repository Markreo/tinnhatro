var elementID = document.getElementById('item-detail');
var element = document.querySelector('body');

if( hasClass(element, 'external') ){
    loadCss();
}
else {
    simpleMap(_latitude, _longitude,draggableMarker, scrollwheel);
    rating();
    averageColor( $('.content-container') );
}

function loadJquery(){
    loadScript( createLink({uri: 'assets/jquery-2.1.0.min.js'}), jQueryLoaded);
}

function hasClass(element, cls) {
    return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
}

function loadScript(url, callback)
{
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    script.onreadystatechange = callback;
    script.onload = callback;
    head.appendChild(script);
}

function loadCss(){
    var cssArray = [
        createLink({uri: 'assets/fonts/font-awesome.css'}), "http://fonts.googleapis.com/css?family=Roboto:700,400,300",
        createLink({uri: 'assets/bootstrap/css/bootstrap.min.css'}),
        createLink({uri: 'assets/style.css'})
    ];
    for( var i=0; i<cssArray.length; i++ ){
        var head = document.getElementsByTagName('head')[0];
        var link = document.createElement('link');
        link.type = 'text/css';
        link.rel  = 'stylesheet';
        link.href = cssArray[i];
        head.appendChild(link);
        if( i == cssArray.length-1 ){
            loadScript( createLink({uri: 'assets/functions.js'}), loadJquery );
        }
    }
}