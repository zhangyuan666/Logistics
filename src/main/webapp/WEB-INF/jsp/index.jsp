<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>主页</title>
<jsp:include page="easyui.jsp"></jsp:include>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',href:'${pageContext.request.contextPath}/page/north.action'" style="height: 80px;"></div>
	<div data-options="region:'south',href:'${pageContext.request.contextPath}/page/south.action'" style="height: 30px;">
	</div>
	<div data-options="region:'west',href:'${pageContext.request.contextPath}/page/west.action',title:'菜单'" style="width: 200px;"></div>
	<div data-options="region:'center',href:'${pageContext.request.contextPath}/page/center.action',title:''"
		style="padding: 5px; background: #eee;"></div>
</body>

</html>
