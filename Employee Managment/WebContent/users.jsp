<%@page import="java.util.List"%>
<%@page import="User.Emp"%>
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
    width: max-content;
    border: 1px solid;
    padding: 25px;
    box-shadow: 3px 3px 5px 0px;
    background: aliceblue;
}
p{
	width: fit-content;
    display: contents;
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
	var list = <%=session.getAttribute("list")%>;
	var depList = <%=session.getAttribute("depList")%>;
	var projList = <%=session.getAttribute("projList")%>;
	function users(){
		document.getElementById('updateDiv').style.display = 'none';
		document.getElementById('deptView').style.display = 'none';
		document.getElementById('projView').style.display = 'none';
		document.getElementById('listDiv').style.display = 'block';
		var div = document.getElementById('userList');
		var pattern = document.getElementById('search').value;
		var innerHTML = '<table style = "border: 2px solid;"><tr><th>Name</th><th>Password</th><th>Gender</th><th>Phone No</th><th>Age</th><th>Department Id</th><th>Project Id</th><th>Delete</th></tr>';
		for(var i = 0 ; i < list.length ; i++){
			var user = list[i];
			if(pattern == '' || pattern.trim() == '' || (pattern != '' && (user.name.toLowerCase().indexOf(pattern) != -1 || user.phone.indexOf(pattern) != -1 || user.gender.toLowerCase().indexOf(pattern) != -1 || user.project.indexOf(pattern) != -1 || user.department.indexOf(pattern) != -1))){
				innerHTML += '<tr><td style = "border: 1px solid;" onclick = "userDetails('+i+');"><a href = "#">'+user.name+'</a></td>';
				innerHTML += '<td style = "border: 1px solid;">'+user.password+'</td>';
				innerHTML += '<td style = "border: 1px solid;">'+user.gender+'</td>';
				innerHTML += '<td style = "border: 1px solid;">'+user.phone+'</td>';
				innerHTML += '<td style = "border: 1px solid;">'+user.age+'</td>';
				innerHTML += '<td style = "border: 1px solid;" onclick = "departmentDetails('+user.department+');">'+user.department+'</td>';
				innerHTML += '<td style = "border: 1px solid;" onclick = "projectDetails('+user.project+');">'+user.project+'</td>';
				innerHTML += '<td style = "border: 1px solid;"><a href = "./Delete?name=\''+user.name+'\'">Delete</a></td></tr>';
			}
		}
		innerHTML += '</table>';
		div.innerHTML = innerHTML;
	}
	
	function userDetails(i){
		document.getElementById('updateDiv').style.display = 'block';
		document.getElementById('deptView').style.display = 'none';
		document.getElementById('projView').style.display = 'none';
		document.getElementById('listDiv').style.display = 'none';
		var user = list[i];
		document.getElementById('name').value = user.name;
		document.getElementById('password').value = user.password;
		document.getElementById('password').type = 'text';
		document.getElementById(user.gender).checked = true;
		document.getElementById('phone').value = user.phone;
		document.getElementById('age').value = user.age;
		document.getElementById('address').value = user.address;
		document.getElementById('city').value = user.city;
		document.getElementById('state').value = user.state;
		document.getElementById('department').value = user.department;
		document.getElementById('project').value = user.project;
	}
	
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
	
	function departmentDetails(id){
		document.getElementById('updateDiv').style.display = 'none';
		document.getElementById('deptView').style.display = 'block';
		document.getElementById('projView').style.display = 'none';
		document.getElementById('listDiv').style.display = 'none';
		for(var i = 0 ; i < depList.length ; i++){
			var dept = depList[i];
			if(dept && dept.id == id){
				document.getElementById('depId').value = dept.id;
				document.getElementById('dName').value = dept.dName;
				document.getElementById('dLoc').value = dept.dLoc;
				break;
			}
		}
	}
	
	function projectDetails(id){
		document.getElementById('updateDiv').style.display = 'none';
		document.getElementById('deptView').style.display = 'none';
		document.getElementById('projView').style.display = 'block';
		document.getElementById('listDiv').style.display = 'none';
		for(var i = 0 ; i < projList.length ; i++){
			var proj = projList[i];
			if(proj && proj.id == id){
				document.getElementById('projId').value = proj.id;
				document.getElementById('pName').value = proj.pName;
				document.getElementById('pDetails').value = proj.pDetails;
				break;
			}		
		}
	}
</script>
</head>
<body style = "background: antiquewhite;" onload = "users();setOptionList();">
	<div>
		<div class = "login" id = "listDiv">
			<h4 style = "margin: 0px 0px 0px 5px;">Users</h4><hr>
			<div>Search&nbsp; <input type = "text" id = "search" placeholder = "User Search" onkeyup="setTimeout(users(),1000);"/></div><br>
			<div id = "userList"></div>
			<br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./viewProj.jsp">View Project Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
		<div class = "login" id = "updateDiv">
		<div><div style = "display: inline-flex;"><h4 style = "margin: 0px 0px 0px 5px;">User Details</h4></div><div style = "float:right;" onclick = "users();">Back</div><hr></div>
			<form action = "./Update">
				<div>User Name<input type = "text" id = "name" name = "name" placeholder = "Enter Name"/></div   >
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
					<br><br>					
				</div>
				<input type = "submit" value = "Submit">
				<input type = "reset" value = "reset">
			</form><br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./viewProj.jsp">View Project Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
		<div class = "login" id = "deptView">
		<div><div style = "display: inline-flex;"><h4 style = "margin: 0px 0px 0px 5px;">Department Details</h4></div><div style = "float:right;" onclick = "users();">Back</div><hr></div>
			<form>
				<div>Department Id<input type = "text" id = "depId" name = "depId" placeholder = "Enter Department Id" disabled/><br></div>
				<br>
				<div>Department Name<input type = "text" id = "dName" name = "dName" placeholder = "Enter Department Name" disabled/><br></div>
				<br>
				<div>Department Location<input type = "text" id = "dLoc" name = "dLoc" placeholder = "Enter Department Location" disabled/><br></div><br>
				<br><br>
			</form><br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./viewProj.jsp">View Project Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
		<div class = "login" id = "projView">
		<div><div style = "display: inline-flex;"><h4 style = "margin: 0px 0px 0px 5px;">Project Details</h4></div><div style = "float:right;" onclick = "users();">Back</div><hr></div>
			<form>
				<input type = "hidden" name = "method" = value = "addProj">
				<div>Project Id<input type = "text" id = "projId" name = "projId" placeholder = "Enter Department Id" disabled/><br></div>
				<br>
				<div>Project Name<input type = "text" id = "pName" name = "pName" placeholder = "Enter Department Name" disabled/><br></div>
				<br>
				<div>Project Details<br><textarea style = "width:100%" type = "text" id = "pDetails" name = "pDetails" placeholder = "Enter Department Location" disabled></textarea><br></div><br>
				<br><br>
			</form><br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./viewProj.jsp">View Project Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
	</div>
</body>
</html>