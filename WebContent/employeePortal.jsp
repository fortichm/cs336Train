<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Railway Employee Portal</title>
	</head>
	<body>
		<div id="customerRepLogin">
			<p>Customer Representatives, please login here:</p>
			<form action="custRep.jsp" method="post">
				<p>
					Username:
					<input type="text" name="employeeUser">
				</p>
				<p>
					Password:
					<input type="password" name="employeePass">
				</p>
				<p> <input type="submit" value="Login"> </p>
			</form>
		</div>
		<div id="adminLogin">
			<p>Administrator, please login here:</p>
			<form action="admin.jsp" method="post">
				<p>
					Username:
					<input type="text" name="employeeUser">
				</p>
				<p>
					Password:
					<input type ="password" name="employeePass">
				</p>
				<p> <input type="submit" value="Login"> </p>
			</form>
		</div>
	</body>
</html>