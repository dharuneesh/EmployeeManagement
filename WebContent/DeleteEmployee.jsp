<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="AdminOptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DELETING EMPLOYEE</title>
</head>
<body>
<form method="POST">
<h3><font color="Brown">DELETE EMPLOYEE:</font></h3>
<br>
Employee ID:<input type="number" name=empid  required><br><br>
<input type="hidden" name="file" value="Delete"/>
<input type="submit" value="submit" formaction="Admin">
</form>
</body>
</html>