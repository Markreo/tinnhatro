<div id="update">
    <div role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#sign-in" aria-controls="sign-in" role="tab" data-toggle="tab" data-transition-parent="#sign-in" aria-expanded="true">Đăng nhập</a></li>
            <li role="presentation" class=""><a href="#register" aria-controls="register" role="tab" data-toggle="tab" data-transition-parent="#register" aria-expanded="false">Đăng kí</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane idle active" id="sign-in">
                <g:formRemote name="login_form" url="/j_spring_security_check" role="form" method="post" id="form-sign-in" update="update">
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0s;">
                        <input type="text" class="form-control" id="sing-in-name" name="j_username" placeholder="Tài khoản">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.07s;">
                        <input type="password" class="form-control" id="sing-in-email" name="j_password" placeholder="Mật khẩu">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.14s;">
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    </div>
                    <!--end .form-group-->
                </g:formRemote>
            </div>
            <div role="tabpanel" class="tab-pane idle" id="register">
                <form role="form" method="post" id="form-register">
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0s;">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.07s;">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.14s;">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.21s;">
                        <input type="password" class="form-control" id="confirm-password" name="confirm-password" placeholder="Confirm Password">
                    </div>
                    <!--end .form-group-->
                    <div class="form-group animate move_from_bottom_short idle" style="transition-delay: 0.28s;">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                    <!--end .form-group-->
                </form>
            </div>
        </div>
    </div>
</div>
