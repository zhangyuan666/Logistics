<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>仓库发货(未完成)</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">

function save() {
	$('#driverTaskForm').form('submit',{
		url : '${pageContext.request.contextPath}/department/warehouse/driverTask.action',
		success : function(d) {
			json = $.parseJSON(d);
			if (json.success) {
				parent.closeShipment();
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
<body class="easyui-layout">
<div style="padding-left:70px;padding-right: 70px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="driverTaskForm" method="post">		
		<div style="margin-bottom: 5px">
			配送人员：<input id="driverId" name="driverId" class="easyui-combobox"
			style="width: 75%; height: 30px; padding: 12px;"
			data-options="valueField:'driverId',editable:false,multiple:true,textField:'driverName',panelHeight:120,
			url:'${pageContext.request.contextPath}/department/warehouse/driverIdCombobox.action'" />
		</div>
		<div style="margin-bottom: 5px">
			配送任务：<input id="driverTask" type="text" name="driverTask" 
			data-options="required:true,prompt:'请输入任务详情'" class="easyui-textbox"
				style="width: 75%; height: 30px; padding: 12px">
		</div>
		<div style="text-align: center;">
			<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加任务</a>  
		</div>
	</form>
</div>
</body>
</html>