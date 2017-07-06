<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    String file=request.getParameter("choice");
	session.setAttribute("file",file);  
    if(file.equals("EmployeeSearch"))
    {
    %>
<%@ include file="Employeeoptions.jsp"%>
<%} 
    else
    {%>
<%@ include file="AdminOptions.jsp"%>
<%} %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Employee</title>
</head>
<body>
	<h3>
		<font color="brown">SEARCHING CRITERIA</font>
	</h3>
	<form method="post">
		<div>
			Search By: <select id="searchelement" onchange="SearchCriteria()" >

				<option value="Select">(SELECT)</option>
				<option value="EmpID">EmployeeID</option>
				<option value="FirstName">EmployeeName</option>
				<option value="Designation">EmployeeDesignation</option>
				<option value="Age">EmployeeAge</option>
			</select><br>
			<br>
		</div>

	</form>
	<div id=1>
	</div>
</body>
<script>
function SearchCriteria()
{
	var xhttp=new XMLHttpRequest();
	var x=document.getElementById("searchelement").value;
	var url="SearchCriteria.jsp?name="+x;
	xhttp.open("POST",url,true);
	xhttp.send();
	xhttp.onreadystatechange=function(){	
		if(this.readyState==4&&this.status==200){
			document.getElementById("1").innerHTML=xhttp.responseText;
		}
		
		}

}
	</script>
</html>