<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
	$.extend($.fn.validatebox.defaults.rules, {
		checkUserid : {
			validator : function(value, param) {
				var boo = true;
				 $.ajax({
				    	url:'${pageContext.request.contextPath}/system/user/checkUserid.action',
				    	type:'post',
				    	data:{
				    		id:value
				    	},
				    	async:false,
				    	dataType:'json',
				    	success:function(d){
				    		if(d.success){
				    			boo = false;
				    		}
				    	}
				    });
				return boo;
			},
			message : '此账号已被占用'
		}
	});
</script>


<script type="text/javascript">
	function save() {
		$('#userAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/system/user/addUser.action',    
		    success:function(d){    
		    	json = $.parseJSON(d);
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
<div style="padding-left:70px;padding-right: 70px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="userAddForm" method="post">
		<div style="margin-bottom: 5px">
				账号：<input id="id" type="text" name="id"
					data-options="required:true,prompt:'请输入账号' ,validType:'checkUserid'"   class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				姓名：<input id="name" type="text" name="name"
					data-options="required:true,prompt:'请输入姓名'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			
			<div style="margin-bottom: 5px">
				密码：<input id="password" type="password" name="password"
					data-options="required:true,prompt:'请输入密码'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			<div style="margin-bottom: 5px">
				确认：<input id="repassword" type="password" name="repassword"
					data-options="required:true,prompt:'请确认密码',validType:'checkPwd[\'#password\']'" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px">
			</div>
			
			<div style="margin-bottom: 5px">
				角色：<input id="roleIds" name="roleIds" class="easyui-combobox"  style="width: 80%; height: 30px; padding: 12px;"
    data-options="valueField:'id',editable:false,multiple:true,textField:'name',panelHeight:120,url:'${pageContext.request.contextPath}/system/role/roleCombobox.action'" />  
				 
			</div>
			
			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
			</div>
	</form>
</div>
</body>
</html>