<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>仓库管理</title>
<jsp:include page="../easyui.jsp"></jsp:include>
</head>

<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '${pageContext.request.contextPath}/department/warehouse/query.action',
			//自适应父容器
			fit : true,
			border : false,
			//分页插件
			pagination : true,
			//行号
			rownumbers : true,
			striped : true,
			nowrap : false,
			//定义哪个列可以排序
			sortName : 'warehouseId',
			sortOrder : 'asc',
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					add();
					}
				}, '-',{
					iconCls : 'icon-edit',
					text : '修改',
					handler : function() {
					warehouseEdit();
					}
				}, '-',{
					iconCls : 'icon-remove',
					text : '删除',
					handler : function() {
					remove();
					}
				}, '-',{
					iconCls : 'icon-ok',
					text : '收货',
					handler : function() {
					warehouseReceiving();
					}
				}, '-', {
					iconCls : 'icon-back',
					text : '发货',
					handler : function() {
					warehouseShipment();
					}
				}, '-',{
					iconCls : 'icon-reload',
					text : '物流更新',
					handler : function() {
					logisticsUpdate();
					}
				}],
					frozenColumns : [ [ {
						field : 'checkbox',
						title : '仓库编号',
						//复选框
						checkbox : true
					}, {
						field : 'warehouseId',
						title : '仓库编号',
						width : 100,
						sortable : true
					}, {
						field : 'warehouseName',
						title : '仓库名称',
						width : 100,
						sortable : true
					} ] ],
						columns : [ [  {
						field : 'warehouseAddress',
						title : '详细地址',
						width : 300,
					} ] ]
				});
		});

	function query() {
		$('#dg').datagrid('load', {
			warehouseId : $("#warehouseId").val(),
			warehouseName : $("#warehouseName").val(),
			warehouseAddress : $("#warehouseAddress").val()
		});
	}
	
	function remove() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			//删除，删除之前用messager.confirm给提示反悔()
			$.messager.confirm('提示','您确定要删除吗？',
				function(r) {
					if (r) {
						var warehouseIds = [];
						for (var i = 0; i < rows.length; i++) {
							warehouseIds.push(rows[i].warehouseId);
						}
					$.ajax({
						url : '${pageContext.request.contextPath}/department/warehouse/remove.action',
						type : 'post',
						data : {
							warehouseIds : warehouseIds.join(",")
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
		$('#warehouseAddDiv').panel('open');
		$('#warehouseAddIframe').attr(
				"src",
				"${pageContext.request.contextPath}/department/warehouse/warehouseAdd.action?r="+ Math.random())
	}

	function closeAdd() {
		$('#warehouseAddDiv').panel('close');
		query();
	}

	function closeEdit() {
		$('#warehouseEditDiv').panel('close');
		query();
	}

	function warehouseEdit() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#warehouseEditDiv').panel('open');
			$('#warehouseEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/department/warehouse/warehouseEdit.action?warehouseId="+ rows[0].warehouseId);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的地址！', 'info');
		}
	}
	
	function warehouseReceiving() {
		//收货
		$('#receivingDiv').panel('open');
		$('#receivingIframe').attr(
				"src",
				"${pageContext.request.contextPath}/department/warehouse/receiving.action?r="+ Math.random());
	}
	
	function warehouseShipment() {
		//发货
		$('#shipmentDiv').panel('open');
		$('#shipmentIframe').attr(
				"src",
				"${pageContext.request.contextPath}/department/warehouse/shipment.action?r="+ Math.random());
	}
	function logisticsUpdate() {
		//物流更新
		$('#logisticsUpdateDiv').panel('open');
		$('#logisticsUpdateIframe').attr(
				"src",
				"${pageContext.request.contextPath}/department/warehouse/logisticsUpdate.action?r="+ Math.random());
	}
	function closeReceiving() {
		$('#receivingDiv').panel('close');
	}

	function closeShipment() {
		$('#shipmentDiv').panel('close');
	}
	function closelogisticsUpdate() {
		$('#logisticsUpdateDiv').panel('close');
		query();
	}
</script>
<body class="easyui-layout">
	<div data-options="region:'north',title:'查询',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>仓库编号<input id="warehouseId" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>仓库名称<input id="warehouseName" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>详细地址<input id="warehouseAddress" class="easyui-textbox" data-options=""
						style="width: 200px;">
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

	<div id="warehouseAddDiv" class="easyui-dialog" title="新增仓库"
		style="width: 560px; height: 220px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="warehouseAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>

	<div id="warehouseEditDiv" class="easyui-dialog" title="修改仓库"
		style="width: 560px; height: 260px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="warehouseEditIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<!--  ============================================new=============================================  -->
	<div id="receivingDiv" class="easyui-dialog" title="收货"
		style="width: 450px; height: 200px;"
		data-options="iconCls:'icon-ok',resizable:true,modal:true,closed:true">
		<iframe id="receivingIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<div id="shipmentDiv" class="easyui-dialog" title="发货"
		style="width: 450px; height: 200px;"
		data-options="iconCls:'icon-back',resizable:true,modal:true,closed:true">
		<iframe id="shipmentIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<div id="logisticsUpdateDiv" class="easyui-dialog" title="物流更新"
		style="width: 450px; height: 200px;"
		data-options="iconCls:'icon-reload',resizable:true,modal:true,closed:true">
		<iframe id="logisticsUpdateIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<!--  =============================================end============================================  -->
</body>
</html>