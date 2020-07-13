<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>权限新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
function save() {
	$('#authAddForm').form('submit', {    
	    url:'${pageContext.request.contextPath}/system/auth/addAuth.action',    
	    success:function(d){    
	    	var json = $.parseJSON(d);
			if (json.success) {
				parent.closeAdd();
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
		style="padding-left: 50px; padding-right: 50px; padding-top: 20px; padding-bottom: 20px;">
		<form id="authAddForm" method="post">
			<div style="margin-bottom: 5px">
				权限名称：<input id="name" type="text" name="name"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				权限备注：<input id="mark" type="text" name="mark"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				权限URL：<input id="url" type="text" name="url"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				权限排序：<input id="seq" type="text" name="seq"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				上级权限：<select id="pid" name="pid" class="easyui-combotree"
					style="width: 80%; height: 30px; padding: 12px"
					data-options="url:'${pageContext.request.contextPath}/system/auth/combotree.action',panelHeight:260,required:true"></select>
			</div>

			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-add'">添加</a>
			</div>
		</form>
	</div>
</body>
</html>