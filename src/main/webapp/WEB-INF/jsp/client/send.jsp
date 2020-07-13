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

  <title>寄件</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet"  "type="text/css"  href="${pageContext.request.contextPath}/layui/layui/css/layui.css">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

 <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
      
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">中软物流</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/dingdan/index.action">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>主页</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        
      </div>

   

       <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dingdan/wuliu.action">
          <i class="fas fa-fw fa-table"></i>
          <span>物流查询</span></a>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
     

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dingdan/send.action">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>我要寄件</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dingdan/shoujianren.action">
          <i class="fas fa-fw fa-table"></i>
          <span>新增收件人</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

    

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

         
            

            <!-- Nav Item - Alerts -->
         
           

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.userlogin.userNickname}</span>
                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/img/dog.jpg">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/dingdan/userinfo.action">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400" ></i>
                  个人信息
                </a>
             
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  登出
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">我要寄件</h1>
          <p class="mb-4">请填写您的寄件人信息和收件人信息以及物流信息</p>

          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7">

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">寄件人</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                 
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user"  value="${sessionScope.send.userName}" id="userName" placeholder="昵称...">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user"  value="${sessionScope.send.userProvinces}" id="userProvinces" placeholder="省市区...">
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user"  value="${sessionScope.send.userTel}" id="userTel" placeholder="电话号...">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user"  value="${sessionScope.send.userAddress}" id="userAddress" placeholder="地址...">
                </div>
                
                <a href="${pageContext.request.contextPath}/dingdan/userinfo.action" class="btn btn-primary btn-user btn-block">
                  修改信息
                </a>
            
                  </div>
                  
                </div>
              </div>

              <!-- Bar Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">收件人</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                  
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" value="${sessionScope.recipientInfo.recipientName}" id="recipientName" placeholder="昵称...">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user"  value="${sessionScope.recipientInfo.recipientProvinces}" id="recipientProvinces" placeholder="省市区...">
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" value="${sessionScope.recipientInfo.recipientTel}" id="recipientTel" placeholder="电话号...">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" value="${sessionScope.recipientInfo.recipientAddress}" id="recipientAddress" placeholder="地址...">
                </div>
                
                <a href="${pageContext.request.contextPath}/dingdan/shoujianren.action" class="btn btn-primary btn-user btn-block">
                  新增收件人
                </a>
           
                  </div>
                 
                </div>
              </div>
<div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">物流信息</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="cargoName" placeholder="货物名称...">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="cargoCategory" placeholder="货物类别...">
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="cargoWeight" placeholder="货物重量...">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="serviceName" placeholder="服务点地址...">
                </div>
                
                <button onclick="xiadan()" class="btn btn-primary btn-user btn-block">
                  立即下单
                </button>
           
                  </div>
                 
                </div>
              </div>
            </div>

           
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>China Logistics &copy; 中软物流</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">准备好离开了吗?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
       <div class="modal-body">如果您准备结束当前的会话，请选择下面的“登出”。</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
          <a class="btn btn-primary" href="#" onclick="logout()">登出</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/bootstrap/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/bootstrap/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/js/demo/chart-pie-demo.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/js/demo/chart-bar-demo.js"></script>

</body>

<script src="${pageContext.request.contextPath}/layui/layui/layui.js"></script>
 <script type="text/javascript">
	function xiadan(){
		
		layui.use('layer', function(){
			  var layer = layui.layer;
			}); 
		
		$.ajax({
			url : "${pageContext.request.contextPath}/dingdan/dingdan.action",
			method : "post",
			data : {
				cargoName : $("#cargoName").val(),
				cargoCategory : $("#cargoCategory").val(),
				cargoWeight : $("#cargoWeight").val(),
				serviceName : $("#serviceName").val(),
				recipientName : $("#recipientName").val(),
				userName : $("#userName").val()
			},
			dataType : "json",
			success : function(d) {
				if(d.success){
					layer.alert(d.message, {icon: 6});
				}else{
					layer.msg(d.message, function(){
						});
				}
			}
		});
	}
	
	
	function logout() {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/dingdan/logout.action",
			method : "post",
			dataType : "json",
			success : function(d) {
				if(d.success){	
					window.location.href="${pageContext.request.contextPath}/page/userlogin.action";
				}
			}
		});
	}
</script>
</html>
