<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>权限修改</title>
<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
function save() {
	$('#authEditForm').form('submit', {    
	    url:'${pageContext.request.contextPath}/system/auth/editAuth.action',    
	    success:function(d){    
	    	var json = $.parseJSON(d);
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
	$('#pid').combotree('setValue',${auth.pid});
});
</script>
</head>
<body>
<div style="padding-left:50px;padding-right: 50px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="authEditForm" method="post">
	
		<input type="hidden" id = "id" name = "id" value ="${auth.id}"/>
			
		<div style="margin-bottom: 5px">
				权限名称：<input id="name" type="text" name="name" value ="${auth.name}"
					data-options="required:true"   class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				权限备注：<input id="mark" type="text" name="mark" value ="${auth.mark}"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			
			<div style="margin-bottom: 5px">
				权限URL：<input id="url" type="text" name="url" value ="${auth.url}"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				权限排序：<input id="seq" type="text" name="seq" value ="${auth.seq}"
					data-options="required:true" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			
			<div style="margin-bottom: 5px">
				上级权限：<select id="pid" name="pid" class="easyui-combotree" style="width: 80%; height: 30px; padding: 12px"  
        data-options="url:'${pageContext.request.contextPath}/system/auth/combotree.action',panelHeight:260,required:true"></select>  
			</div>
			
			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
			</div>
	</form>
</div>
</body>
</html>