<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="AdminOptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADDING EMPLOYEE</title>
<style type="text/css">
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

	<form id="form" method="post">
		<h3>

			<font color="BROWN">FILL THE FORM</font>
		</h3>
		<div class="sub-entry">

			<label>Emp ID</label>: <input type="text" id="empid" name="eid"
				value="<%@ include file="EmpID.jsp" %>" readonly required ><br>

			<br> <label>Password</label>: <input type="password" id="emppwd"
				name="epwd" value="<%@ include file="EmpID.jsp" %>" readonly
				required><br> <br>
				
			 <label>First Name</label>: <input
				type="text" id="empfirstname" name="efirstname" required
				pattern="[a-zA-Z]+" oninput="EmailIdGeneration()" autocomplete="off"><font size="2" color="red">
				(Enter only alphabets without space )</font><br> <br> <label>Last
				Name</label>: <input type="text" id="emplastname" name="elastname"
				oninput="EmailIdGeneration()" required pattern="[a-zA-Z]+" autocomplete="off"><font
				size="2" color="red"> (Enter only alphabets without space )</font><br>
			<br> <label> Email ID</label>: <input id="empmail" type="email"
				name="email" readonly size="30" required autocomplete="off"><br> <br>
			<label> Age</label>: <input type="number" id="eage" name="empage"
				min="18" max="99" autocomplete="off"><font size="2" color="red">(Age
				should be from 18 to 99 )</font><br> <br> <label> Address</label>:
			<input type="text" id="eaddress" name="empaddress"
				style="height: 50px;" size=50 required autocomplete="off"><br> <br>
		</div>

		<div class="sub-entry">


			<label>Mobile no</label>: <input type="text" id="emob" name="empmob"
				minlength=10 maxlength=12 required pattern="[0-9]+" autocomplete="off"><font
				size="2" color="red"> (enter min of 10 digit)</font><br> <br>
			<label> Gender</label>: <input type="radio" name="empgender"
				id="egender" value="male" checked> Male <input type="radio"
				id="egender" name="empgender" value="female"> Female<br>
			<br> <label>Designation</label>: <select id="edesg"
				name="empdesg" required>
				<option value="">(SELECT)</option>
				<option value="5">SYSADMIN</option>
				<option value="4">MEMBER TECHNICAL
					STAFF</option>
				<option value="3">MEMBER LEADERSHIP
					SATFF</option>
				<option value="2">MANAGER</option>
			</select><br> <br> <input type="hidden" id="checkreport"
				value="report" /> <label>Reporting To</label>: <input type="text"
				id="ereporting" name="empreport" list="emplist" required
				autocomplete="off" onkeyup="Suggestion(this.value)"
				oninput=AddEmployee()>
			<datalist id="emplist"></datalist>


			<br> <br> <input type="hidden" id="file" name="file"
				value="Add" />
		</div>
		<span id="form1"></span> <span id="form2"></span>
		<right> <br>
		<br>
		<input type="submit" id="submit" formaction="Admin">
		</div>
	</form>



</body>
<script>
	function AddEmployee() {

		var xhttp = new XMLHttpRequest();
		var empid = document.getElementById("empid").value;
		var emppassword = document.getElementById("emppwd").value;
		var empfirstname = document.getElementById("empfirstname").value;
		var emplastname = document.getElementById("emplastname").value;
		var empmailid = document.getElementById("empmail").value;
		var empage = document.getElementById("eage").value;
		var empaddress = document.getElementById("eaddress").value;
		var empmob = document.getElementById("emob").value;
		var empgender = document.getElementById("egender").value;
		var empdesg = document.getElementById("edesg").value;
		var empreporting = document.getElementById("ereporting").value;
		var filename = document.getElementById("checkreport").value;
		var response;
		var url = "Admin?ereporting=" + empreporting + "&file=" + filename;
		xhttp.open("POST", url, true);
		xhttp.send();

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var response = xhttp.responseText;
				if (response != 1) {
					document.getElementById("submit").disabled = false;
					document.getElementById("form2").innerHTML = "";
				} else {

					document.getElementById("form2").innerHTML = "<font size=2 color=red>EMAIL ID NOT FOUND</font>";
					document.getElementById("submit").disabled = true;
				}
			}

		}

	}

	function EmailIdGeneration() {

		var xhttp = new XMLHttpRequest();
		var empid = document.getElementById("empid").value;
		var empfirstname = document.getElementById("empfirstname").value;
		var emplastname = document.getElementById("emplastname").value;
		var url = "EmailID.jsp?eid=" + empid + "&efname=" + empfirstname
				+ "&elname=" + emplastname;
		xhttp.open("POST", url, true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("empmail").value = xhttp.responseText;
			}

		}

	}
	function Suggestion(searchchar) {
		if (searchchar.length < 3) {
			/* var selectlist =document.getElementById("emplist");
			var length=selectlist.options.length;
			for(i = length - 1 ; i >= 0 ; i--)
			   {
			       selectlist.remove(i);
			   }
			/* for (var j = 0; j < length; j++) {
			// alert(j);
			  selectlist.options[j] = null;
			}  */
			document.getElementById("form1").innerHTML = "<font size=2 color=red >MINIMUM 3CHARACTERS REQUIRED<br></font>";
			document.getElementById("emplist").innerHTML = "";
		} else {
			document.getElementById("form1").innerHTML = "";
			var xhttp = new XMLHttpRequest();
			var url = "Fetching.jsp?echar=" + searchchar;
			xhttp.open("POST", url, true);
			xhttp.send();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var val = xhttp.responseText;
					var selectlist = "";
					//document.getElementById("emplist");
					//alert(selectlist.options.length);
					/* if(selectlist!=null)
					{
					var length = selectlist.options.length;
					/* for (var j = 0; j < length; j++) {
					  selectlist.options[j] = null;
					} */

					/*  for(i = length - 1 ; i >= 0 ; i--)
					{
					    selectlist.remove(i);
					} 
					} */
					var jsonData = JSON.parse(val);
					for ( var i in jsonData) {
						selectlist += '<option value="'+jsonData[i]+'" />';
						//var opt = document.createElement('option');
						//alert(i + jsonData[i])
						/* opt.value = i;
						opt.text = jsonData[i]; */
						//alert(i+jsonData[i]);
						// selectlist += '<option value="'+i+'" />"'+jsonData[i]+'" </option>';
						// selectlist += '<option value="'+jsonData[i]+'" />"'+i+'" </option>';
						//selectlist.appendChild(opt);
					}

					document.getElementById("emplist").innerHTML = selectlist;
				}

			}
		}
	}
	/* function Validation() {

		var xhttp = new XMLHttpRequest();
		var empid = document.getElementById("empid").value;
		var emppassword = document.getElementById("emppwd").value;
		var empfirstname = document.getElementById("empfirstname").value;
		var emplastname = document.getElementById("emplastname").value;
		var empmailid = document.getElementById("empmail").value;
		var empage = document.getElementById("eage").value;
		var empaddress = document.getElementById("eaddress").value;
		var empmob = document.getElementById("emob").value;
		var empgender = document.getElementById("egender").value;
		var empdesg = document.getElementById("edesg").value;
		var empreporting = document.getElementById("ereporting").value;
		var filename = document.getElementById("checkreport").value;
		var message= document.getElementById("alert").value;
		alert(message);
		if (message 	 == "EMAIL ID NOT FOUND") {
			document.getElementById("form2").innerHTML = xhttp.responseText;
		} else {

			alert("ELSE BLOCK");
			/* var xmlhttp = new XMLHttpRequest();
			var empid = document.getElementById("empid").value;
			var emppassword = document.getElementById("emppwd").value;
			var empfirstname = document.getElementById("empfirstname").value;
			var emplastname = document.getElementById("emplastname").value;
			var empmailid = document.getElementById("empmail").value;
			var empage = document.getElementById("eage").value;
			var empaddress = document.getElementById("eaddress").value;
			var empmob = document.getElementById("emob").value;
			var empgender = document.getElementById("egender").value;
			var empdesg = document.getElementById("edesg").value;
			var empreporting = document.getElementById("ereporting").value;
			var filename = document.getElementById("file").value;

			var url = "Admin?eid=" + empid + "&epwd=" + emppassword+ "&email=" + empmailid+ "&efirstname=" + empfirstname+ "&elastname=" + emplastname+ "&empage=" + empage+ "&empaddress=" + empaddress+ "&empmob=" + empmob+ "&empgender=" + empgender+ "&empdesg=" + empdesg+ "&empreport=" + empreporting+ "&file=" + filename;
			xmlhttp.open("POST", url, true);
			xmlhttp.send();

			xmlhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("form2").innerHTML = xmlhttp.responseText;
				}

			} 
		}
	} */
</script>
</html>