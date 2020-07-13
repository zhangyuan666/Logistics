<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>物流更新</title>
<jsp:include page="../easyui.jsp"></jsp:include>
</head>
<script type="text/javascript">
function save() {
	$('#courierTaskForm').form('submit',{
		url : '${pageContext.request.contextPath}/department/warehouse/logisticsInfoUpdate.action',
		success : function(d) {
			json = $.parseJSON(d);
			if (json.success) {
				parent.closelogisticsUpdate();
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

<body class="easyui-layout">
<div style="padding-left:70px;padding-right: 70px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="courierTaskForm" method="post">		
		<div style="margin-bottom: 5px">
			订单编号：<input id="orderIds" name="orderId" class="easyui-combobox"
			style="width: 75%; height: 30px; padding: 12px;"
			data-options="valueField:'orderId',editable:false,multiple:true,textField:'orderId',panelHeight:120,
			url:'${pageContext.request.contextPath}/department/warehouse/logisticsIdCombobox.action'" />
		</div>
		<div style="margin-bottom: 5px">
			物流信息：<input id="logisticsInfo" type="text" name="logisticsInfo" 
			data-options="required:true,prompt:'请输入'" class="easyui-textbox"
				style="width: 75%; height: 30px; padding: 12px">
		</div>
		<div style="text-align: center;">
			<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">更新物流信息</a>  
		</div>
	</form>
</div>
</body>
</html>