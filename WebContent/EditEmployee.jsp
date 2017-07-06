<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Employeeoptions.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>EDITING DETAILS</title>
<style>
label {
	display: inline-block;
	width: 100px;
	text-align: left;
}

.sub-entry {
	width: 50%;
	float: left;
}
</style>
</head>
<body>
	<form method="Post">
		<h3>
			<font color=Brown>UPDATE YOUR DETAILS:
		</h3>
		</font>
		<div class="sub-entry">
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/EmployeeDB", "root",
							"secret");
					Statement s = con.createStatement();
					String query = "SELECT * FROM Employee where EmpID='"
							+ Employeeid + "'";
					ResultSet rs = s.executeQuery(query);
					while (rs.next()) {
			%>

			<label>Emp ID</label>: <input type="number" name=upid
				value="<%=rs.getInt("EmpID")%>" readonly required><br>
				
			<br> <label>Password</label>: <input type="password"
				name=uppassword value="<%=rs.getString("Password")%>" required><br>
				
			<br> <label>FirstName</label>: <input type="text" name=upfname
				value="<%=rs.getString("FirstName")%>" required
				pattern="[a-zA-Z]+"><font size="2" color="red">
				(Enter only alphabets without space )</font><br>
				
			<br> <label>LastName</label>: <input type="text" name=uplname
				value="<%=rs.getString("LastName")%>" required pattern="[a-zA-Z]+"><font
				size="2" color="red"> (Enter only alphabets without space )</font><br>
				
			<br> <label>Age</label>: <input type="number" name=upage
				value="<%=rs.getInt("Age")%>" min="18" max="99" ><font
				size="2" color="red">(Age should be from 18 to 99 )</font><br>
			
			<br> <label>Email ID</label>: <input type="email" name=upemail
				value="<%=rs.getString("EmailID")%>" readonly required><br>
		
			<br> <label>Address</label>: <input type="text" name=upaddress
				value="<%=rs.getString("Address")%> " required><br>
			<br>
		</div>
		<div class="sub-entry">
			<label>Mobile no</label>: <input type="text" name=upmobile
				value="<%=rs.getLong("Mobileno")%> " minlength=10  maxlength=12 required pattern="[0-9]+"><font
				size="2" color="red"> (enter min of 10 digit)</font><br>
			<br>
		</div>
		<%
			if (rs.getString("Gender").equals("male")) {
		%>
		<label>Gender</label>: <input type="radio" name="upgender"
			value="male" checked> Male <input type="radio"
			name="upgender" value="female"> Female<br>
		<br>
		<%
			} else {
		%>
		<input type="radio" name="upgender" value="male"> Male <input
			type="radio" name="upgender" value="female" checked> Female<br>
		<br>
		<%
			}
		%>
		<label>Designation</label> <input type="text" name=updesg
			value="<%=rs.getString("Designation")%> " readonly required
			size="30"><br>
		<br> <input type="hidden" name="file" value="update"> <input
			type="submit" value="UPDATE" formaction="Employee">

		<%
			}
			} catch (SQLException se) {
				se.printStackTrace();
			} catch (Exception e) {
				out.println(e);
			}
		%>
	</form>
</body>
</html>