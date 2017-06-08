/**
 * Created by giapn on 10/13/16.
 */
var Datatable = function () {
    var table;
    var ajaxParams = {};

    return {
        empty: function() {
            return this;
        },
        init: function(id, url, input) {
            table = $(id).DataTable( {
                "bDestroy": true,
                bAutoWidth: false,
                "bSort": false,
                "bFilter": false,
                "processing": true,
                "serverSide": true,
                "ajax": { url: url, data: function (data) {
                    $.each (ajaxParams, function (key, value) {
                        data[key] = value;
                    })}
                }
            });

            $(id + "_paginate").css("margin-top", "10px");
            $(id + "_paginate").css("float", "right");

            $(input).keyup(
                $.debounce(function () {
                    ajaxParams['search'] = $(input).val();
                    table.draw();
                    return;
                }, 1000)
            );
        },

        setAjaxParam: function (name, value) {
            ajaxParams[name] = value;
        },

        addAjaxParam: function (name, value) {
            if (!ajaxParams[name]) {
                ajaxParams[name] = [];
            }

            skip = false;
            for (var i = 0; i < (ajaxParams[name]).length; i++) { // check for duplicates
                if (ajaxParams[name][i] === value) {
                    skip = true;
                }
            }

            if (skip === false) {
                ajaxParams[name].push(value);
            }
        },

        clearAjaxParams: function (name, value) {
            ajaxParams = {};
        },

        getTable: function () {
            return table;
        },
        submit: function() {
            table.draw();
        }
    }
}();
