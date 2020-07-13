<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>用户</title>

<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/system/user/query.action',
							fit : true,
							border : false,
							pagination : true,
							rownumbers : true,
							striped : true,
							nowrap : false,
							sortName : 'id',
							sortOrder : 'asc',
							toolbar : [ {
								iconCls : 'icon-add',
								text : '新增',
								handler : function() {
									add();
								}
							}, '-', {
								iconCls : 'icon-edit',
								text : '修改',
								handler : function() {
									userEdit();
								}
							}, '-', {
								iconCls : 'icon-remove',
								text : '删除',
								handler : function() {
									remove();
								}
							},'-', {
								iconCls : 'icon-filter',
								text : '批量导入',
								handler : function() {
									imp();
								}
							}, '-', {
								iconCls : 'icon-lock',
								text : '重置密码',
								handler : function() {
									resetPwd();
								}
							} ],
							frozenColumns : [ [ {
								field : 'checkbox',
								title : '账号',
								checkbox : true
							}, {
								field : 'id',
								title : '账号',
								width : 100,
								sortable : true
							}, {
								field : 'name',
								title : '名称',
								width : 100,
								sortable : true
							} ] ],
							columns : [ [ {
								field : 'password',
								title : '密码',
								width : 100,
								formatter : function(value) {
									return "******";
								}
							}, {
								field : 'roles',
								title : '角色',
								width : 200,
								formatter : function(value) {
									var roles = [];
									if (value) {
										for (var i = 0; i < value.length; i++) {
											roles.push(value[i].name);
										}
									}
									return roles.join(",");
								}
							}, {
								field : 'status',
								title : '状态',
								width : 100,
								formatter : function(value) {
									return value == 0 ? "正常" : "锁定";
								}
							}, {
								field : 'createid',
								title : '新增人员',
								width : 100
							}, {
								field : 'createtime',
								title : '新增时间',
								width : 130,
								sortable : true
							}, {
								field : 'modifyid',
								title : '修改人员',
								width : 100
							}, {
								field : 'modifytime',
								title : '修改时间',
								width : 130
							} ] ]
						});
	});

	function query() {
		$('#dg').datagrid('load', {
			id : $("#id").val(),
			name : $("#name").val(),
			status : $("#status").val()
		});
	}

	function remove() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			//删除
			$.messager
					.confirm(
							'提示',
							'您确定要删除吗？',
							function(r) {
								if (r) {
									var ids = [];
									for (var i = 0; i < rows.length; i++) {
										ids.push(rows[i].id);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/system/user/remove.action',
												type : 'post',
												data : {
													ids : ids.join(",")
												},
												dataType : 'json',
												success : function(d) {
													if (d.success) {
														query();
													}
													$.messager.show({
														title : '提示',
														msg : d.message,
														timeout : 1000,
														showType : 'slide'
													});

												}
											});
								}
							});

		} else {
			//提示选择数据
			$.messager.alert('提示', '请选择要删除的行！', 'info');
		}
	}

	function add() {
		$('#userAddDiv').panel('open');
		$('#userAddIframe').attr(
				"src",
				"${pageContext.request.contextPath}/system/user/userAdd.action?r="
						+ Math.random())
	}

	function closeAdd() {
		$('#userAddDiv').panel('close');
		query();
	}

	function closeEdit() {
		$('#userEditDiv').panel('close');
		query();
	}
	
	function closeImp() {
		$('#impDiv').panel('close');
		query();
	}

	function resetPwd() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			//删除
			$.messager
					.confirm(
							'提示',
							'您确定要重置密码吗？',
							function(r) {
								if (r) {
									var ids = [];
									for (var i = 0; i < rows.length; i++) {
										ids.push(rows[i].id);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/system/user/resetPwd.action',
												type : 'post',
												data : {
													ids : ids.join(",")
												},
												dataType : 'json',
												success : function(d) {
													if (d.success) {
														query();
													}
													$.messager.show({
														title : '提示',
														msg : d.message,
														timeout : 1000,
														showType : 'slide'
													});

												}
											});
								}
							});
		} else {
			//提示选择数据
			$.messager.alert('提示', '请选择要重置的用户！', 'info');
		}
	}

	function userEdit() {

		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#userEditDiv').panel('open');
			$('#userEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/system/user/userEdit.action?id="
							+ rows[0].id);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的用户！', 'info');
		}
	}
	
	
	function imp() {
		$('#impDiv').panel('open');
		$('#impIframe').attr(
				"src",
				"${pageContext.request.contextPath}/system/user/userImp.action?r="
						+ Math.random())
	}
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',title:'查询',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>账号<input id="id" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>名称<input id="name" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>状态<select id="status" class="easyui-combobox"
						data-options="editable:false,panelHeight:68" style="width: 100px;">
							<option value="">全部</option>
							<option value="0">正常</option>
							<option value="1">锁定</option>
					</select>
					</td>
					<td><a onclick="query()" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a></td>
				</tr>
			</table>
		</div>

	</div>
	<div data-options="region:'center',title:'数据',border:false"
		style="background: #eee;">
		<table id="dg"></table>
	</div>

	<div id="userAddDiv" class="easyui-dialog" title="新增用户"
		style="width: 520px; height: 300px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="userAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>


	<div id="userEditDiv" class="easyui-dialog" title="修改用户"
		style="width: 520px; height: 330px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="userEditIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	
	<div id="impDiv" class="easyui-dialog" title="批量导入"
		style="width: 320px; height: 110px;"
		data-options="iconCls:'icon-filter',resizable:true,modal:true,closed:true">
		<iframe id="impIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
</body>
</html>

