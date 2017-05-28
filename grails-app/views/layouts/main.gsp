<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title><g:layoutTitle default="Quản lí nhà trọ"></g:layoutTitle></title>
	%{--<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />--}%
	<asset:stylesheet src="application.css"/>

	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">
	<asset:javascript src="application.js"/>
	<asset:javascript src="spring-websocket" />
	<g:layoutHead/>
</head>

<body>
<div class="loading-container">
	<div class="loader"></div>
</div>
<g:render template="/layouts/navbar"/>
<div class="main-container container-fluid">
	<div class="page-container ">
		<g:render template="/layouts/sidebar"/>
		<g:render template="/layouts/chatbar"/>
		<div class="page-content">
			<g:layoutBody/>
		</div>
	</div>
</div>
<asset:javascript src="beyond.min.js"/>
<asset:javascript src="chat.js" />
</body>
</html>