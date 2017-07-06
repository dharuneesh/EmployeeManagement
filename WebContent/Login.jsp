<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HOME PAGE</title>
<style type="text/css">
    label {
    display: inline-block;
    width:100px;
    text-align: center;
    }
  
</style>
</head>
<body>
<form method="POST">
<center>
<font color="Green">
<h1>EMPLOYEE MANAGEMENT</h1>
</font>
<br>
<font color="brown">
<h2>Sign in to your Account</h2>
</font>
<font color="Brown">
<br><br>
<label>EMP ID </label>:
<input type="number" name="id" size="20" required>
<br><br>

<label>PASSWORD </label> :
<input type="password" name="pwd" size="20" minlength=4 maxlength=15 required ><font size="2" color="red">
<br>(password must min of 4 characters )</font>
<br><br><br></font>
<input type="submit" style="height:25px;width:100px;" value="LOGIN" formaction="LoginCheck">
</center>
</form>
</body>
</html>