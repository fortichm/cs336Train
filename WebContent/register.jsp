<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Registration</title>
	</head>
	<body>
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.creatStatement();
				
				//Getting parameters
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String username = request.getParameter("newUser");
				String password = request.getParameter("newPass");
				String email = request.getParameter("email");
				
				//Insert statement into Customer Table
				String insert = "INSERT INTO Customer(Username, Password, FirstName, LastName, EmailAddress)" +
						+ "VALUES (?, ?, ?, ?, ?)";
				
				//Creating prepared statement
				PreparedStatement ps = con.prepareStatement(insert);
				
				//Adding parameters to statement
				ps.setString(username, 1);
				ps.setString(password, 2);
				ps.setString(firstName, 3);
				ps.setString(lastName, 4);
				ps.setString(email, 5);
				
				//Running query
				ps.executeUpdate();
				
				//Closing connection
				con.close();
			} catch (Exception e) {
				out.print(e);
				out.print("Error in registration");
			}
		%>
			<p>
				<a href="index.jsp">Click here to return to home page and sign in.</a>
			</p>
	</body>
</html>