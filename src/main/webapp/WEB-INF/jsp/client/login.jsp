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

<title>登录</title>

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
<script type="text/javascript">
function login(){
	var bool = true;
	if(bool){
  	if ($("#id").val()==null) 
  		{
  			alert("请输入用户名！");
  			bool = false;
  		}
  	if ($("#password").val()==null) 
		{
			alert("请输入密码！");
			bool = false;
			}
	}
  	if(bool){ 		
  		$.ajax({
  	        type: "POST",
  	        dataType: "json",
  	        data: {
  	        	   id : $('#id').val(),
  	        	   password : $('#password').val()
  	        },    
  	        url:"${pageContext.request.contextPath}/client/user/login.action",            
  	        success: function (d) {
  	        	var json = JSON.parse(JSON.stringify(d));
  	        	//json = $.parseJSON(d);
  	        	if(json.success){
  	            	window.location.href="${pageContext.request.contextPath}/dingdan/index.action";
  	        	}else{
  	        		alert(json.message);  
  	        	}
  	        },
        });
  	}
}
  
 
</script>

<style>
.contentDiv {
	margin: 15px;
}
</style>

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block" style="background-image: url(${pageContext.request.contextPath}/admin/img/photo-1518020382113-a7e8fc38eac9.jpg);background-position: center;
  background-size: cover;"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">欢迎回来！</h1>
									</div>
									<form class="user" id="loginForm" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="id" name="id" required="required"
												placeholder="请输入用户名...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="password" name="password" required="required" placeholder="请输入密码...">
										</div>
										
										<a class="btn btn-primary btn-user btn-block"
											onclick="login()"> <font color="white">登录</font>
										</a>

										<hr>
										<a href="#" class="btn btn-google btn-user btn-block"> <i
											class="fab fa-google fa-fw"></i> QQ登陆
										</a> <a href="#" class="btn btn-facebook btn-user btn-block">
											<i class="fab fa-facebook-f fa-fw"></i> 微信登陆
										</a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="${pageContext.request.contextPath}/page/findpassword.action">忘记密码？</a>
									</div>
									<div class="text-center">
										<a class="small" href="${pageContext.request.contextPath}/page/register.action">还没有账户？立即注册！</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	
	<script src="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/bootstrap/js/sb-admin-2.min.js"></script>

</body>

</html>
