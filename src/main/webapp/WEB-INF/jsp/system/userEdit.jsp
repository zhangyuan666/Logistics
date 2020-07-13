<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		checkPwd : {
			validator : function(value, param) {
				return value == $(param[0]).val();
			},
			message : '两次密码不一致'
		}
	});
</script>


<script type="text/javascript">
	$(function() {
		$.ajax({
					url : '${pageContext.request.contextPath}/system/user/setValues.action',
					type : 'post',
					data : {
						id : "${u.id}"
					},
					dataType : 'json',
					success : function(d) {
						var roleids = [];
						if (d) {
							for (var i = 0; i < d.length; i++) {
								roleids[i] = d[i].roleid;
							}
							$('#roleIds').combobox('setValues', roleids);
						}
					}
				});
	});

	function save() {
		$('#userEditForm')
				.form(
						'submit',
						{
							url : '${pageContext.request.contextPath}/system/user/editUser.action',
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
		<form id="userEditForm" method="post">
			<div style="margin-bottom: 5px">
				账号：<input id="id" type="text" name="id" value="${u.id}"
					data-options="required:true,prompt:'请输入账号' " readonly="readonly"
					class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px; border: 0px;">
			</div>

			<div style="margin-bottom: 5px">
				姓名：<input id="name" type="text" name="name" value="${u.name}"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px;">
			</div>

			<div style="margin-bottom: 5px">
				密码：<input id="password" type="password" name="password"
					data-options="prompt:'请输入密码'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				确认：<input id="repassword" type="password" name="repassword"
					data-options="prompt:'请确认密码',validType:'checkPwd[\'#password\']'"
					class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>

			<div style="margin-bottom: 5px">
				角色：<input id="roleIds" name="roleIds" class="easyui-combobox"
					style="width: 80%; height: 30px; padding: 12px;"
					data-options="valueField:'id',editable:false,multiple:true,textField:'name',panelHeight:120,url:'${pageContext.request.contextPath}/system/user/roleCombobox.action'" />

			</div>

			<div style="margin-bottom: 5px">
				状态：<select id="status" class="easyui-combobox" name="status"
					style="width: 80%; height: 30px; padding: 12px;"
					data-options="editable:false,panelHeight:47">
					<option value="0"
						<c:if test="${u.status == '0' }">selected="selected" </c:if>>正常</option>
					<option value="1"
						<c:if test="${u.status == '1' }">selected="selected" </c:if>>锁定</option>
				</select>
			</div>

			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-edit'">修改</a>
			</div>
		</form>
	</div>
</body>
</html>