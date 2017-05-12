<div class="widget flat">
	<div class="widget-header bordered-bottom bordered-pink">
		<span class="widget-caption"><i class="menu-icon glyphicon glyphicon-log-out"></i> Login</span>
	</div>

	<div class="widget-body">
		<div id="warring"></div>
		<div id="horizontal-form">
			<g:formRemote name="login" url="[uri: '/login/authenticate']" class="form-horizontal" role="form" autocomplete="off" onSuccess="onFailure(data)">
				<div class="row">
					<div class="col-md-12">
						<label>Tài khoản đăng nhập</label>
						<input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off" />
						<div class="horizontal-space"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label>Mật khẩu</label>
						<input type="password" class="form-control" placeholder="Password" name="password" autocomplete="off"/>
						<div class="horizontal-space"></div>
					</div>
				</div>
				<div class="loginbox-submit">
					<input type="submit" class="btn btn-primary btn-block" value="Login">
				</div>
			</g:formRemote>
		</div>
	</div>
</div>
<script>
    function onFailure(data) {
        console.log(data)
        if (data.success) {
            window.location.reload();
        } else {
            $("#warning").html(data.error);
        }
    }
</script>