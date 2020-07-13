<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$('#dg')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/service/order/query.action',
							fit : true,
							border : false,
							pagination : true,
							rownumbers : true,
							striped : true,
							nowrap : false,
							sortName : 'order_id',
							sortOrder : 'asc',
							toolbar : [ {
								iconCls : 'icon-edit',
								text : '修改',
								handler : function() {
									orderEdit();
								}
							}, '-', {
								iconCls : 'icon-remove',
								text : '删除',
								handler : function() {
									orderRemove();
								}
							} ],
							frozenColumns : [ [ {
								field : 'checkbox',
								title : '订单编号',
								checkbox : true
							}, {
								field : 'orderId',
								title : '订单编号',
								width : 150
							}, {
								field : 'cargoInfo',
								title : '货物名称',
								width : 100,
								formatter : function(value) {
									return value.cargoName;
								}
							} ] ],
							columns : [ [ {
								field : 'driverInfo',
								title : '配送员姓名',
								width : 100,
								formatter : function(value) {
									return value.driverName;
								}
							}, {
								field : 'courierInfo',
								title : '快递员姓名',
								width : 100,
								formatter : function(value) {
									return value.courierName;
								}
							}, {
								field : 'orderState',
								title : '物流状态',
								width : 100,
								formatter : function(value) {
									if (value == 0) {
										return "未收货";
									} else {
										return "已收货";
									}
								}
							}, {
								field : 'orderCreattime',
								title : '订单创建时间',
								width : 150
							}, {
								field : 'logList',
								title : '物流信息',
								width : 130,
								formatter : function(value) {
									var log = [];
									if (value) {
										for (var i = 0; i < value.length; i++) {
											log.push(value[i].logisticsInfo);
										}
									}
									return log.join(",");
								}
							}, {
								field : 'recInfo',
								title : '收件人姓名',
								width : 100,
								formatter : function(value) {
									return value.recipientName;
								}

							}, {
								field : 'xxxx',
								title : '收件人电话',
								width : 100,
								formatter : function(value, row, index) {
									return row.recInfo.recipientTel;
								}
							}, {
								field : 'userInfo',
								title : '寄件人姓名',
								width : 100,
								formatter : function(value, row, index) {
									return row.userInfo.userName;
								}

							} ] ]
						});
	});

	function orderEdit() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
			$('#orderEditDiv').panel('open');
			$('#orderEditIframe').attr(
					"src",
					"${pageContext.request.contextPath}/service/order/orderEdit.action?orderId="
							+ rows[0].orderId);
		} else {
			$.messager.alert('提示', '请选择一条需要修改的订单！', 'info');
		}
	}

	function orderRemove() {
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
										ids.push(rows[i].orderId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/service/order/orderRemove.action',
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

	function query() {
		$('#dg').datagrid('load', {
			orderId : $("#id").val(),
			orderState : $("#status").val()
		});
	}

	function closeEdit() {
		$('#orderEditDiv').panel('close');
		query();
	}
</script>
</head>
<body class="easyui-layout">
	<!-- 搜索框 -->
	<div data-options="region:'north',title:'查询',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>订单编号：&#12288<input id="id" class="easyui-textbox"
						data-options="" style="width: 200px;">
					</td>
					<td>&#12288物流状态：&#12288<select id="status"
						class="easyui-combobox"
						data-options="editable:false,panelHeight:68" style="width: 100px;">
							<option value="">全部</option>
							<option value="0">未收货</option>
							<option value="1">已收货</option>
					</select>
					</td>
					<td><a onclick="query()" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 数据表格 -->
	<div data-options="region:'center',title:'数据',border:false"
		style="background: #eee;">
		<table id="dg"></table>
	</div>

	<!-- 订单修改 -->
	<div id="orderEditDiv" class="easyui-dialog" title="修改订单"
		style="width: 600px; height: 300px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="orderEditIframe"
			style='width: 100%; height: 80%; border: 0px;' src=''></iframe>
	</div>

</body>
</html>