<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 5/29/2017
  Time: 11:49 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>asssssasdas</title>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <script type="text/javascript" src="https://github.com/douglascrockford/JSON-js/blob/master/json2.js"></script>
</head>

<body>asdasda
${raw(html)}
<script>
    console.log("nguyen van giap")
    var itemlabel13 = $(".itemlabel3")
    var title = itemlabel13.find("a b")
    var _tile = []
    title.each(function (index, t) {
        _tile.push($(t).remove("span").html())
    })
//    console.log(_tile)
    var address = itemlabel13.find("a.go-right")
    var _address = []
    address.each(function (index, t) {
        _address.push($(t)[0].outerHTML)
    })
//    console.log(_address)
    var _tienichs = []

    itemlabel13.each(function (index, item) {
        var tienich = $(item).find(".facilities_item")
        var _tienich =[]
        tienich.each(function (index, t) {
            _tienich.push($(t).find("div").attr('title'))
        })
        _tienichs.push(_tienich)
    })
//    console.log(JSON.stringify(_tienichs))

    console.log("readyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy")
    $.ajax({
        url: "${createLink(controller: 'home', action: 'getData')}",
        method: 'POST',
        data: {title:_tile, address:_address, tienichs: _tienichs}
    }).done(function() {
        alert( "success" );
    }).fail(function() {
            alert( "error" );
    })

</script>
</body>
</html>