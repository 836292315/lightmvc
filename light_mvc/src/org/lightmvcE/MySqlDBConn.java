package org.lightmvcE;
import java.sql.*;
public class MySqlDBConn {
	private Statement stmt; //Statement 对象(语句)
	private Connection conn; //Connection 对象(链接)
	ResultSet rs; //ResultSet 对象(结果集)
	//在构造方法中创建数据库连接
	public MySqlDBConn(){
		stmt = null;
		try{
			/**加载并注册JDBC驱动*/
			Class.forName("com.mysql.jdbc.Driver");
			/**编写连接字符串，获取创建连接*/
			conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/lightmvce","root","root");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		rs=null;
	}
	//执行查询类的SQL语句，有返回集
	public ResultSet executeQuery(String sql){
		try{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs=stmt.executeQuery(sql); //执行查询语句
		}
		catch(SQLException e){
			System.err.println("Data.executeQuery: " + e.getMessage());
		}
		return rs; //返回结果集
	}
	//关闭对象
	public void closeStmt(){
		try{
			stmt.close();     //关闭Statement对象
		}
		catch(SQLException e){
			System.err.println("Data.executeQuery: " + e.getMessage());
		}
	}
	public void closeConn(){
		try{
			conn.close();     //关闭连接
		}
		catch(SQLException e){
			System.err.println("Data.executeQuery: " + e.getMessage());
		}
	}
}