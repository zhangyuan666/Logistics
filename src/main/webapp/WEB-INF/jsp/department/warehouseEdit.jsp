<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改仓库</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">

</script>
<script type="text/javascript">
	function save() {
		$('#warehouseEditForm').form('submit',{
			url : '${pageContext.request.contextPath}/department/warehouse/editWarehouse.action',
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
		<form id="warehouseEditForm" method="post">
			<div style="margin-bottom: 5px">
				仓库编号：<input id="warehouseId" type="text" name="warehouseId" value="${warehouseInfo.warehouseId}"
					data-options="required:true,prompt:'请输入账号' " readonly="readonly" 
					class="easyui-textbox"
					style="width: 75%; height: 30px; padding: 12px; border: 0px;">
			</div>
			<div style="margin-bottom: 5px">
				仓库名称：<input id="warehouseName" type="text" name="warehouseName" value="${warehouseInfo.warehouseName}"
					data-options="required:true,prompt:'请输入仓库名称' "
					class="easyui-textbox"
					style="width: 75%; height: 30px; padding: 12px; border: 0px;">
			</div>
			<div style="margin-bottom: 5px">
				详细地址：<input id="warehouseAddress" type="text" name="warehouseAddress" value="${warehouseInfo.warehouseAddress}"
					data-options="required:true,prompt:'请输入详细地址'" class="easyui-textbox"
					style="width: 75%; height: 30px; padding: 12px;">
			</div>
			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-edit'">修改</a>
			</div>
		</form>
	</div>
</body>
</html>