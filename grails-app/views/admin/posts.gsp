<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Quản lý bài post</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="page-body">
    <div class="widget">
        <div class="widget-header">
            <div class="widget-caption">
                Danh sách các bài post
            </div>
            <div class="widget-buttons">
                <span class="input-icon">
                    <input id="search-input" type="text" class="form-control input-xs" placeholder="Tìm kiếm">
                    <i class="glyphicon glyphicon-search themeprimary"></i>
                </span>
            </div>
        </div>
        <div class="widget-body">
            <div class="table-toolbar pull-right">
                <div class="btn-group">
                    <a href="${createLink(controller: 'post',action: 'adminCreate')}" class="btn btn-primary" rel="bootbox"><i class="fa fa-plus"></i> Thêm</a>
                </div>
            </div>
            <table id="data-table-posts" class="table table-hover table-striped table-bordered">
                <thead class="bordered-blueberry">
                    <tr>
                        <th>
                            #
                        </th>
                        <th>
                            người đăng
                        </th>
                        <th>
                            Tiêu đề
                        </th>
                        <th>
                            Loại
                        </th>
                        <th>
                            Trạng thái
                        </th>
                        <th>
                            Địa chỉ
                        </th>
                        <th>
                            Image
                        </th>
                        <th>
                            Giá
                        </th>
                        <th>
                            Rate
                        </th>
                        <th>Fanpage</th>
                        <th>Group</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        Datatable.init("#data-table-posts", "${createLink(controller: 'admin', action: 'posts')}", "#search-input");
    });
    $(document).on('click', "a[rel='bootbox']", function (event) {
        console.log('botbox')
        event.preventDefault();
        var url = this.href;
        $.post(url, function(html) {
            bootbox.dialog({
                title: 'Tạo bài post',
                message: html
            });
        });
    })
</script>

</body>
</html>