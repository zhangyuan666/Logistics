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


		 /*setValues查询中间表  我是一个表没用上
		 
		 $(function() {
			$.ajax({
						url : '${pageContext.request.contextPath}/department/serviceInfo/setValues.action',
						type : 'post',
						
						dataType : 'json',
						success : function(d) {
							var courierIds = [];
							if (d) {
								for (var i = 0; i < d.length; i++) {
									courierIds[i] = d[i].courierId;
								}
								$('#courierIds').combobox('setValues', courierIds);
							}
						}
					});
		});  */ 
		

	function save() {
		$('#serviceInfoDeliveryForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/serviceInfo/deliveryserviceInfo.action',    
		    success : function(d){    
		    	d = $.parseJSON(d);
				if (d.success) {
					parent.closeDelivery();
					
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
			订单编号：<input id="orderId" name="orderId" class="easyui-combobox"
					style="width: 70%; height: 30px; padding: 12px;"
					data-options="valueField:'orderId',
					editable:false,textField:'orderId',panelHeight:140,
					url:'${pageContext.request.contextPath}/department/serviceInfo/orderCombobox.action',required:true" />
			</div>	
		
			<div style="margin-bottom: 5px">
			快递员名：<input id="courierIds" name="courierId" class="easyui-combobox"
					style="width: 70%; height: 30px; padding: 12px;"
					data-options="valueField:'courierId',
					editable:false,textField:'courierName',panelHeight:100,
					url:'${pageContext.request.contextPath}/department/serviceInfo/courierCombobox.action',required:true" />

			</div>
			<div style="margin-bottom: 5px">
			配送任务：<input id="courierTask" type="text" name="courierTask"
					data-options="required:true,prompt:'请输入配送任务'  " class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>
			
			<div style="text-align: center; padding-top: 10px;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-back'">配送</a>  
			</div>
	</form>
</div>
</body>
</html>