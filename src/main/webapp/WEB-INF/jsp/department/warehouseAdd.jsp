<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增仓库</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		checkWarehouseAddress : {
			validator : function(value) {
				var boo = true;
				 $.ajax({
				    	url:'${pageContext.request.contextPath}/department/warehouse/checkWarehouseAddress.action',
				    	type:'post',
				    	data:{
				    		warehouseAddress : value
				    	},
				    	//将ajax的异步请求改为同步，不然请求瞬间走完，return的永远是true
				    	async:false,
				    	dataType:'json',
				    	success:function(d){
				    		if(d.success){
				    			boo = false;
				    		}
				    	}
				    });
				return boo;
			},
			message : '此地址已存在'
		}
	});
</script>
<script type="text/javascript">
	function save() {
		$('#warehouseAddForm').form('submit', {    
		    url:'${pageContext.request.contextPath}/department/warehouse/addWarehouse.action',    
		    success:function(d){    
		    	json = $.parseJSON(d);
				if (json.success) {
					parent.closeAdd();
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
<div style="padding-left:70px;padding-right: 70px;padding-top: 20px;padding-bottom: 20px;">
	<form  id="warehouseAddForm" method="post">
		<div style="margin-bottom: 5px">
			仓库名称：<input id="warehouseName" type="text" name="warehouseName" 
			data-options="required:true,prompt:'请输入仓库名称'" class="easyui-textbox"
				style="width: 75%; height: 30px; padding: 12px">
		</div>
		<div style="margin-bottom: 5px">
			详细地址：<input id="warehouseAddress" type="text" name="warehouseAddress" 
			data-options="required:true,prompt:'请输入详细地址' , validType:'checkWarehouseAddress'" class="easyui-textbox"
				style="width: 75%; height: 30px; padding: 12px">
		</div>
		<div style="text-align: center;">
			<a id="btn" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
		</div>
	</form>
</div>
</body>
</html>