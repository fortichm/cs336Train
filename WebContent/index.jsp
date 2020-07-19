<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Railway</title>
	</head>
	<body>
	
	<% try {
	
			//get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			

		%>
		<%} catch (Exception e) {
			out.print(e);
		}%>
	
	
	
		<div id="login">
			<p>Please login here:</p>
			<form action="login.jsp" method="post">
				<p>
					Username:
					<input type="text" name="user">
				</p>
				<p>
					Password:
					<input type ="password" name="pass">
				</p>
				<p>Please select user type:</p>
				<select>
					<option value="customer">Customer</option>
					<option value="rep">Representative</option>
					<option value="admin">Administrator</option>
				</select>
				<p> <input type="submit" value="Login"> </p>
			</form>
		</div>
		<div id="registration">
			<p>If you are a customer without an account, sign up here:</p>
			<form action = "register.jsp" method="post">
				<p>
					First Name:
					<input type="text" name="firstName">
				</p>
				<p>
					Last Name:
					<input type="text" name="lastName">
				</p>
				<p>
					E-mail:
					<input type="text" name="email">
				</p>
				<p>
					Enter desired username:
					<input type="text" name="newUser">
				</p>
				<p>
					Enter desired password:
					<input type="password" name="newPass">
				</p>
				<p><input type="submit" value="Register"></p>
			</form>
		</div>
	</body>
</html>