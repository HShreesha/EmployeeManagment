<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Managment</title>
<style>
.login{
    margin: 8% 0px 0px 40%;
    width: max-content;
    border: 1px solid;
    padding: 25px;
    box-shadow: 3px 3px 5px 0px;
    background: aliceblue;
    border-radius: 20px;
}
</style>
</head>
<body style = "background: antiquewhite;">
	<div>
	<h1>User Managment</h1>
		<div class = "login">
			<h4 style = "margin: 0px 0px 0px 5px;">Login</h4><hr>
			<%String error = (String)request.getAttribute("error"); %>
			<span style = "color:red;"><%= (error != null)?error:"" %></span>
			<form action = "./Login">
				<p>User Name</p>
				<input type = "text" id = "name" name = "name" placeholder = "Enter Name"/>
				<p>Password</p>
				<input type = "password" id = "password" name = "password" placeholder = "Enter Password"/>
				<br><br>
				<input type = "submit" value = "Submit">
				<input type = "reset" value = "reset">
			</form>
			<br>
			<a href = "./Register">Register</a>
		</div>
	</div>
</body>
</html>