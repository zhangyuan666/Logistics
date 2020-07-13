<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>配送员管理</title>

<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/personnel/driverInfo/query.action',
							fit : true,
							border : false,
							pagination : true,
							rownumbers : true,
							striped : true,
							nowrap : false,
							sortName : 'driver_id',
							sortOrder : 'asc',
							toolbar : [ {
								iconCls : 'icon-add',
								text : '添加',
								handler : function() {
									add();
								}
							}, '-', {
								iconCls : 'icon-edit',
								text : '修改',
								handler : function() {
									driverEdit();
								}
							}, '-', {
								iconCls : 'icon-remove',
								text : '删除',
								handler : function() {
									remove();
								}
							}, '-', {
								iconCls : 'icon-reload',
								text : '物流更新',
								handler : function() {
									logisticsUpdate();
								}
							}  ],
							frozenColumns : [ [ {
								field : 'checkbox',
								title : '配送员ID',
								checkbox : true
							}, {
								field : 'driverId',
								title : '配送员ID',
								width : 100,
								sortable : true
							}, {
								field : 'driverName',
								title : '姓名',
								width : 163,
								sortable : true
							} ] ],
							columns : [ [ {
								field : 'driverTel',
								title : '电话',
								width : 163
							},{
								field : 'driverTask',
								title : '服务点名称（任务）',
								width : 250
							},{
								field : 'warehouseId',
								title : '服务点ID',
								width : 163,
								sortable : true
							}] ]
						});
	});

	function query() {
		$('#dg').datagrid('load', {
			driverId : $("#driverId").val(),
			driverName : $("#driverName").val(),
			driverTel : $("#driverTel").val(),
			driverTask : $("#driverTask").val(),
			warehouseId : $("#warehouseId").val()
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
									var driverInfoIds = [];
									for (var i = 0; i < rows.length; i++) {
										driverInfoIds.push(rows[i].driverId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/personnel/driverInfo/remove.action',
												type : 'post',
												data : {
													driverInfoIds : driverInfoIds.join(",")
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
		$('#driverAddDiv').panel('open');
		$('#driverAddIframe').attr(
				"src",
				"${pageContext.request.contextPath}/personnel/driverInfo/driverAdd.action?r="
						+ Math.random())
	}

	function closeAdd() {
		$('#driverAddDiv').panel('close');
		query();
	}

	function closeEdit() {
		$('#driverEditDiv').panel('close');
		query();
	}

	function driverEdit() {

		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#driverEditDiv').panel('open');
			$('#driverEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/personnel/driverInfo/driverEdit.action?driverId="
							+ rows[0].driverId);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的数据！', 'info');
		}
	}
	
	function logisticsUpdate() {
		//物流更新
		$('#logisticsUpdateDiv').panel('open');
		$('#logisticsUpdateIframe').attr(
				"src",
				"${pageContext.request.contextPath}/personnel/driverInfo/DlogisticsUpdate.action?r="+ Math.random());
	}
	
	function closelogisticsUpdate() {
		$('#logisticsUpdateDiv').panel('close');
		query();
	}
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',title:'配送员信息',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>配送员ID：<input id="driverId" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;配送员姓名：<input id="driverName" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td><a onclick="query()" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">人员或任务查询</a></td>
				</tr>
			</table>
		</div>

	</div>
	<div data-options="region:'center',title:'数据',border:false"
		style="background: #eee;">
		<table id="dg"></table>
	</div>

	<div id="driverAddDiv" class="easyui-dialog" title="配送员信息"
		style="width: 650px; height: 300px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="driverAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>


	<div id="driverEditDiv" class="easyui-dialog" title="修改配送员信息"
		style="width: 520px; height: 330px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="driverEditIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<div id="logisticsUpdateDiv" class="easyui-dialog" title="物流更新"
		style="width: 450px; height: 200px;"
		data-options="iconCls:'icon-reload',resizable:true,modal:true,closed:true">
		<iframe id="logisticsUpdateIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
</body>
</html>

