<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function menu(title,url) {
		
		var exists = $('#menuTabs').tabs('exists',title);
		if(exists) {
			$('#menuTabs').tabs('select',title);
			return;
		};
		$('#menuTabs').tabs('add', {
			title : title,
			content : "<iframe style='width:100%;height:99%;border:0px;' src='${pageContext.request.contextPath}/"+url+"'></iframe>",
			closable : true,
			tools : [ {
				iconCls : 'icon-mini-refresh',
				handler : function() {
					var tab = $('#menuTabs').tabs('getTab',title);
					$('#menuTabs').tabs('update',{
						tab:tab,
						options:tab.panel('options')
					});
				}
			} ]
		});
	}
</script>

<div class="easyui-accordion" data-options="fit:true,border:false">
	<div title="系统设置">
		<ul class="easyui-tree">
			<li><div onclick="menu('用户设置','system/user/user.action')">
					<span>用户设置</span>
				</div></li>
			<li><div onclick="menu('角色设置','system/role/role.action')">
					<span>角色设置</span>
				</div></li>
			<li><div onclick="menu('权限设置','system/auth/auth.action')">
					<span>权限设置</span>
				</div></li>
		</ul>
	</div>
	
	<div title="部门管理">
		<ul class="easyui-tree">
			<li><div onclick="menu('服务点管理','department/serviceInfo/serviceInfo.action')">
					<span>服务点管理</span>
				</div></li>
			<li><div onclick="menu('仓库管理','department/warehouse/warehouse.action')">
					<span>仓库管理</span>
				</div></li>
		</ul>
	</div>
	<div title="人员管理">
		<ul class="easyui-tree">
			<li><div onclick="menu('快递员管理','personnel/courierInfo/courierInfo.action')">
					<span>快递员管理</span>
				</div></li>
			<li><div onclick="menu('配送员管理','personnel/driverInfo/driverInfo.action')">
					<span>配送员管理</span>
				</div></li>
		</ul>
	</div>
	<div title="服务管理">
		<ul class="easyui-tree">
			<li><div onclick="menu('订单管理','service/order/order.action')">
					<span>订单管理</span>
				</div></li>
			<li><div onclick="menu('收益统计','service/statistical/statistical.action')">
					<span>收益统计</span>
				</div></li>
		</ul>
	
	</div>
</div>