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
	var projList = <%=session.getAttribute("projList")%>;
	function proj(){
		document.getElementById('updateDiv').style.display = 'none';
		document.getElementById('listDiv').style.display = 'block';
		var div = document.getElementById('userList');
		var pattern = document.getElementById('search').value;
		var innerHTML = '<table style = "border: 2px solid;"><tr><th>Id</th><th>Project Name</th><th>Project Details</th></tr>';
		for(var i = 0 ; i < projList.length ; i++){
			var proj = projList[i];
			if(pattern == '' || pattern.trim() == '' || (pattern != '' && (proj.pName.toLowerCase().indexOf(pattern) != -1 || proj.id.indexOf(pattern) != -1 || proj.pDetails.toLowerCase().indexOf(pattern) != -1))){
				innerHTML += '<tr><td style = "border: 1px solid;" onclick = "projDetails('+i+');"><a href = "#">'+proj.id+'</a></td>';
				innerHTML += '<td style = "border: 1px solid;">'+proj.pName+'</td>';
				innerHTML += '<td style = "border: 1px solid;">'+proj.pDetails+'</td>';
				innerHTML += '<td style = "border: 1px solid;"><a href = "./Delete?method=addProj&projId=\''+proj.id+'\'">Delete</a></td></tr>';
			}
		}
		innerHTML += '</table>';
		div.innerHTML = innerHTML;
	}
	
	function projDetails(i){
		document.getElementById('listDiv').style.display = 'none';
		document.getElementById('updateDiv').style.display = 'block';
		var proj = projList[i];
		document.getElementById('projId').value = proj.id;
		document.getElementById('pName').value = proj.pName;
		document.getElementById('pDetails').value = proj.pDetails;
	}
</script>
</head>
<body style = "background: antiquewhite;" onload = "proj();">
	<div>
		<div class = "login" id = "listDiv">
			<h4 style = "margin: 0px 0px 0px 5px;">Projects</h4><hr>
			<div>Search&nbsp; <input type = "text" id = "search" placeholder = "Project Search" onkeyup="setTimeout(proj(),1000);"/></div><br>
			<div id = "userList"></div>
			<br>
			<a href = "./users.jsp">View Emps</a><br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
		<div class = "login" id = "updateDiv">
		<div><div style = "display: inline-flex;"><h4 style = "margin: 0px 0px 0px 5px;">Register</h4></div><div style = "float:right;" onclick = "proj();">Back</div><hr></div>
			<%String error = (String)request.getAttribute("error"); %>
			<span style = "color:red;"><%= (error != null)?error:"" %></span>
			<form action = "./Update">
				<input type = "hidden" name = "method" = value = "addProj">
				<div>Project Id<input type = "text" id = "projId" name = "projId" placeholder = "Enter Project Id"/><span style = "color:red;">*</span><br></div>
				<br>
				<div>Project Name<input type = "text" id = "pName" name = "pName" placeholder = "Enter Project Name"/><br></div>
				<br>
				<div>Project Details<input type = "text" id = "pDetails" name = "pDetails" placeholder = "Enter Project Location"/><br></div><br>
				<br><br>
				<input type = "submit" value = "Submit">
				<input type = "reset" value = "reset">
			</form>
			<br>
			<a href = "./users.jsp">View Emps</a><br>
			<a href = "./register.jsp">Register</a><br>
			<a href = "./viewDept.jsp">View Department Details</a><br>
			<a href = "./index.jsp">Login</a>
		</div>
	</div>
</body>
</html>