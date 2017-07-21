<%@page language="java" pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="SqlSrvDB" scope="page" class="org.lightmvcE.MySqlDBConn" />
<%
	request.setCharacterEncoding("UTF-8");
	String usr = request.getParameter("username");
	String pwd = request.getParameter("password");
	boolean validated = false;
	//查询userTable表中的记录
	String sql = "select * from userTable";
	ResultSet rs = SqlSrvDB.executeQuery(sql); //取得结果集
	while(rs.next()){
		if((rs.getString("username").trim().compareTo(usr)==0)&&(rs.getString("password").compareTo(pwd)==0)){
			validated = true;
		}
	}
	rs.close();
	SqlSrvDB.closeStmt(); //关闭语句
	SqlSrvDB.closeConn(); //关闭连接
	if(validated){
		out.print("true");
	}
%>