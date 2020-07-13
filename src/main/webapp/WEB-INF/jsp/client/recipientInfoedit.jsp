<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="en">
 <script type="text/javascript">
	function recipientInfoedit(){
		$.ajax({
			url : "${pageContext.request.contextPath}/dingdan/recipientInfoedit.action",
			method : "post",
			data : {
				recipientId: $("#recipientId").val(),
				recipientName : $("#recipientName").val(),
				recipientProvinces : $("#recipientProvinces").val(),
				recipientAddress : $("#recipientAddress").val(),
				recipientTel : $("#recipientTel").val()
				
			},
			dataType : "json",
			success : function(d) {
				if(d.success){
					parent.closeedit();
					 
				}else{
					alert(d.message);
				}
			}
		});
	}
</script>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>edit</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">


     

               
                <div class="card-body">
                  <div class="chart-bar">
                    
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                  <input type="hidden" id="recipientId" name="recipientId"  value="${RecipientInfo.recipientId}" />
                    <input type="text" class="form-control form-control-user" value="${RecipientInfo.recipientName}" id="recipientName" placeholder="收件人姓名...">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" value="${RecipientInfo.recipientTel}" id="recipientTel" placeholder="电话...">
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" value="${RecipientInfo.recipientProvinces}" id="recipientProvinces" placeholder="省市区..">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" value="${RecipientInfo.recipientAddress}" id="recipientAddress"  placeholder="详细地址...">
                </div>
                
                <button onclick="recipientInfoedit()" class="btn btn-primary btn-user btn-block">
                  确认修改
                </button>
           
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

</html>
