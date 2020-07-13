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
		checkDriverid : {
			validator : function(value, param) {
				var boo = true;
				 $.ajax({
				    	url:'${pageContext.request.contextPath}/personnel/driverInfo/checkDriverid.action',
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
		$('#driverAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/personnel/driverInfo/addDriverInfo.action',    
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
	<form  id="driverAddForm" method="post">
	
		<div style="margin-bottom: 5px">
				配送员ID：&nbsp;&nbsp;&nbsp;<input id="driverId" type="text" name="driverId"
					data-options="required:true,prompt:'请输入配送员ID' ,validType:'checkDriverid'"   class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="driverName" type="text" name="driverName"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="driverTel" type="text" name="driverTel"
					data-options="required:true,prompt:'请输入电话'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				服务点任务：<input id="driverTask" type="text" name="driverTask"
					data-options="required:true,prompt:'请确认服务点'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 10px">
			</div>
			
			<div style="margin-bottom: 5px">
				服务点ID：&nbsp;&nbsp;&nbsp;<input id="warehouseId" type="text" name="warehouseId"
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