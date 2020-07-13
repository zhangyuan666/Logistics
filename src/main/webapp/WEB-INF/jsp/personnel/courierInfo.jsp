<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>快递员管理</title>

<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/personnel/courierInfo/query.action',
							fit : true,
							border : false,
							pagination : true,
							rownumbers : true,
							striped : true,
							nowrap : false,
							sortName : 'courier_id',
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
									courierEdit();
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
								title : '快递员ID',
								checkbox : true
							}, {
								field : 'courierId',
								title : '快递员ID',
								width : 100
							}, {
								field : 'courierName',
								title : '姓名',
								width : 163
							} ] ],
							columns : [ [ {
								field : 'courierTel',
								title : '电话',
								width : 163
							},{
								field : 'courierTask',
								title : '服务点名称（任务）',
								width : 250
							},{
								field : 'serviceId',
								title : '服务点ID',
								width : 163
							}] ]
						});
	});

	function query() {
		$('#dg').datagrid('load', {
			courierId : $("#courierId").val(),
			courierName : $("#courierName").val(),
			courierTel : $("#courierTel").val(),
			courierTask : $("#courierTask").val(),
			serviceId : $("#serviceId").val()
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
									var courierInfoIds = [];
									for (var i = 0; i < rows.length; i++) {
										courierInfoIds.push(rows[i].courierId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/personnel/courierInfo/remove.action',
												type : 'post',
												data : {
													courierInfoIds : courierInfoIds.join(",")
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
		$('#courierAddDiv').panel('open');
		$('#courierAddIframe').attr(
				"src",
				"${pageContext.request.contextPath}/personnel/courierInfo/courierAdd.action?r="
						+ Math.random())
	}

	function closeAdd() {
		$('#courierAddDiv').panel('close');
		query();
	}

	function closeEdit() {
		$('#courierEditDiv').panel('close');
		query();
	}

	function courierEdit() {

		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#courierEditDiv').panel('open');
			$('#courierEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/personnel/courierInfo/courierEdit.action?courierId="
							+ rows[0].courierId);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的数据！', 'info');
		}
	}
	
	function logisticsUpdate() {
		//物流更新
		$('#logisticsUpdateDiv').panel('open');
		$('#logisticsUpdateIframe').attr(
				"src",
				"${pageContext.request.contextPath}/personnel/courierInfo/ClogisticsUpdate.action?r="+ Math.random());
	}
	
	function closelogisticsUpdate() {
		$('#logisticsUpdateDiv').panel('close');
		query();
	}
	
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',title:'快递员信息',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>快递员ID：<input id="courierId" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>快递员姓名：<input id="courierName" class="easyui-textbox" data-options=""
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

	<div id="courierAddDiv" class="easyui-dialog" title="快递员信息"
		style="width: 650px; height: 300px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="courierAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>


	<div id="courierEditDiv" class="easyui-dialog" title="修改快递员信息"
		style="width: 520px; height: 330px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="courierEditIframe"
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

