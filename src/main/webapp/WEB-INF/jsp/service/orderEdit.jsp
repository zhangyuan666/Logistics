<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../easyui.jsp"></jsp:include>

<script type="text/javascript">
	function save() {
		$('#orderEditForm')
				.form(
						'submit',
						{
							url : '${pageContext.request.contextPath}/service/order/editOrder.action',
							success : function(d) {
								json = $.parseJSON(d);
								if (json.success) {
									parent.closeEdit();
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
	<div
		style="padding-left: 30px; padding-right: 30px; padding-top: 20px;">
		<form id="orderEditForm" method="post">
			<div style="margin-bottom: 5px">
				订单编号：<input id="orderId" type="text" name="orderId"
					value="${order.orderId}" data-options="required:true"
					readonly="readonly" class="easyui-textbox"
					style="width: 80%; height: 30px; padding: 12px; border: 0px;">
			</div>

			<div style="margin-bottom: 5px">
				物流状态：<select id="orderState" class="easyui-combobox"
					name="orderState" style="width: 80%; height: 30px; padding: 12px;"
					data-options="editable:false,panelHeight:47">
					<option value="0"
						<c:if test="${order.orderState =='0'}">selected="selected"</c:if>>未收货</option>
					<option value="1"
						<c:if test="${order.orderState =='1'}">selected="selected"</c:if>>已收货</option>
				</select>

			</div>


			<div style="margin-bottom: 5px">
				&#12288配送员：<select id="driverId" class="easyui-combobox"
					name="driverId" style="width: 80%; height: 30px; padding: 12px;"
					data-options="editable:false,panelHeight:47">
					<c:forEach items="${driverlist}" var="d">
						<option value="${d.driverId}"
							<c:if test="${order.driverId} == ${d.driverId}"> selected="selected"</c:if>>${d.driverName}</option>
					</c:forEach>
				</select>

			</div>


			<div style="margin-bottom: 5px">
				&#12288快递员：<select id="courierId" class="easyui-combobox"
					name="courierId" style="width: 80%; height: 30px; padding: 12px;"
					data-options="editable:false,panelHeight:47">
					<c:forEach items="${courlist}" var="c">
						<option value="${c.courierId}"
							<c:if test="${order.courierId} == ${c.courierId}"> selected="selected"</c:if>>${c.courierName}</option>
					</c:forEach>
				</select>
			</div>


		<!-- 	<div style="margin-bottom: 5px">
				&#12288收件人：<input id="courierId" class="easyui-text"
					name="courierId" style="width: 80%; height: 30px; padding: 12px;"
					data-options="editable:false,panelHeight:47"/>
			</div>
			
			<div style="margin-bottom: 5px">
				收件人省市区：<select id="courierId" class="easyui-textbox"
					name="courierId" style="width: 73%; height: 30px; padding: 12px;"
					data-options="panelHeight:47">
					
				</select>
			</div>
			
			
			<div style="margin-bottom: 5px">
				收件人地址：<select id="courierId" class="easyui-textbox"
					name="courierId" style="width: 75%; height: 30px; padding: 12px;"
					data-options="panelHeight:47">
					
				</select>
			</div>
			
			
			
			<div style="margin-bottom: 5px">
				收件人电话：<select id="courierId" class="easyui-textbox"
					name="courierId" style="width: 75%; height: 30px; padding: 12px;"
					data-options="panelHeight:47">
					
				</select>
			</div> -->



			<div style="text-align: center;">
				<a id="btn" onclick="save()" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存</a>
			</div>
		</form>
	</div>
</body>
</html>