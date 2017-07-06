<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EMPLOYEE OPTIONS</title>
<style type="text/css">
   
    hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}
</style>
</head>
<body>
<form method="post">
<%
String name=(String)session.getAttribute("Emp_Name");  
int Employeeid=((int)session.getAttribute("Emp_ID")); 
%>
 WELCOME <font color="green"><%=name %>!!!</font>
 (Emp ID:<font color="green"><%=Employeeid%></font>)

<input type="submit" value="EDIT DETAILS" style="float: right"; formaction="EditEmployee.jsp">&nbsp&nbsp&nbsp&nbsp
<input type="hidden" name="choice" value="EmployeeSearch"/>
<input type="submit" value="SEARCH EMPLOYEE" style="float: right" formaction="SearchEmployee.jsp">&nbsp&nbsp&nbsp&nbsp<br><br>
<input type="hidden" name="file" value="Profile">
<input type="hidden" name="EmpID" value="<%=Employeeid%>">
<input type="submit" value="My PROFILE" style="float: right "formaction="Employee">&nbsp&nbsp&nbsp&nbsp <br><br>
<input type="submit" value="LOG OUT" style="float: right "formaction="Logout.jsp">&nbsp&nbsp&nbsp&nbsp <br><br>
<hr>
</form>
</body>
</html>