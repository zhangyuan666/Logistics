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

<title>个人信息</title>

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
<script type="text/javascript">
	function add() {
		$.ajax({
					type : "POST",
					dataType : "json",
					data : {
						userTel : $('#userTel').val(),
						userName : $('#userName').val(),
						userProvinces : $('#userProvinces').val(),
						userAddress : $('#userAddress').val()
					},
					url : "${pageContext.request.contextPath}/client/user/editUser.action",

					success : function(d) {
						var json = JSON.parse(JSON.stringify(d));
						if (json.success) {
							window.location.href = "${pageContext.request.contextPath}/dingdan/send.action";
						} else {
							layer.alert(d.message, {icon: 6});
						}
					},
				});
	}
	function logout() {

		$.ajax({
					url : "${pageContext.request.contextPath}/dingdan/logout.action",
					method : "post",
					dataType : "json",
					success : function(d) {
						if (d.success) {
							window.location.href = "${pageContext.request.contextPath}/page/userlogin.action";
						}
					}
				});
	}
</script>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block"
						style="background-image: url(${pageContext.request.contextPath}/admin/img/photo-1517519014922-8fc06b814a0e.jpg);background-position: center;
  background-size: cover;"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">个人信息修改！</h1>
								<p class="mb-4">我们明白，人总是在变化！</p>
								<p class="mb-4">只需在下面输入您的新的信息，我们将帮助重新更改！</p>
							</div>

							<form class="user" id="userAddForm" method="post">
								<div class="form-group">
									<input id="userTel" type="text" name="userTel"
										class="form-control form-control-user"
										value="${sessionScope.userinfo.userTel}" placeholder="电话号码...">
								</div>
								<div class="form-group">
									<input id="userName" type="text" name="userName"
										class="form-control form-control-user"
										value="${sessionScope.userinfo.userName}" placeholder="昵称...">
								</div>
								<div class="form-group">
									<input id="userProvinces" type="text" name="userProvinces"
										class="form-control form-control-user"
										value="${sessionScope.userinfo.userProvinces}"
										placeholder="省市信息...">
								</div>
								<div class="form-group">
									<input id="userAddress" type="text" name="userAddress"
										class="form-control form-control-user"
										value="${sessionScope.userinfo.userAddress}"
										placeholder="地址...">
								</div>

								<a  href="#" onclick="add()" class="btn btn-primary btn-user btn-block"> 立即修改 </a> 
									<a
									href="${pageContext.request.contextPath}/dingdan/index.action"
									class="btn btn-danger btn-user btn-block"> 暂不修改 </a>
								<hr>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/sb-admin-2.min.js"></script>

</body>

</html>
