<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		checkCourierid : {
			validator : function(value, param) {
				var boo = true;
				 $.ajax({
				    	url:'${pageContext.request.contextPath}/personnel/courierInfo/checkCourierid.action',
				    	type:'post',
				    	data:{
				    		courierId:value
				    	},
				    	async:false,
				    	dataType:'json',
				    	success:function(d){
				    		if(d.success){
				    			boo = false;
				    		}
				    	}
				    });
				return boo;
			},
			message : '此ID已被占用'
		}
	});
</script>


<script type="text/javascript">
	function save() {
		$('#courierAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/personnel/courierInfo/addCourierInfo.action',    
		    success:function(d){    
		    	json = $.parseJSON(d);
				if (json.success) {
					parent.closeAdd();
				}
				parent.$.messager.show({
					title : '提示',
					msg : json.message,
					timeout : 1000,
					showType : 'slide'
				});  
		    }    
		});  
	}
</script>
</head>
<body>
<div style="padding-left:70px;padding-right: 70px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="courierAddForm" method="post">
	
		<div style="margin-bottom: 5px">
				快递员ID：&nbsp;&nbsp;&nbsp;<input id="courierId" type="text" name="courierId"
					data-options="required:true,prompt:'请输入快递员ID' ,validType:'checkCourierid'"   class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="courierName" type="text" name="courierName"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="courierTel" type="text" name="courierTel"
					data-options="required:true,prompt:'请输入电话'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				服务点任务：<input id="courierTask" type="text" name="courierTask"
					data-options="required:true,prompt:'请确认服务点'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				服务点ID：&nbsp;&nbsp;&nbsp;<input id="serviceId" type="text" name="serviceId"
					data-options="required:true,prompt:'请确认服务点ID'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			
			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
			</div>
	</form>
</div>
</body>
</html>