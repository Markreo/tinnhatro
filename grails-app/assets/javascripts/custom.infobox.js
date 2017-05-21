Number.prototype.formatMoney = function(c, d, t){
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};
function drawInfobox(infoboxContent, json, i){
    var ibContent = '';
    var urls = ['/assets/default-item-blue.png', '/assets/default-item-pink.png', '/assets/default-item-green.png', '/assets/default-item-yellow.png']

    var tienichContent = '';
    //TODO: có thể tienichs.each để nhanh hơn
    for(j = 0; j < json.data[i].tienich.length; j++) {
        console.log( json.data[i].tienich[j].name)
        tienichContent += '<li>' + json.data[i].tienich[j].name +'</li>'
    }

    if(tienichContent.length) {
        tienichContent = '<article class="animate move_from_bottom_short"><h3>Tiện ích:</h3><ul class="bullets">' + tienichContent + '</ul></article>'
    }

    ibContent =
        '<div class="infobox">' +
        '<div class="left">' +
                '<a href="'+ createLink({controller: 'post', action: 'detail', id: json.data[i].id}) +'" data-expand-width="col-9" data-transition-parent=".content-loader" data-external="true">' +
                '<div class="image">' +
                    '<div class="price average-color"><span>' + json.data[i].gia.formatMoney(0, '.', ',') + ' đ</span></div>' +
                    '<img src="' + createLink({controller: 'media', action: 'getImage', id: json.data[i].image[0]}) + '"/> ' +
                '</div>' +
                '<header class="average-color">' +
                    '<h1 class="animate move_from_top_short">'+ json.data[i].tieude +'</h1>' +
                    '<h2 class="animate move_from_top_short"><span>'+ json.data[i].diachi +'</span></h2>' +
                '</header>' +
            '</a>' +
        '</div>' +
        '<div class="right">' +
            '<article class="animate move_from_top_short">' +
                '<h3>Mô tả</h3>' +
                '<p>' +  json.data[i].mota+'...</p>' +
            '</article>' +
            '<article class="animate move_from_top_short">' +
            '<h3 style="display: inline-block">Ngày đăng:  </h3>' +
            '<span> 20/05/2017 10:02' +  json.data[i].dateCreated+ '</span>' +
            '</article>' +
            '<article class="animate move_from_top_short">' +
            '<h3 style="display: inline-block">Hết hạn: </h3>' +
            '<span> 23/05/2017' +  json.data[i].dateCreated+ '</span>' +
            '</article>' +
            tienichContent +
        '</div>' +
    '</div>';
    return ibContent;
}