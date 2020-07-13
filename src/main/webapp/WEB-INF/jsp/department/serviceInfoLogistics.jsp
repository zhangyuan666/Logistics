<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
<jsp:include page="../easyui.jsp"></jsp:include>
 

<script type="text/javascript">

		  
			

	function save() {
		$('#serviceInfoDeliveryForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/serviceInfo/logisticsserviceInfo.action',    
		    success : function(d){    
		    	d = $.parseJSON(d);
				if (d.success) {
					parent.closeLogistics();
					
				}
				parent.$.messager.show({
					title : '提示',
					msg : d.message,
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
	<form  id="serviceInfoDeliveryForm" method="post">
		
			<div style="margin-bottom: 5px">
			订单编号：<input id="orderId" name="orderId" class="easyui-combobox"
					style="width: 70%; height: 30px; padding: 12px;"
					data-options="valueField:'orderId',
					editable:false,textField:'orderId',panelHeight:140,
					url:'${pageContext.request.contextPath}/department/serviceInfo/orderCombobox.action',required:true" />
                  
			</div>
			<div style="margin-bottom: 5px">
			物流信息：<input id="logisticsInfo" type="text" name="logisticsInfo"
					data-options="required:true,prompt:'请输入是否出库'" class="easyui-textbox"
					style="width: 70%; height: 30px; padding: 12px">
					</div> 
			 	<div style="margin-bottom: 5px">
			物流状态：<select id="orderState" name="orderState" class="easyui-combobox"
						data-options="editable:false,equired:true,panelHeight:80"
						 style="width: 70%; height: 30px; padding: 12px">
							<option value="0">未收货</option>
							<option value="1">已收货</option>
					</select>
			</div>
			<div style="text-align: center; padding-top: 10px;">
				<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">物流更新</a>  
			</div>
	</form>
</div>
</body>
</html>