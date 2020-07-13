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
		checkServiceId : {
			validator : function(value, param) {
				var boo = true;
				 $.ajax({
				    	url:'${pageContext.request.contextPath}/department/serviceInfo/checkServiceId.action',
				    	type:'post',
				    	data:{
				    		serviceId:value
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
		$('#serviceInfoAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/serviceInfo/addserviceInfo.action',    
		    success : function(d){    
		    	d = $.parseJSON(d);
				if (d.success) {
					parent.closeAdd();
					
				}
				parent.$.messager.show({
					title : '提示',
					msg : d.message,
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
	<form  id="serviceInfoAddForm" method="post">
		<div style="margin-bottom: 5px">
				服务点的ID：<input id="serviceId" type="text" name="serviceId"
					data-options="required:true,prompt:'请输入ID' ,validType:'checkServiceId'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				服务点名称：<input id="serviceName" type="text" name="serviceName"
					data-options="required:true,prompt:'请输入名称'  " class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				服务点地址：<input id="serviceAddress" type="text" name="serviceAddress"
					data-options="required:true,prompt:'请输入地址'  " class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>
			
			
			
			<div style="text-align: center;padding-top: 10px;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
			</div>
	</form>
</div>
</body>
</html>