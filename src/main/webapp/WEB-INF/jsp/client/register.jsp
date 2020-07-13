<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Register</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css"
	rel="stylesheet">
<jsp:include page="../easyui.jsp"></jsp:include>


</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block"
						style="background-image: url(${pageContext.request.contextPath}/admin/img/photo-1517849845537-4d257902454a.jpg);background-position: center;
  background-size: cover;"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">注册账户！</h1>
							</div>
							<form class="user" id="userAddForm" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="userNickname" name="userNickname" placeholder="昵称...">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user"
											id="userId" name="userId" placeholder="姓名...">
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="userTel" name="userTel" placeholder="手机号码...">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										id="userPwd" name="userPwd" placeholder="密码...">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										id="repassword" name="rePwd" placeholder="确认密码...">
								</div>

								<a id="btn" onclick="add()"
									class="btn btn-primary btn-user btn-block"> <font
									color="white">立即注册</font>
								</a>

								<hr>
								<a href="index.html" class="btn btn-google btn-user btn-block">
									<i class="fab fa-google fa-fw"></i> 通过QQ注册
								</a> <a href="index.html"
									class="btn btn-facebook btn-user btn-block"> <i
									class="fab fa-facebook-f fa-fw"></i> 通过微信注册
								</a>
							</form>
							<hr>
							<div class="text-center">
								<a class="small"
									href="${pageContext.request.contextPath}/page/findpassword.action">忘记密码?</a>
							</div>
							<div class="text-center">
								<a class="small"
									href="${pageContext.request.contextPath}/page/login.action">已有账户？立即登录！</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/sb-admin-2.min.js"></script>

</body>
<script type="text/javascript">
	function add() {
		layui.use('layer', function() {
			var layer = layui.layer;
		});
		var bool = true;
		if (bool) {
			if ($("#userId").val() == null || $("#userId").val() == "") {
				layer.msg('请输入用户名！', function() {
				});
				bool = false;
			}
			if ($("#userNickname").val() == null|| $("#userNickname").val() == "") {
				layer.msg('请输入昵称！', function() {
				});
				bool = false;
			}
			if ($("#userTel").val() == null || $("#userTel").val() == "") {
				layer.msg('请输入手机号码！', function() {
				});
				bool = false;
			}
			if ($("#userPwd").val() == null || $("#userPwd").val() == "") {
				layer.msg('请输入密码！', function() {
				});
				bool = false;
			}
		}
		if (bool) {
			var pd1 = $("#userPwd").val();
			var pd2 = $("#repassword").val();
			if (pd1 != pd2) {
				layer.msg('两次密码不一致！', function() {
				});
				bool = false;
			}
			if (bool) {
				$
						.ajax({
							type : "POST",
							dataType : "json",
							data : {
								userNickname : $('#userNickname').val(),
								userId : $('#userId').val(),
								userTel : $('#userTel').val(),
								userPwd : $('#userPwd').val()
							},
							url : "${pageContext.request.contextPath}/client/user/addUser.action",
							success : function(d) {
								var json = JSON.parse(JSON.stringify(d));
								if (json.success) {
									window.location.href = "${pageContext.request.contextPath}/page/userlogin.action";
								} else {
									layer.alert(d.message, {
										icon : 6
									});
								}
							},
						});
			}
		}
	}
</script>

</html>
