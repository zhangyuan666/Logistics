<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>找回密码</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
  <jsp:include page="../easyui.jsp"></jsp:include>
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
              <div class="col-lg-6 d-none d-lg-block" style="background-image: url(${pageContext.request.contextPath}/admin/img/photo-1517519014922-8fc06b814a0e.jpg);background-position: center;
  background-size: cover;"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">忘记你的密码?</h1>
                    <p class="mb-4">我们明白了，事情总会发生。只需在下面输入您的用户名和旧密码，我们将帮助您重置密码！</p>
                  </div>
                  <form class="user" id="userAddForm" method="post">
                    <div class="form-group">
                      <input id="id" type="text" name="id" class="form-control form-control-user" placeholder="输入用户名...">
                    </div>
					<div class="form-group">
					  <input id="tel" type="text" name="tel"" class="form-control form-control-user" placeholder="输入手机号...">
					</div>
					<div class="form-group">
					  <input id="newpassword" type="password" name="newpassword" class="form-control form-control-user" placeholder="输入新密码...">
					</div>
					<div class="form-group">
					  <input id="newpasswords" type="password" name="newpasswords" class="form-control form-control-user" placeholder="再次输入新密码...">
					</div>
                    <a id="editpwd" onclick="editpwd()" class="btn btn-primary btn-user btn-block">
                   <font color="white">修改密码</font>  
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath}/page/register.action">还没有账户？立即注册！</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath}/page/login.action">已有账户？立即登录！</a>
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
<script type="text/javascript">
function editpwd(){
	
	layui.use('layer', function(){
		  var layer = layui.layer;
		}); 
	var bool = true;
	if(bool){
  	if ($("#id").val()==null||$("#id").val()=="") 
  		{
  		layer.msg('请输入用户名！', function(){
		});
  			bool = false;
  		}
  	if ($("#tel").val()==null||$("#tel").val()=="") 
		{
  		layer.msg('请输入手机号码！', function(){
		});
			bool = false;
			}
  	if ($("#newpassword").val()==null||$("#newpassword").val()=="") 
  		{
  		layer.msg('请输入新密码！', function(){
		});
  			bool = false;
  			}
  	if ($("#newpasswords").val()==null||$("#newpasswords").val()=="") 
		{
  		layer.msg('请确认密码！', function(){
		});
			bool = false;
			}
	}
	if(bool){
  	var pd1=$("#newpassword").val();
  	var pd2=$("#newpasswords").val();
  	if (pd1!=pd2) 
  		{
  		layer.msg('两次密码不一致！', function(){
		});
  			bool = false;
 			 }
  	if(bool){
  		$.ajax({
  	        type: "POST",
  	        dataType: "json",
  	        data: {
  	        	   id :$('#id').val(),
  	        	   userTel : $('#tel').val(),
  	        	   newpassword : $('#newpassword').val()
  	        },    
  	        url:"${pageContext.request.contextPath}/client/user/find.action",            
  	        success: function (d) {
  	        	var json = JSON.parse(JSON.stringify(d));
  	        	if(json.success){
  	            	window.location.href="${pageContext.request.contextPath}/page/userlogin.action";
  	        	}else{
  	        		layer.msg(json.message, function(){
  	      		});
  	        	}
  	        },
        });
  	}
	}
  }

</script>
</html>
