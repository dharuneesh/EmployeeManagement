<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>PAGINATION</title>
</head>
<body>
	<script>
		function Records() {
			var recordperpage = document.getElementById("recordcount").value;
			var jspcall = "ViewPagination.jsp?page=1&recordcount="
					+ recordperpage + "";
			window.location.href = jspcall;
		}
	</script>

	<%
		int i;
		int pageno = Integer.parseInt(request.getParameter("page"));
		int recordperpage = Integer.parseInt(request
				.getParameter("recordcount"));
		if(recordperpage==5)
		{
	%>
	Records per page:
	<select id="recordcount" onchange="Records()">
		<option selected disabled>Choose here</option>
		<option value="5" selected>5 per page</option>
		<option value="10">10 per page</option>
		<option value="15">15 per page</option>
	</select>
	<% }
		else if(recordperpage==10)
		{%>
	Records per page:
	<select id="recordcount" onchange="Records()">
		<option selected disabled>Choose here</option>
		<option value="5">5 per page</option>
		<option value="10" selected>10 per page</option>
		<option value="15">15 per page</option>
	</select>
	<% }
		else if(recordperpage==15)
		{%>
	Records per page:
	<select id="recordcount" onchange="Records()">
		<option selected disabled>Choose here</option>
		<option value="5">5 per page</option>
		<option value="10">10 per page</option>
		<option value="15" selected>15 per page</option>
	</select>
	<% }
		%>

	<br>
	<font style="float: right" ; color="blue">Records Per Page:<%=recordperpage%></font>
	<% 
		try {
			int rows = 0, startingvalue = 0, pages;
			RequestDispatcher rd = request
					.getRequestDispatcher("AdminOptions.jsp");
			rd.include(request, response);
			out.println("<html><head><title></title></head><body><h3><font color=Brown>EMPLOYEE DETAILS:</font></h3><table border=1 cellpadding=1 cellspacing=1><tr><th>EmpID</th><th>FirstName</th><th>LastName</th><th>Age</th><th>Email ID</th><th>Address</th><th>Mobileno</th><th>Gender</th>");
			out.println("<th>Designation</th></font</tr>");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/EmployeeDB", "root",
					"secret");
			Statement s = con.createStatement();
			Statement s1 = con.createStatement();
			String sql = "select * from Employee";
			ResultSet rs1 = s.executeQuery(sql);
			rs1.last();
			rows = rs1.getRow();
			double d = (double) rows / recordperpage;
			pages = (int) Math.ceil(d);
			startingvalue = (recordperpage * pageno) - recordperpage;
			String query = "select * from Employee Inner join Designation on Employee.Did=Designation.DId limit " + startingvalue
					+ "," + recordperpage + "";
			ResultSet rs = s.executeQuery(query);

			while (rs.next()) {
	%>

	<tr>
		<td><%=rs.getInt("EmpID")%></td>
		<td><%=rs.getString("FirstName")%></td>
		<td><%=rs.getString("LastName")%></td>
		<td><%=rs.getInt("Age")%></td>
		<td><%=rs.getString("EmailID")%></td>
		<td><%=rs.getString("Address")%></td>
		<td><%=rs.getLong("Mobileno")%></td>
		<td><%=rs.getString("Gender")%></td>
		<td><%=rs.getString("Designation")%></td>
	</tr>
	<%
		}
	%>
	</table>
	<br>
	<center>
		<%
			for (i = 1; i <= pages; i++) {
		%>
		<input type="hidden" id="i" value="<%=i%>"> <a
			href="ViewPagination.jsp?page=<%=i%>&recordcount=<%=recordperpage%>"
			id="link"> <%=i%>
		</a>
		<%
			}
		%>
	</center>
</body>
</html>
<%
	} catch (SQLException se) {
		se.printStackTrace();
	} catch (Exception e) {
		out.println(e);
	}
%>