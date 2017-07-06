
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/EmployeeDB", "root",
				"secret");
		Statement s = con.createStatement();
		String query = "SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'Employee'";
		ResultSet rs = s.executeQuery(query);
		while (rs.next()) {
			int ID = rs.getInt("auto_increment");
%>
<%=ID%>
<%}
	} catch (SQLException se) {
		se.printStackTrace();
	} catch (Exception e) {
		out.println(e);
	}
%>
