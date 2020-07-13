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

  <title>add</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.error{
	color:red;
	font-size: 12px;
}
</style>
</head>

<body id="page-top">


     

                 <form id="addform">
                <div class="card-body">
                  <div class="chart-bar">
                  
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
            		 <input type="hidden" class="form-control form-control-user"  id="userInfoId" name="userInfoId" value="${sessionScope.wuliu.userInfoId}">

                    <input type="text" class="form-control form-control-user"  id="recipientName" name="recipientName" placeholder="收件人姓名..." >
            
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="recipientTel" name="recipientTel" placeholder="电话..." >
                   
                  </div>
                </div>
                 <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user"  id="recipientProvinces" name="recipientProvinces" placeholder="省市区.." >
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user"  id="recipientAddress" name="recipientAddress"  placeholder="详细地址..." >
                </div>
              
                <button onclick="recipientInfoedit()" class="btn btn-primary btn-user btn-block">
                  确认添加
                </button>
           
                  </div>
                
                </div>
      </form>
 

 



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
<script src="${pageContext.request.contextPath}/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="${pageContext.request.contextPath}/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
</body>
<script type="text/javascript">
function addform_validate() {
	// 在键盘按下并释放及提交后验证提交表单
	 var validate= $("#addform").validate({
	    rules: {
	    	recipientName: {
	        required: true,
	        minlength: 2
	      },
	      recipientTel: {
	        required: true,
	    	digits:true,
	        minlength: 11,
	        maxlength: 11
	      },
	      recipientProvinces: {
	        required: true
	       
	      },
	      recipientAddress: {
	        required: true
	      }
	    },
	    messages: {
	      
	    	recipientName: {
	        required: "请输入姓名",
	        minlength: "姓名必需由两个字符组成"
	      },
	      password: {
	        required: "请输入电话号",
	        minlength: "电话号长度不能小于 11个字符",
	        minlength: "电话号长度不能大于 11个字符"
	      },
	      recipientProvinces: {
	        required: "请输入省市区",
	       
	      },
	      recipientProvinces: {
		        required: "请输入详细地址",
		       
		      },  submitHandler:function(form){
		            alert("提交事件!");   
		            form.submit();
		        }   
	     
	     }
	    }).form();
	return validate;
}
	function recipientInfoedit(){
		if(!addform_validate()) return;
			 $.ajax({
				url : "${pageContext.request.contextPath}/dingdan/recipientInfoadd.action",
				method : "post",
				data : {
					
					recipientName : $("#recipientName").val(),
					recipientProvinces : $("#recipientProvinces").val(),
					recipientAddress : $("#recipientAddress").val(),
					userInfoId : $("#userInfoId").val(),
					recipientTel : $("#recipientTel").val()
					
				},
				dataType : "json",
				async: false,
				success : function(d) {
					if(d.success){
						parent.closeadd();
						 
					}else{
						alert(d.message);
					}
				}
			});
	
			
		
	}
	
</script>
</html>
