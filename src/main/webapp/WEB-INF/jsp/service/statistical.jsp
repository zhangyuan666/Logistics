<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../easyui.jsp"></jsp:include>
<script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.min.js"></script>

</head>
<body class="easyui-layout">
	<div data-options="region:'center',title:'图表数据'"
		style="padding-top: 15px; padding-left: 15px;">
		<div id="one"
			style="width: 630px; height: 550px; float: left; border: 2px solid white;"></div>
		<div id="two"
			style="width: 630px; height: 550px; float: left; border: 2px solid white;"></div>
	</div>
	<script type="text/javascript">
		$.ajax({
					url : '${pageContext.request.contextPath}/service/statistical/selectMoney.action',
					type : 'post',
					dataType : 'json',
					success : function(d) {
						var names = [];//定义数组
						var nums = [];
						var cookies = [];
						$.each(d, function(i, n) { //返回的是list
							names.push(d[i].serviceName);
							nums.push(d[i].money);
							cookies.push({
								value : d[i].money,
								name : d[i].serviceName
							});
						});
						// 初始化echarts实例
						var myChartOne = echarts.init(document
								.getElementById('one'));
						// 指定图表的配置项和数据
						myChartOne.setOption({
							backgroundColor : '#F0F8FF',
							color: ['#3398DB'],
						    tooltip: {
						        trigger: 'axis',
						        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
						            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						        }
						    },
							title : {
								text : '收益统计（柱形图）'
							},
							legend : {
								data : [ '营业额' ]
							},
							xAxis : [ {
								type : 'category',
								data : names,
								axisTick : {
									alignWithLabel : true
								}
							} ],
							yAxis : [ {
								type : 'value'
							} ],
							series : [ {
								name : '营业额',
								type : 'bar',
								barWidth : '60%',
								data : nums
							} ]
						});

						var myChartTwo = echarts.init(document
								.getElementById('two'));
						myChartTwo.setOption({

							backgroundColor : '#F0F8FF',
							title : {
								text : '收益统计（饼图）'
							},
							visualMap : {
								show : false,
								min : 20000,
								max : 70000,
								inRange : {
									colorLightness : [ 0, 1 ]
								}
							},
							series : [ {
								name : '访问来源',
								type : 'pie',
								radius : '55%',
								data : cookies,
								roseType : 'angle',
								label : {
									normal : {
										textStyle : {
											color : 'black'
										}
									}
								},
								labelLine : {
									normal : {
										lineStyle : {
											color : 'black'
										}
									}
								},
								itemStyle : {
									normal : {
										color : '#3398DB',
										shadowBlur : 200,
										shadowColor : 'rgba(0, 0, 0, 0.5)'
									}
								}
							} ]
						});
					}
				});
	</script>
</html>
