/*
var tabs = [];
tabs = JSON.parse(readCookie("tab_url"));

function submitform(id) {
    if(id == undefined){
        $("#page-body").find("form").submit()
    } else{
        $("#page-body").find("form#" + id).submit()
    }

}

function cancel() {
    GoLastTab();
    SaveCookie();
}

//save Cookie
function SaveCookie(url) {
    var cookie = [];
    if(tabs){
        $.each(tabs, function(idx, val){
            cookie.push(val);
        });
    }
    if(url){
        cookie.push(url);
    }
    createCookie('tab_url', JSON.stringify(cookie));
}

function complete_form(data) {
    console.log('complete form')
    console.log(data)

    if(typeof data.reload != 'undefined'){
        if(data.reload){
            location.reload();
        }
        return;
    }

    if (typeof data.update !== 'undefined') {
        if (!$.isArray(data.update)) {
            data.update = $.makeArray(data.update);
        }
        $.each(data.update, function (idx, val) {
            $("#" + data.update[idx].position).html(data.update[idx].content);
        });
    }

    if(typeof data.close != 'undefined'){
        GoLastTab();
    }
    if(typeof data.error != 'undefined'){
        $("#main_error").show();
        $("#main_error_content").html("");
        $("#main_error_content").append(data.message.content);
    }
    if(typeof  data.message != 'undefined'){
        console.log('notify')
        var icon;
        switch (data.message.type){
            case 'success': icon =  'fa-check'; break;
            case 'error': icon = 'fa-times'; break;
            case 'warring': icon = 'fa-warning'; break;
            default: icon = 'fa-info'; break;
        }
        Notify(data.message.content, 'top-right', '5000', data.message.type, icon, true);
    }

    if(typeof data.code != 'undefined'){
        console.log(data.code)
        switch (data.code){
            case 'update_region': {
                loadpage();
            }; break;
        }
    }
}

//Go tab
function GoTab(url) {
    $.post(url, function (html) {
        $("#page-body").html(html);
    })
}

//last tab
function GoLastTab() {
    if(tabs.length){
        var url_older = tabs.pop();
        GoTab(url_older);
    } else{
        $("#page-body").html("");
    }
    SaveCookie();
}

var loadpage = function () {
   /!* $.post("home/loadpage", function (data) {
        $("#main_userName").html(data.username);
        $("#main_dashboard").html(data.regionname);
        $("#main_regions").remove("a[rel='region']");
        $("#main_regions").append(data.list);
    });*!/
}

$(document).ready(function () {

    loadpage();

    //COOKIE
    if(tabs){
        var url = tabs[tabs.length - 1];
        if(url){
            $.post(url, function (html) {
                $("#page-body").html(html);
            })
        }
    }

    //NEW TAB
    $(document).on('click', "a[rel='new-tab']", function (event) {
        event.preventDefault();
        var url = $(this).attr('href');
        SaveCookie(url);
        GoTab(url);
    });

    $("input[rel='vnd']").each(function (idx, input) {
        $(input).customCurrency();
    })
});

function fixparse(value) {
    if(value == '') {
        return ''
    }
    return value = value.replace('-,', '-') + ' đ'
}

function parseVnd(value) {
    var str = '';
    if(value == 0 && value != '' ) {
        return '0';
    }
    if(Number(value)) {
        str = value + '';
        var dv = str.substring(str.length - 3, str.length );
        var ng = str.substring(str.length - 6, str.length - 3);
        var tr = str.substring(str.length - 9, str.length - 6);
        var ty = str.substring(str.length - 12, str.length - 9);
        if(str.length > 9) {
            return ty + ',' + tr + ',' + ng + ',' + dv;
        }
        if(str.length > 6) {
            return tr + ',' + ng + ',' + dv;
        }
        if(str.length > 3) {
            return ng + ',' + dv;
        }
        return dv;
    }
    return '';
};
$.fn.customCurrency = function (options) {
    if ($(this).length == 0) {
        return false;
    }

    var input = $(this);
    var prev = '';

    if (this.parent().find("span[rel='mark']").length == 0) {
        var span = $('<span>', {rel: 'mark'});
        span.text(fixparse(parseVnd(input.val())));
        input.after(span);

        input.off('focus');
        input.on('focus', function () {
            span.hide();
            prev = input.val();
        });
        input.off('focusout');
        input.on('focusout', function () {
            span.show();
        });
        input.off('change');
        input.on('change', function (e) {
            var t = fixparse(parseVnd(input.val()));
            if(t == '') {
                input.val(prev).trigger('change')
            } else {
                span.text(t);
            }

            return false;
        });
        span.off('click');
        span.on('click', function () {
            input.trigger('focus')
        })
    }
};
*/
