<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Khách thuê</title>
    <meta name="layout" content="main"/>
    <style>
    @-moz-document url-prefix() {
        .input-icon{
            margin-top: 6px;
        }
    }
    </style>
</head>

<body>
<tnt:breadcrumbs current="Users"/>
<div class="page-body">
    <div class="widget">
        <div class="widget-header">
            <div class="widget-caption">
                Danh sách người đăng tin
            </div>
            <div class="widget-buttons">
                <span class="input-icon">
                    <input id="search-input" type="text" class="form-control input-xs" id="glyphicon-search" placeholder="Tìm kiếm">
                    <i class="glyphicon glyphicon-search blue"></i>
                </span>
            </div>
        </div>
        <div class="widget-body">
            %{--<qlnhatro:message/>--}%
            <div class="table-toolbar pull-right">
                <div class="btn-group">
                    <a href="${createLink(controller: 'renter',action: 'create')}" class="btn btn-azure" rel="bootbox"><i class="fa fa-plus"></i> Thêm</a>
                </div>
            </div>
            <table id="renters" class="table table-hover table-striped table-bordered">
                <thead class="bordered-blueberry">
                <tr>
                    <th>
                        #
                    </th>
                    <th>
                        Ten
                    </th>
                    <th>
                        Ho va Ten Dem
                    </th>
                    <th>
                        ngay sinh
                    </th>
                    <th>
                        gioi tinh
                    </th>
                    <th>
                        Phong
                    </th>
                    <th width="15%"></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div class="clearfix"/>
        </div>
    </div>
</div>
<script>
    Datatable.init("#renters", "${createLink(controller: 'renter', action: 'renters')}", "#search-input");
    $(document).on('click', "a[rel='bootbox']", function (event) {
        console.log('botbox')
        event.preventDefault();
        var url = this.href;
        $.post(url, function(html) {
            bootbox.dialog({
                title: 'Khách thuê',
                message: html
            });
        });
    })
</script>
</body>
</html>