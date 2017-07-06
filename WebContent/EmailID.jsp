<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	int flag=0,count=0;
	String empid = request.getParameter("eid");
	String empfname = request.getParameter("efname");
	String emplname = request.getParameter("elname");
	String Mailid = empfname + emplname + "@" + "gmail.com";
	do
	{
		
	try
	{
		if(count==1)
		{
			Mailid = empfname + "."+ emplname + "@" + "gmail.com";	
		}
		else if(count==2)
		{
			Mailid = empfname + emplname +empid+ "@" + "gmail.com";
		}
		flag=0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/EmployeeDB", "root",
				"secret");
		Statement s = con.createStatement();
		String query = "SELECT EmailID from Employee";
		ResultSet rs = s.executeQuery(query);
		while (rs.next()) 
		{
			if (Mailid.equals(rs.getString("EmailID"))) {
				flag=1;
				break;
			}

		}
	} 
	catch (SQLException se) {
		se.printStackTrace();
	} catch (Exception e) {
		out.println(e);
	}
	count++;
	}while(flag==1);
%>
<%=Mailid%>
