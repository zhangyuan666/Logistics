<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>


<script type="text/javascript">
	function save() {
		$('#serviceInfoEditForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/serviceInfo/editserviceInfo.action',    
		    success : function(d){    
		    	d = $.parseJSON(d);
				if (d.success) {
					parent.closeEdit();
					
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
	<form  id="serviceInfoEditForm" method="post">
		<div style="margin-bottom: 5px">
				服务点的ID：<input id="serviceId" type="text" name="serviceId" value="${serviceInfo.serviceId}"
					data-options="required:true" readonly="readonly" 
					style="width: 60%; height: 30px; padding: 12px;border: 0px">
			</div>
			<div style="margin-bottom: 5px">
				服务点名称：<input id="serviceName" type="text" name="serviceName" value="${serviceInfo.serviceName}"
					data-options="required:true,prompt:'请输入名称'  " class="easyui-textbox"
					style="width: 60%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				服务点地址：<input id="serviceAddress" type="text" name="serviceAddress" value="${serviceInfo.serviceAddress}"
					data-options="required:true,prompt:'请输入地址'  " class="easyui-textbox"
					style="width: 60%; height: 30px; padding: 12px">
			</div>
			
			
			
			<div style="text-align: center;padding-top: 10px;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>  
			</div>
	</form>
</div>
</body>
</html>