<div class="widget flat">
	<div class="widget-body">
		<div id="warring"></div>
		<div id="horizontal-form">
			<g:formRemote name="login" url="[uri: '/login/authenticate']" class="form-horizontal" role="form" autocomplete="off" onSuccess="onFailure(data)">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label>Tài khoản đăng nhập</label>
							<input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off" />
							<div class="horizontal-space"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label>Mật khẩu</label>
							<input type="password" class="form-control" placeholder="Password" name="password" autocomplete="off"/>
							<div class="horizontal-space"></div>
						</div>
					</div>
				</div>
				<div class="loginbox-submit">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-2">
								<input type="submit" class="btn btn-info btn-block" value="Đăng Nhập">
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-2">
								<a href="${createLink(controller: 'user', action: 'register')}" class="btn btn-info btn-block">Đăng ký</a>
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
            window.location.reload();
        } else {
            $("#warning").html(data.error);
        }
    }
</script>