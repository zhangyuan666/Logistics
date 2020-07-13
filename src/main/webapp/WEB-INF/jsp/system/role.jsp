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
							url : '${pageContext.request.contextPath}/system/role/query.action',
							fit : true,
							border : false,
							pagination : true,
							rownumbers : true,
							striped : true,
							nowrap:false,
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
									roleEdit();
								}
							}, '-', {
								iconCls : 'icon-remove',
								text : '删除',
								handler : function() {
									remove();
								}
							}],
							frozenColumns : [ [ {
								field : 'check',
								title : 'ID',
								checkbox : true
							}, {
								field : 'id',
								title : 'ID',
								width : 100,
								sortable : true,
								hidden:true
							}, {
								field : 'name',
								title : '角色名称',
								width : 100
							} ] ],
							columns : [ [ {
								field : 'mark',
								title : '备注',
								width : 200
							},  {
								field : 'auths',
								title : '拥有权限',
								width : 350,
								
								formatter : function(value) {
									var auths = [];
									if (value) {
										for (var i = 0; i < value.length; i++) {
											auths.push(value[i].name);
										}
									}
									return auths.join(",");
								}
							},{
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
			mark : $("#mark").val()
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
												url : '${pageContext.request.contextPath}/system/role/remove.action',
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
		$('#roleAddDiv').panel('open');
		$('#roleAddIframe').attr(
				"src",
				"${pageContext.request.contextPath}/system/role/roleAdd.action?r="
						+ Math.random())
	}

	function closeAdd() {
		$('#roleAddDiv').panel('close');
		query();
	}

	function closeEdit() {
		$('#roleEditDiv').panel('close');
		query();
	}



	function roleEdit() {

		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#roleEditDiv').panel('open');
			$('#roleEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/system/role/roleEdit.action?id="
							+ rows[0].id);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的用户！', 'info');
		}
	}
</script>
</head>

<body class="easyui-layout">
	
	<div data-options="region:'center',title:'数据',border:false"
		style="background: #eee;">
		<table id="dg"></table>
	</div>

	<div id="roleAddDiv" class="easyui-dialog" title="新增角色"
		style="width: 520px; height: 485px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="roleAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>


	<div id="roleEditDiv" class="easyui-dialog" title="修改角色"
		style="width: 520px; height: 290px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="roleEditIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
</body>
</html>

