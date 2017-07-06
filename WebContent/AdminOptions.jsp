<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN OPTIONS</title>
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
String Adminname=(String)session.getAttribute("AdminName");  
int Adminid=((int)session.getAttribute("AdminID")); 
%>
 WELCOME <font color="green"><%=Adminname %>!!!</font>
 (Emp ID:<font color="green"><%=Adminid%></font>)
<br>
<input type="submit" value="ADD EMPLOYEE" style="float: right"; formaction="AddEmployee.jsp">&nbsp&nbsp&nbsp&nbsp

<input type="submit" value="DELETE EMPLOYEE"style="float: right" formaction="DeleteEmployee.jsp">&nbsp&nbsp&nbsp&nbsp

<input type="submit" value="SEARCH EMPLOYEE"style="float: right" formaction="SearchEmployee.jsp">&nbsp&nbsp&nbsp&nbsp

<input type="hidden" name="choice" value="AdminSearch"/>

<input type="hidden" name="page" value="1"/>
<input type="hidden" name="recordcount" value="5"/>
<input type="hidden" name="file" value="view">
<input type="submit" value="VIEW EMPLOYEE" style="float: right "formaction="Admin">&nbsp&nbsp&nbsp&nbsp <br><br>

<input type="submit" value="LOG OUT" style="float: right "formaction="Logout.jsp">&nbsp&nbsp&nbsp&nbsp <br><br>

</form>
<hr>
</body>
</html>