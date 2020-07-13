<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<jsp:include page="easyui.jsp"></jsp:include>
<script type="text/javascript">
	function reloadImg() {
		$("#img").attr(
				"src",
				"${pageContext.request.contextPath}/img/img.action?r="
						+ Math.random());
	}

	function login() {
		//做登录操作
		$('#loginForm').form(
						'submit',
						{
							url : "${pageContext.request.contextPath}/system/user/login.action",
							//提交前的回调函数
							onSubmit : function() {
								//先验证表单是否符合校验要求
								var isValid = $(this).form('validate');
								if (isValid) {
									//先校验验证码是否正确
									return checkImgCode(); // 如果验证码不通过就不提交
								}
								return false; // 返回false终止表单提交
							},
							success : function(d) {
								json = $.parseJSON(d);
								if (json.success) {
									//跳转主页
									window.location.href = "${pageContext.request.contextPath}/page/index.action";
								} else {
									$.messager.show({
										title : '系统提示',
										msg : json.message,
										timeout : 1000,
										showType : 'slide'
									});
								}
							}
						});
	}

	function checkImgCode() {
		var pass = false;
		$.ajax({
			url : "${pageContext.request.contextPath}/img/imgCode.action",
			type : "post",
			data : {
				imgCode : $("#imgCode").val()
			},
			dataType : "json",
			async : false,//设置ajax为同步提交，为了让代码阻塞，return最后执行
			success : function(d) {
				if (d.success) {
					pass = true;
				} else {
					$.messager.show({
						title : '我的消息',
						msg : d.message,
						timeout : 1000,
						showType : 'slide'
					});

				}
			}
		});
		return pass;
	}
	
	function userlogin() {
		location.href='${pageContext.request.contextPath}/page/userlogin.action';
	}
</script>

<style>
.contentDiv {
	margin: 15px;
}
</style>
</head>
<body>

	<div >
		<img alt="" src="${pageContext.request.contextPath}/img/sky.jpg" width="1480px" height="740px">
		<div class="easyui-dialog" title="物流管理"
			style="width: 320px; height: 210px; padding: 10px"
			data-options="iconCls:'icon-log',resizable:true,modal:true,closable:false">
			
			<form id="loginForm" method="post">
				<div style="margin-bottom: 5px">
					<input id="id" type="text" name="id"
						data-options="iconCls:'icon-man',required:true,prompt:'请输入账号'"
						class="easyui-textbox"
						style="width: 100%; height: 30px; padding: 12px">
				</div>
				<div style="margin-bottom: 5px">
					<input id="pwd" type="password" name="password"
						data-options="iconCls:'icon-lock',required:true,prompt:'请输入密码'"
						class="easyui-textbox"
						style="width: 100%; height: 30px; padding: 12px">
				</div>
				<div style="margin-bottom: 5px">
					<input id="imgCode" class="easyui-textbox" type="text"
						style="width: 45%; height: 30px; padding: 12px"
						data-options="required:true,prompt:'请输入验证码'" /> <img id="img"
						style="margin: 0 0 0 3px; vertical-align: middle; height: 26px;"
						src="${pageContext.request.contextPath}/img/img.action"> <a
						onclick="reloadImg()" class="easyui-linkbutton"
						data-options="plain: true, iconCls:'icon-reload'">换一张</a>
				</div>
				<a class="easyui-linkbutton" style="padding: 6px 0px; width: 49%;"
					onclick="login()"> <span style="font-size: 14px;">登录</span>
				</a>
				<a class="easyui-linkbutton" style="padding: 6px 0px; width: 49%;"
					onclick="userlogin()"> <span style="font-size: 14px;">主页</span>
				</a>
			</form>
		</div>

	</div>
</body>
</html>
