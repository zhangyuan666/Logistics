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
		$('#courierInfoAddForm')
				.form(
						'submit',
						{
							url : '${pageContext.request.contextPath}/personnel/courierInfo/editCourierInfo.action',
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
		<form id="courierInfoAddForm" method="post">
			<div style="margin-bottom: 5px">
				快递员ID：&nbsp;&nbsp;&nbsp;&nbsp;<input id="courierId" type="text" name="courierId" value="${courierInfo.courierId}"
					data-options="required:true,prompt:'请输入ID' " readonly="readonly"
					class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px; border: 0px;">
			</div>

			<div style="margin-bottom: 5px">
				姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="courierName" type="text" name="courierName" value="${courierInfo.courierName}"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px;">
			</div>

			<div style="margin-bottom: 5px">
				电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="courierTel" type="text" name="courierTel" value="${courierInfo.courierTel}"
					data-options="prompt:'请输入电话'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				服务点任务：&nbsp;<input id="courierTask" type="text" name="courierTask"  value="${courierInfo.courierTask}"
					data-options="prompt:'请输入服务点名称'"
					class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				服务点ID：&nbsp;&nbsp;&nbsp;&nbsp;<input id="serviceId" name="serviceId" value="${courierInfo.serviceId}"
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