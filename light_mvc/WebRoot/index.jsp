<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>主页</title>
  		<jsp:include page="public.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="./admin/css/main.css"/>
		<script type="text/javascript">
			function logout(){
				$.messager.confirm('提示','确定要退出?',function(result){
					if (result){
						window.location.href='./login.jsp';
					}
				});
			}
			function editUserPwd(){
				
			}
			function addTab(tabObj){
				//var iframe = '<iframe src=' + tabObj.url + 'frameborder="0" style="border:0;width:100%;height:98%;"></iframe>'
				var tab = $("#indexTab");
				console.log(tabObj.url);
				var opts = {
					title : tabObj.title,
					selected : true,
					iconCls : tabObj.iconCls,
					//content : iframe,             //没有href导致刷新不出新内容
					href : tabObj.url,
					border : false,
					fit : true,
					closable : true  //继承自panle
				};
				if (tab.tabs('exists', opts.title)) {  //面板是否已经存在了？
					tab.tabs('select', opts.title);
				} else {
					tab.tabs('add', opts);  //面板不存在,添加面板
				}
			}
			$(function(){
				$("#westTree").tree({
					url : "./menu.json",  //从json对象获取,前后端交互时从数据库获取
					lines : true,
					parentField : 'pid',
					onClick : function(theNode){
						if(theNode && theNode.url){   //如果此节点存在url则进行下一步操作
							var theUrl = "." + theNode.url;  //格式化url
							var title = theNode.text;
							var iconCls = theNode.iconCls;
							addTab({
								"title" : title,
								"url" : theUrl,
								"iconCls" : iconCls
							});
						}
					}
				});
				var indexTabs = $("#indexTab").tabs({
					fit : true,
					border : false,
					tools : [{				//工具栏
						iconCls : 'icon_home',
						handler : function() {
							indexTabs.tabs('select', 0);
						}
					}, {
						iconCls : 'icon_refresh',
						handler : function() {
							var index = indexTabs.tabs('getTabIndex', indexTabs.tabs('getSelected'));
							indexTabs.tabs('getTab', index).panel("refresh");
							console.log(indexTabs.tabs('getTab', index));
						}
					}, {
						iconCls : 'icon_del',
						handler : function() {
							var index = indexTabs.tabs('getTabIndex', indexTabs.tabs('getSelected'));
							if(index !== 0){
								indexTabs.tabs('close', index);
							}
						}
					}]
				});
			});
		</script>
	</head>
	<body class="easyui-layout">
		<!--头部-->
		<div data-options="region:'north'" style="height: 69px;overflow: hidden;">
			<div id="header">
				<div class="left"></div>
				<div class="right">
					<span>欢迎您&nbsp;&nbsp;<b style="color: #0f0">超级管理员</b>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="editUserPwd()">修改密码</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="logout()">安全退出</a></span>
				</div>
			</div>
		</div>
		<!--左侧菜单-->
		<div data-options="region:'west',split:true" title="主导航" style="width: 200px; overflow: hidden;">
			<div class="box-container" style="padding: 10px 5px 5px 5px">
				<ul id="westTree"></ul>
			</div>
		</div>
		<!--主体区域-->
		<div data-options="region:'center'" style="overflow: hidden;">
			<div id="indexTab" style="overflow: hidden;">
				<div title="首页" data-options="border:false" style="overflow: hidden;">
					<div style="padding:10px 0 10px 10px">
						<h2>系统介绍</h2>
						<div>欢迎您使用基础权限管理系统。</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>