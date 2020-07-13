<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../easyui.jsp"></jsp:include>
<title>批量导入</title>

<script type="text/javascript">
	function imp() {
		$('#impForm').form('submit', {
			url : '${pageContext.request.contextPath}/system/user/imp.action',
			success : function(d) {
				json = $.parseJSON(d);
				if (json.success) {
					parent.closeImp();
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
	<form id="impForm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>模板下载</td>
				<td><input name="userFile" class="easyui-filebox"
					style="width: 150px;" /></td>
				<td><a onclick="imp()" class="easyui-linkbutton">上传</a></td>
			</tr>
		</table>
	</form>
</body>
</html>