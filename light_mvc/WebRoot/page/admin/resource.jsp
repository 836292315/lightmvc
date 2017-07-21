<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>resource</title>
  		<jsp:include page="../public.jsp"></jsp:include>
  		<script type="text/javascript">
  			$(function(){
  				$("#treeGrid").treegrid({
  					url : '../resourceData.json',
					idField : 'id',
					treeField : 'name',
					animate : true,
					fit : true,
					border : false,
					fitColumns : false,
					columns : [[
						{
							title : '编号',
							field : 'id',
							width : 80
						},
						{
							title : '资源名称',
							field : 'name'
						},
						{
							title : "资源路径",
							field : "url"
						},
						{
							title : "排序",
							field : "seq",
							width : 60
						}
					]]
  				});
  			})
  		</script>
    </head>
    <body style="padding: 20px 20px 0 20px;">
    	<table id="treeGrid"></table>
 	</body>
</html>