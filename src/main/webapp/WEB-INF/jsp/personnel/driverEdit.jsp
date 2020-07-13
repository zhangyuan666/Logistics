<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">
	function save() {
		$('#driverInfoAddForm')
				.form(
						'submit',
						{
							url : '${pageContext.request.contextPath}/personnel/driverInfo/editDriverInfo.action',
							success : function(d) {
								json = $.parseJSON(d);
								if (json.success) {
									parent.closeEdit();
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
	<div
		style="padding-left: 70px; padding-right: 70px; padding-top: 20px; padding-bottom: 20px;">
		<form id="driverInfoAddForm" method="post">
			<div style="margin-bottom: 5px">
				配送员ID：&nbsp;&nbsp;&nbsp;&nbsp;<input id="driverId" type="text" name="driverId" value="${driverInfo.driverId}"
					data-options="required:true,prompt:'请输入ID' " readonly="readonly"
					class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px; border: 0px;">
			</div>

			<div style="margin-bottom: 5px">
				姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="driverName" type="text" name="driverName" value="${driverInfo.driverName}"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px;">
			</div>

			<div style="margin-bottom: 5px">
				电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="driverTel" type="text" name="driverTel" value="${driverInfo.driverTel}"
					data-options="prompt:'请输入电话'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				服务点任务：&nbsp;<input id="driverTask" type="text" name="driverTask"  value="${driverInfo.driverTask}"
					data-options="prompt:'请输入服务点名称'"
					class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				服务点ID：&nbsp;&nbsp;&nbsp;&nbsp;<input id="warehouseId" name="warehouseId" value="${warehouseInfo.warehouseId}"
					data-options="prompt:'请输入服务点ID'"
					class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">

			</div>

			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-edit'">修改</a>
			</div>
		</form>
	</div>
</body>
</html>