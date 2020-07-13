<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		equals : {
			validator : function(value, param) {
				return value == $(param[0]).val();
			},
			message : '两次密码不一致'
		}
	});
</script>

<script>
	//退出系统
	function logout() {
		$
				.ajax({
					url : "${pageContext.request.contextPath}/system/user/logout.action",
					type : "post",
					dataType : "json",
					success : function(d) {
						if (d.success) {
							window.location.href = "${pageContext.request.contextPath}/page/login.action"
						} else {
							alert("error");
						}
					}
				});
	}

	function showedit() {
		$('#editForm').form('reset');
		$('#editdiv').panel('open');

	}
	function editpwd() {
		$('#editForm').form('submit', {
			url : "${pageContext.request.contextPath}/system/user/edit.action",
			success : function(d) {
				json = $.parseJSON(d);
				if (json.success) {
					$('#editdiv').panel('close');
				}
				$.messager.show({
					title : '系统提示',
					msg : json.message,
					timeout : 1000,
					showType : 'slide'
				});
			}
		});
	}

	function lock() {
		$('#loginForm').form('reset');
		$('#lock_form').dialog('open');
		$
				.ajax({
					url : "${pageContext.request.contextPath}/system/user/logout.action",
					type : "post",
					dataType : "json",
					success : function(d) {
					}
				});
	}

	function login() {
		//做登录操作
		$('#loginForm')
				.form(
						'submit',
						{
							url : "${pageContext.request.contextPath}/system/user/login.action",
							//提交前的回调函数
							success : function(d) {
								json = $.parseJSON(d);
								if (json.success) {
									$('#lock_form').dialog('close');
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
</script>

<div>
	<div style="float: left;">
		<img height="73px" style="margin-left: 10px; margin-top: 2px;"
			alt="logo" src="${pageContext.request.contextPath}/img/logistics_logo.jpg">
	</div>
	<div style="float: right; margin-top: 45px;">

		<a href="javascript:void(0)" id="mb" class="easyui-menubutton"
			data-options="menu:'#mm',iconCls:'icon-man'">${user.name}</a>
		<div id="mm" style="width: 150px;">
			<div data-options="iconCls:'icon-edit'" onclick="showedit()">修改密码</div>
			<div class="menu-sep"></div>
			<div data-options="iconCls:'icon-lock' " onclick="lock()">锁定账号</div>
			<div data-options="iconCls:'icon-back'" onclick="logout()">退出系统</div>
		</div>
	</div>

	<div id="lock_form" class="easyui-dialog" title="锁定账号"
		style="width: 320px; height: 165px; padding: 10px"
		data-options="iconCls:'icon-cn',resizable:true,modal:true,closable:false,closed:true">
		<form id="loginForm" method="post">
			<div style="margin-bottom: 5px">
				账号：<input id="id" type="text" name="id"
					data-options="iconCls:'icon-man',required:true,prompt:'请输入账号'"
					class="easyui-textbox"
					style="width: 85%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				密码：<input id="pwd" type="password" name="password"
					data-options="iconCls:'icon-lock',required:true,prompt:'请输入密码'"
					class="easyui-textbox"
					style="width: 85%; height: 30px; padding: 12px">
			</div>
			<div>
				<a class="easyui-linkbutton" style="padding: 6px 0px; width: 100%;"
					onclick="login()"> <span style="font-size: 14px;">登录</span>
				</a>
			</div>
		</form>
	</div>

	<div id="editdiv" class="easyui-dialog" title="修改密码"
		style="width: 250px; height: 190px; padding: 5px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true,buttons:[{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){editpwd();}
			}]">
		<form id="editForm" method="post">
			<div style="margin-bottom: 5px">
				原来密码：<input id="oldpassword" type="password" name="oldpassword"
					data-options="iconCls:'icon-man',required:true,prompt:'请输入密码'"
					class="easyui-textbox"
					style="width: 66%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				新的密码：<input id="newpassword" type="password" name="newpassword"
					data-options="iconCls:'icon-lock',required:true,prompt:'请输入密码'"
					class="easyui-textbox"
					style="width: 66%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				确认密码：<input id="renewpassword" type="password" name="renewpassword"
					data-options="iconCls:'icon-lock',required:true,prompt:'请输入密码' ,validType:'equals[\'#newpassword\']'"
					class="easyui-textbox"
					style="width: 66%; height: 30px; padding: 12px">
			</div>
		</form>
	</div>

</div>
