<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEARCHING CRITERIA</title>
</head>
<body>
	<br>
	<%
		String Criteria = request.getParameter("name");
		if (Criteria.equals("EmpID")) {
	%>
	<form method="post">
		Enter Employee ID: <input type="number" name="EmpID" required><br>
		<br> <input type="hidden" name="file" value="Search" />
		<%
			String file = (String) session.getAttribute("file");
				if (file.equals("EmployeeSearch")) {
		%>
		<input type="submit" value="Submit" formaction="Employee">
		<%
			} else {
		%>
		<input type="submit" value="Submit" formaction="Admin">
		<%
			}
		%>
	</form>
	<%
		} else if (Criteria.equals("FirstName")) {
	%>
	<form method="post">
		Enter Employee Name: <input type="text" name="FirstName" required pattern="[a-zA-Z]+"> <font size="2" color="red"> (ENTER ONLY ALPHABETS)</font><br>
		<br> <input type="hidden" name="file" value="Search" />
		<%
			String file = (String) session.getAttribute("file");
				if (file.equals("EmployeeSearch")) {
		%>
		<input type="submit" value="Submit" formaction="Employee">
		<%
			} else {
		%>
		<input type="submit" value="Submit" formaction="Admin">
		<%
			}
		%>
	</form>
	<%
		} else if (Criteria.equals("Designation")) {
	%>
	<form method="post">
		Enter Employee Designation: <select name="Designation" required >
			<option value="">(SELECT)</option>
			<option value="SYSADMIN">SYSADMIN</option>
			<option value="MEMBER TECHNICAL STAFF">MEMBER TECHNICAL
				STAFF</option>
			<option value="MEMBER LEADERSHIP STAFF">MEMBER LEADERSHIP
				STAFF</option>
			<option value="MANAGER">MANAGER</option>
		</select><br> <br> <input type="hidden" name="file" value="Search" />
		<%
			String file = (String) session.getAttribute("file");
				if (file.equals("EmployeeSearch")) {
		%>
		<input type="submit" value="Submit" formaction="Employee" >
		<%
			} else {
		%>
		<input type="submit" value="Submit" formaction="Admin">
		<%
			}
		%>
	</form>
	<%
		} else if (Criteria.equals("Age")) {
	%>
	<form method="post">
		Enter Employee Age: <input type="number" name="Age" required><br> <br>
		<input type="hidden" name="file" value="Search" />
		<%
			String file = (String) session.getAttribute("file");
				if (file.equals("EmployeeSearch")) {
		%>
		<input type="submit" value="Submit" formaction="Employee">
		<%
			} else {
		%>
		<input type="submit" value="Submit" formaction="Admin">
		<%
			}
		%>
	</form>
	<%
		}
	%>
</body>
</html>