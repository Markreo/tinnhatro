<div class="widget flat">
    <div class="widget-body">
        <br>
        <div id="warring"></div>
        <div id="horizontal-form">
            <g:formRemote name="register" url="[controller: 'user', action: 'saveRegitser']" class="form-horizontal" role="form" autocomplete="off" update="warring"  onSuccess="onFailure(data)">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Tên liên hệ</label>
                            <input type="text" class="form-control" name="name" autocomplete="off" />
                            <div class="horizontal-space"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
                                <label>Số điện thoại</label>
                                <input type="text" class="form-control" name="phone" autocomplete="off" />
                                <div class="horizontal-space"></div>
                        </div>
                        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" autocomplete="off" />
                                <div class="horizontal-space"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" class="form-control" name="username" autocomplete="off" />
                            <div class="horizontal-space"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" class="form-control" name="password" autocomplete="off"/>
                            <div class="horizontal-space"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" name="repassword" autocomplete="off"/>
                            <div class="horizontal-space"></div>
                        </div>
                    </div>
                </div>
                <div class="loginbox-submit">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-2">
                                <input type="submit" class="btn btn-info btn-block" value="Đăng ký">
                            </div>
                        </div>
                    </div>
                </div>
            </g:formRemote>
        </div>
    </div>
</div>
<script>
    function onFailure(data) {
        console.log(data)
        if (data.success) {
            console.log('reload')
            window.location.reload();
        } else {
            console.log('error')
            $("#warning").html(data.error);
        }
    }
</script>