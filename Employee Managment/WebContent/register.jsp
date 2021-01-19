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
var depList = <%=session.getAttribute("depList")%>;
var projList = <%=session.getAttribute("projList")%>;
function setOptionList(){
	var html = '<option value = " ">--- Select Department ----</option>';
	var innerHtml = '';
	var list = depList;
	for(var i = 0 ; i < list.length ; i++){
		innerHtml += '<option value = "'+list[i].id+'">'+list[i].dName+'</option>';
	}
	html += innerHtml;
	document.getElementById('department').innerHTML = html;
	
	html = '<option value = " ">---- Select Project -----</option>';
	var innerHtml = '';
	var list = projList;
	for(var i = 0 ; i < list.length ; i++){
		innerHtml += '<option value = "'+list[i].id+'">'+list[i].pName+'</option>';
	}
	html += innerHtml;
	document.getElementById('project').innerHTML = html;
}

function validate(){
	var error = document.getElementById('error');
	var name = document.getElementById('name').value;
	var password = document.getElementById('password').value;
	var phone = document.getElementById('phone').value;
	var age = document.getElementById('age').value;
	if(!(name && name != '' && name.trim() != "")){
		error.innerText = 'Name Field is invalid';
		return false;
	}
	if(!(password && password != '' && password.trim() != "")){
		error.innerText = 'password is invalid';
		return false;
	}
	if(!(phone && phone != '' && phone.trim() != "" && phone.length == 10)){
		error.innerText = 'Phone Number is invalid';
		return false;
	}
	if(!(age && age != '' && age.trim() != "" && age > 18)){
		error.innerText = 'Age should be greater than 18';
		return false;
	}
	return true;
}
</script>
</head>
<body style = "background: antiquewhite;" onload = "setOptionList();">
	<div>
		<div class = "login">
		<h4 style = "margin: 0px 0px 0px 5px;">Register</h4><hr>
			<%String error = (String)request.getAttribute("error"); %>
			<span id = "error" style = "color:red;"><%= (error != null)?error:"" %></span>
			<form action = "./Register" onsubmit = "return validate();">
				<input type = "hidden" name = "method" = value = "addEmp">
				<div>User Name<input type = "text" id = "name" name = "name" placeholder = "Enter Name"/><span style = "color:red;">*</span></div>
				<br>
				<div>Password<input type = "password" id = "password" name = "password" placeholder = "Enter Password"/></div>
				<br>
				<div style="display: flex;">Gender
					<div style = "margin: auto;">Male<input type = "radio" id = "male" name = "gender" value = "male" checked/></div>
					<div>Female<input type = "radio" id = "female" name = "gender" value = "female"/></div>
				</div>
					<br>
				<div>Phone Number<input type = "text" id = "phone" name = "phone" placeholder = "Enter Phone Number"/><br></div><br>
				<div>Age<input type = "text" id = "age" name = "age" placeholder = "Enter Age"/><br></div>
				<br><br>
				<div>Address<br><textarea style = "width:100%" type = "text" id = "address" name = "address" placeholder = "Enter Address"></textarea></div>
				<br>
				<div>City<input type = "text" id = "city" name = "city" placeholder = "Enter City"/></div>
				<br>
				<div>State<input type = "text" id = "state" name = "state" placeholder = "Enter State"/><br></div><br>
				<div>Department
					<select id = "department" name = "department">
						<!-- <option value = "">--- Select Department ----</option>
						<option value = "1">--- Phy ----</option>
						<option value = "2">--- Chem ----</option> -->
					</select>
					<br>					
				</div><br>
				<div>Project
					<select id = "project" name = "project">
						<!-- <option value = "">--- Select Project ----</option>
						<option value = "1">--- WB ----</option>
						<option value = "2">--- CSP ----</option> -->
					</select>
					<br>					
				</div>
				<br><br>
				<input type = "submit" value = "Submit">
				<input type = "reset" value = "reset">
			</form>
			<br>
			<a href = "./index.jsp">Login</a>
			<br>
			<a href = "./department.jsp">Add Department</a>
			<br>
			<a href = "./project.jsp">Add Project</a>
		</div>
	</div>
</body>
</html>