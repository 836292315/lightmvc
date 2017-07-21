<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 	<head>
  		<title>Login</title>
  		<jsp:include page="public.jsp"></jsp:include>
		<style type="text/css">
			#box{
				position: absolute;
				left: calc(50% - 200px);
				top: calc(50% - 100px);
			}
		</style>
		<script type="text/javascript">
				$(function(){
					$("#loginForm").form({
						url : "./loginCheck.jsp",  //将信息发送到用户验证文件
						success : function(data){
							if(data.trim()==="true"){      //验证成功,跳转主界面
								window.location.href = "./index.jsp";
							}
							else{            //用户名或者密码错误 弹出提示框
								$.messager.show({
				    			title:'提示',
				    			msg:'<div>您的用户名或密码错误</div>',
				    			showType:'show',
				    			timeout : 5000,
				    		});
							}
						}
						
					});
					$(".easyui-validatebox").validatebox({
						required : true
					});
				})
				function submitForm(){
					$('#loginForm').submit();
				}
				
				function clearForm(){
					$('#loginForm').form('clear');
				}
		</script>
  </head>
	<body>
		<div id="box">
			<div class="easyui-panel" title="登录" style="width: 400px;">
				<form id="loginForm" method="post" style="padding: 15px 0 5px;">
					<table style="margin: 0 auto;">
						<tr>
							<td>用户名：</td>
							<td><input class="easyui-validatebox" type="text" name="username" placeholder="请输入用户名" /></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;&nbsp;码：</td>
							<td><input class="easyui-validatebox" type="password" name="password" placeholder="请输入密码" /></td>
						</tr>
					</table>
					<div style="text-align: center; margin-top: 10px;" >
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">登录</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>