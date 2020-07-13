<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>物流查询</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript">

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
</script>

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
          <h1 class="h3 mb-2 text-gray-800">物流查询</h1>
          <p class="mb-4">查看您的物流状态以及信息</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">物流信息</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>订单编号</th>
                      <th>货物名称</th>
                      <th>物流信息</th>
                      <th>订单创建时间</th>
                      <th>快递员姓名</th>
                      <th>联系电话</th>
                       <th>是否收货</th>
                    </tr>
                  </thead>
                
                  <tbody>
                   <c:forEach items="${OrderInfo}" var="o">
                    <tr>
                      <td>${o.orderId}</td>
                      <td>${o.cargoInfo.cargoName}</td>
                      <td><c:forEach var="l" items="${o.logList}" varStatus="index">
                       ${l.logisticsInfo}
                      <c:if test="${index.last==false}">
                        ,
                      </c:if>
                     </c:forEach></td>
                      <td><fmt:formatDate value="${o.orderCreattime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      <td>${o.courierInfo.courierName}</td>
                      <td>${o.courierInfo.courierTel}</td>
                      <c:if test="${o.orderState==0}">
                      <td>配送中</td>
                      </c:if>
                      <c:if test="${o.orderState==1}">
                      <td>已收货</td>
                      </c:if>
                    </tr>
                     </c:forEach>
                  </tbody>
                </table>
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
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>
