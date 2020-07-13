<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>
 

<script type="text/javascript">


		

	function save() {
		$('#serviceInfoDeliveryForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/serviceInfo/receiveserviceInfo.action',    
		    success : function(d){    
		    	d = $.parseJSON(d);
				if (d.success) {
					parent.closeReceive();
					
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
	<form  id="serviceInfoDeliveryForm" method="post">
		
			<div style="margin-bottom: 5px">
			快递员名：<input id="courierIds" name="courierId" class="easyui-combobox"
					style="width: 70%; height: 30px; padding: 12px;"
					data-options="valueField:'courierId',
					editable:false,textField:'courierName',panelHeight:140,
					url:'${pageContext.request.contextPath}/department/serviceInfo/courierCombobox.action',required:true" />

			</div>
			<div style="margin-bottom: 5px">
			揽件任务：<input id="courierTask" type="text" name="courierTask"
					data-options="required:true,prompt:'请输入揽件任务'  " class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>
			
			<div style="text-align: center;padding-top: 10px; ">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">揽件</a>  
			</div>
	</form>
</div>
</body>
</html>