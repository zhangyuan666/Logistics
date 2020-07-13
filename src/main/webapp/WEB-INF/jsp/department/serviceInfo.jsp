<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>服务点管理</title>

<jsp:include page="../easyui.jsp"></jsp:include>

</head>

<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '${pageContext.request.contextPath}/department/serviceInfo/query.action',
			fit : true,
			border : false,
			pagination : true,
			rownumbers : true,
			striped : true,
			nowrap : false,
			//sortName : 'service_id',
			//sortOrder : 'asc',
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
						serviceInfoEdit();
					}
				}, '-',{
					iconCls : 'icon-remove',
					text : '删除',
					handler : function() {
					remove();
					}
				}, '-',{
					iconCls : 'icon-back',
					text : '配送',
					handler : function() {
						delivery();
					}
				}, '-', {
					iconCls : 'icon-ok',
					text : '揽件',
					handler : function() {
						receive();
					}
				}, '-', {
					iconCls : 'icon-reload',
					text : '物流更新',
					handler : function() {
						logistics();
					}
				}],
					frozenColumns : [ [ {
						field : 'checkbox',
						title : '地址编号',
						checkbox : true
					}, {
						field : 'serviceId',
						title : '服务点ID',
						width : 100,
						//sortable : true
					}, {
						field : 'serviceName',
						title : '名称',
						width : 100,
					
					} ] ],
						columns : [ [  {
						field : 'serviceAddress',
						title : '详细地址',
						width : 400,
					} ] ]
				});
		});

	function query() {
		$('#dg').datagrid('load', {
			serviceId : $("#serviceId").val(),
			serviceName : $("#serviceName").val(),
			serviceAddress : $("#serviceAddress").val()
		});
	}
	function remove() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length > 0) {
			//删除
			$.messager.confirm(
							'提示',
							'您确定要删除吗？',
							function(r) {
								if (r) {
									var serviceIds = [];
									for (var i = 0; i < rows.length; i++) {
										serviceIds.push(rows[i].serviceId);
									}
									$.ajax({
												url : '${pageContext.request.contextPath}/department/serviceInfo/remove.action',
												type : 'post',
												data : {
													serviceIds : serviceIds.join(",")
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
		$('#serviceInfoAddDiv').panel('open');
		$('#serviceInfoAddIframe').attr(
				"src","${pageContext.request.contextPath}/department/serviceInfo/serviceInfoAdd.action?r="+ Math.random());
	}

	function closeAdd() {
		$('#serviceInfoAddDiv').panel('close');
		query();
	} 
	

	function closeEdit() {
		$('#serviceInfoEditDiv').panel('close');
		query();
	}
	
	function serviceInfoEdit() {
		var rows = $('#dg').datagrid('getChecked');
		if (rows.length == 1) {
		 $('#serviceInfoEditDiv').panel('open');
		$('#serviceInfoEditIframe').attr(
				"src","${pageContext.request.contextPath}/department/serviceInfo/serviceInfoEdit.action?serviceId="+rows[0].serviceId);
		}else {
			$.messager.alert('提示', '请选择一条需要修改的用户！', 'info');
		} 
	}
	function delivery() {
		$('#serviceInfoDeliveryDiv').panel('open');
		$('#serviceInfoDeliveryIframe').attr(
				"src","${pageContext.request.contextPath}/department/serviceInfo/serviceInfoDelivery.action?r="+ Math.random());
	}

	function closeDelivery() {
		$('#serviceInfoDeliveryDiv').panel('close');
		      
	} 
	
	function receive() {
		$('#serviceInfoReceiveDiv').panel('open');
		$('#serviceInfoReceiveIframe').attr(
				"src","${pageContext.request.contextPath}/department/serviceInfo/serviceInfoReceive.action?r="+ Math.random());
	}

	function closeReceive() {
		$('#serviceInfoReceiveDiv').panel('close');
		      
	} 
	
	function logistics() {
		$('#serviceInfoLogisticsDiv').panel('open');
		$('#serviceInfoLogisticsIframe').attr(
				"src","${pageContext.request.contextPath}/department/serviceInfo/serviceInfoLogistics.action?r="+ Math.random());
	}

	function closeLogistics() {
		$('#serviceInfoLogisticsDiv').panel('close');
		      
	} 
	
</script>
<body class="easyui-layout">
	<div data-options="region:'north',title:'查询',border:false"
		style="height: 70px;">
		<div style="margin-top: 5px; margin-left: 10px">

			<table>
				<tr>
					<td>服务点ID：<input id="serviceId" class="easyui-textbox" data-options=""
						style="width: 100px;">
					</td>
					<td>名称：<input id="serviceName" class="easyui-textbox" data-options=""
						style="width: 200px;">
					</td>
					<td>地址：<input id="serviceAddress" class="easyui-textbox" data-options=""
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
	
	<!-- 新增服务点 -->
	
	<div id="serviceInfoAddDiv" class="easyui-dialog" title="新增服务点"
		style="width: 500px; height: 270px;"
		data-options="iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<iframe id="serviceInfoAddIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div> 
	
	<!-- 修改服务点 -->
	<div id="serviceInfoEditDiv" class="easyui-dialog" title="修改服务点"
		style="width: 500px; height: 270px;"
		data-options="iconCls:'icon-edit',resizable:true,modal:true,closed:true">
		<iframe id="serviceInfoEditIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div> 
	
	<!--配送 -->
	<div id="serviceInfoDeliveryDiv" class="easyui-dialog" title="配送"
		style="width: 450px; height: 250px;"
		data-options="iconCls:'icon-back',resizable:true,modal:true,closed:true">
		<iframe id="serviceInfoDeliveryIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div> 
	
	<!-- 揽件 -->
	<div id="serviceInfoReceiveDiv" class="easyui-dialog" title="揽件"
		style="width: 450px; height: 250px;"
		data-options="iconCls:'icon-ok',resizable:true,modal:true,closed:true">
		<iframe id="serviceInfoReceiveIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
	<!-- 物流更新 -->
	<div id="serviceInfoLogisticsDiv" class="easyui-dialog" title="物流更新"
		style="width: 450px; height: 280px;"
		data-options="iconCls:'icon-reload',resizable:true,modal:true,closed:true">
		<iframe id="serviceInfoLogisticsIframe"
			style='width: 100%; height: 99%; border: 0px;' src=''></iframe>
	</div>
	
</body>
</html>