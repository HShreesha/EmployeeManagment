<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Managment</title>
<style>
.login{
    margin: 12% 0px 0px 30%;
    width: 300px;
    border: 1px solid;
    padding: 25px;
    box-shadow: 3px 3px 5px 0px;
    background: aliceblue;
    border-radius: 20px;
}
label{
	width: fit-content;
    display: contents;
}
input[type="text"],input[type="password"],select{
	margin: 0px 0px 0px 5px;
    align-items: center;
    float: right;
    width: 60%;
}
</style>
<script>
</script>
</head>
<body style = "background: antiquewhite;" onload = "">
	<div>
		<div class = "login">
		<h4 style = "margin: 0px 0px 0px 5px;">Add Department</h4><hr>
			<%String error = (String)request.getAttribute("error"); %>
			<span style = "color:red;"><%= (error != null)?error:"" %></span>
			<form action = "./Register">
				<input type = "hidden" name = "method" = value = "addDep">
				<div>Department Id<input type = "text" id = "depId" name = "depId" placeholder = "Enter Department Id"/><span style = "color:red;">*</span><br></div>
				<br>
				<div>Department Name<input type = "text" id = "dName" name = "dName" placeholder = "Enter Department Name"/><br></div>
				<br>
				<div>Department Location<input type = "text" id = "dLoc" name = "dLoc" placeholder = "Enter Department Location"/><br></div><br>
				<br><br>
				<input type = "submit" value = "Submit">
				<input type = "reset" value = "reset">
			</form>
			<br>
			<a href = "./index.jsp">Login</a>
			<br>
			<a href = "./register.jsp">Register</a>
			<br>
			<a href = "./project.jsp">Add Project</a>
		</div>
	</div>
</body>
</html>