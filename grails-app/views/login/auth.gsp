<!DOCTYPE html>
<head>
	<meta charset="utf-8" />
	<title>Login Page</title>

	<meta name="description" content="login page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
	<asset:stylesheet src="bootstrap.min.css"/>
	<asset:stylesheet src="font-awesome-4.7.0/css/font-awesome.css"/>
	<asset:stylesheet src="beyond.min.css"/>
	<asset:javascript src="jquery.min.js"/>



</head>
<body>
<div class="login-container animated fadeInDown">
	<div class="loginbox bg-white">


		<div class="loginbox-title">SIGN IN</div>
		<div class="loginbox-social">
			<div class="social-title ">Connect with Your Social Accounts</div>
			<div class="social-buttons">
				<a href="http://graph.facebook.com/oauth/authorize?client_id=458116954528502&scope=public_profile,email&redirect_uri=${createLink(controller: 'home',action: 'getToken', absolute: true)}" class="button-facebook">
					<i class="social-icon fa fa-facebook"></i>
				</a>
				<a href="javascript:void(0)" class="button-twitter">
					<i class="social-icon fa fa-twitter"></i>
				</a>
				<a href="javascript:void(0)" class="button-google">
					<i class="social-icon fa fa-google-plus"></i>
				</a>
			</div>
		</div>
		<div class="loginbox-or">
			<div class="or-line"></div>
			<div class="or">OR</div>
		</div>
		<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
			<div class="loginbox-textbox">
				<input type="text" name="${usernameParameter ?: 'username'}" class="form-control" id="username" placeholder="Số điện thoại"/>
			</div>
			<div class="loginbox-textbox">
				<input type="password" name="${passwordParameter ?: 'password'}" class="form-control" id="password" placeholder="Mật khẩu"/>
			</div>
			<div class="loginbox-forgot">
				<a href="">Forgot Password?</a>
			</div>

			<div class="loginbox-submit">
				<input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}" class="btn btn-primary btn-block"/>
			</div>
		</form>
		<div class="loginbox-signup">
			<a href="${createLink(controller: 'user', action: 'register')}">Tạo tài khoản</a>
		</div>
	</div>
	<div class="logobox">
	</div>
</div>
</body>
</html>
