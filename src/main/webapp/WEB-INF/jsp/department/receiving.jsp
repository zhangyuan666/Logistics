<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>仓库收货</title>
<jsp:include page="../easyui.jsp"></jsp:include>
</head>
<script type="text/javascript">

function save() {
	$('#courierTaskForm').form('submit',{
		url : '${pageContext.request.contextPath}/department/warehouse/courierTask.action',
		success : function(d) {
			json = $.parseJSON(d);
			if (json.success) {
				parent.closeReceiving();
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
			快递员名：<input id="courierIds" name="courierId" class="easyui-combobox"
					style="width: 75%; height: 30px; padding: 12px;"
					data-options="valueField:'courierId',
					editable:false,textField:'courierName',panelHeight:140,
					url:'${pageContext.request.contextPath}/department/warehouse/courierIdCombobox.action'" />
			</div>
			<div style="margin-bottom: 5px">
			配送任务：<input id="courierTask" type="text" name="courierTask"
					data-options="required:true,prompt:'请输入配送任务'  " class="easyui-textbox"
					style="width: 75%; height: 30px; padding: 12px">
			</div>
			<div style="text-align: center; ">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加任务</a>  
			</div>
	</form>
</div>
</body>
</html>