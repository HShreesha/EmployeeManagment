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
var depList = <%=session.getAttribute("depList")%>;
	function dept(){
		document.getElementById('updateDiv').style.display = 'none';
		document.getElementById('listDiv').style.display = 'block';
		var div = document.getElementById('userList');
		var pattern = document.getElementById('search').value;
		var innerHTML = '<table style = "border: 2px solid;"><tr><th>Id</th><th>Dept Name</th><th>Dept Location</th></tr>';
		for(var i = 0 ; i < depList.length ; i++){
			var dept = depList[i];
			if(pattern == '' || pattern.trim() == '' || (pattern != '' && dept.name.toLowerCase().indexOf(pattern) != -1 && dept.id.indexOf(pattern) != -1)){
				innerHTML += '<tr><td style = "border: 1px solid;" onclick = "deptDetails('+i+');"><a href = "#">'+dept.id+'</a></td>';
				innerHTML += '<td style = "border: 1px solid;">'+dept.dName+'</td>';
				innerHTML += '<td style = "border: 1px solid;">'+dept.dLoc+'</td>';
				innerHTML += '<td style = "border: 1px solid;"><a href = "./Delete?method=addDep&depId=\''+dept.id+'\'">Delete</a></td></tr>';
			}
		}
		innerHTML += '</table>';
		div.innerHTML = innerHTML;
	}
	
	function deptDetails(i){
		document.getElementById('listDiv').style.display = 'none';
		document.getElementById('updateDiv').style.display = 'block';
		var dept = depList[i];
		document.getElementById('depId').value = dept.id;
		document.getElementById('dName').value = dept.dName;
		document.getElementById('dLoc').value = dept.dLoc;
	}
</script>
</head>
<body style = "background: antiquewhite;" onload = "dept();">
	<div>
		<div class = "login" id = "listDiv">
			<h4 style = "margin: 0px 0px 0px 5px;">Department</h4><hr>
			<div>Search&nbsp; <input type = "text" id = "search" placeholder = "User Search" onkeyup="setTimeout(dept(),1000);"/></div><br>
			<div id = "userList"></div>
			<a href = "./department.jsp">Add Department</a><br>
			<a href = "./viewProj.jsp">View Project Details</a><br>
			<a href = "./project.jsp">Add Project</a><br>
			<a href = "./users.jsp">View Emps</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
		<div class = "login" id = "updateDiv">
		<div><div style = "display: inline-flex;"><h4 style = "margin: 0px 0px 0px 5px;">Register</h4></div><div style = "float:right;" onclick = "dept();">Back</div><hr></div>
			<%String error = (String)request.getAttribute("error"); %>
			<span style = "color:red;"><%= (error != null)?error:"" %></span>
			<form action = "./Update">
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
			<a href = "./users.jsp">View Emps</a><br>
			<a href = "./department.jsp">Add Department</a>
			<br>
			<a href = "./viewProj.jsp">View Project Details</a>
			<br>
			<a href = "./project.jsp">Add Project</a>
			<br>
			<a href = "./index.jsp">Login</a>
		</div>
	</div>
</body>
</html>