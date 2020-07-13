<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<jsp:include page="../easyui.jsp"></jsp:include>


<script type="text/javascript">
	function save() {
		$('#roleAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/system/role/editRole.action',    
		    success:function(d){    
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
	
	$(function () {
		$('#authIds').combotree('setValues',[${role.authStr}]);
	});
</script>
</head>
<body>
	<div
		style="padding-left: 70px; padding-right: 70px; padding-top: 20px; padding-bottom: 20px;">
		<form id="roleAddForm" method="post">
			<input type="hidden" name="id" value="${role.id}" />
			<div style="margin-bottom: 5px">
				名称：<input id="name" type="text" name="name" value="${role.name}"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				备注：
				<textarea
					style="width: 280px; height: 80px; border-radius: 5px; border: 1px solid #FFAEB9;"
					id="mark" name="mark">${role.mark}</textarea>
			</div>

			<div style="margin-bottom: 5px">
				权限：<select id="authIds" name="authIds" class="easyui-combotree"
					style="width: 80%; height: 30px; padding: 12px"
					data-options="url:'${pageContext.request.contextPath}/system/auth/combotree.action',panelHeight:260,required:true,multiple:true"></select>
			</div>

			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-add'">添加</a>
			</div>
		</form>
	</div>
</body>
</html>