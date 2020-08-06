<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login successful!</title>
	</head>
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				String user = request.getParameter("employeeUser");
				String pass = request.getParameter("employeePass");
				
				
				String str = "SELECT * FROM Employee where username='" + user + "' and pword='" + pass + "' and JobRole='A' ";
				
				ResultSet res = stmt.executeQuery(str);
				
				if(res.next()){
					
					out.println("Welcome Administrator " + user + " logged in");
					
					
				}else{
					
					out.println("invalid username or password, try again");
							
				}
				
				res.close();
				stmt.close();
				con.close();
				
			}catch(Exception e) {
				out.print(e);
				out.println("Error in login");
			}
			
		%>
		<h1>Customer Rep Functions</h1>
		
		<div id="registration">
			<h2>Add Customer Representative</h2>
			<p>Enter Rep Info</p>
			<form action = "custRepReg.jsp" method="post">
				<p>
					SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter desired username:
					<input type="text" name="newUser">
				</p>
				<p>
					Enter desired password:
					<input type="password" name="newPass">
				</p>
				<p>
					First Name:
					<input type="text" name="firstName">
				</p>
				<p>
					Last Name:
					<input type="text" name="lastName">
				</p>
				<p><input type="submit" value="Add"></p>
			</form>
		</div>
		
		<div id="delete">
			<h2>Delete an active Customer Representative</h2>
			<p>Enter Rep Info</p>
			<form action = "deleteRep.jsp" method="post">
				<p>
					Enter SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter username:
					<input type="text" name="user">
				</p>
				
				<p><input type="submit" value="Delete"></p>
			</form>
		</div>
		
		<div id="edit">
			<h2>Edit an active Customer Representative</h2>
			<form action = "editRep.jsp" method="post">
				<p>
					Enter their SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter their username:
					<input type="text" name="user">
				</p>
				<p>Enter new parameters</p>
				<p>
					Enter new password:
					<input type="password" name="newPass">
				</p>
				<p>
					Change First Name:
					<input type="text" name="firstName">
				</p>
				<p>
					Change Last Name:
					<input type="text" name="lastName">
				</p>
		
				<p><input type="submit" value="Edit"></p>
			</form>
		</div>
		
		<h1>Sales Inquiries</h1>
		
		<div id="Sales Report">
			<h2>Obtain Sales Report Per Month</h2>
			<form action = "editRep.jsp" method="post">	
				<p>
					Click here
				</p>
				<p><input type="submit" value="Obtain"></p>
			</form>
		</div>
		
		<div id="Res List">
			<h2>List of Reservations</h2>
			<form action = "editRep.jsp" method="post">	
				<p>
					Click here
				</p>
				<p><input type="submit" value="Obtain"></p>
			</form>
		</div>
		
		<div id="Rev List">
			<h2>List of Revenue</h2>
			<form action = "editRep.jsp" method="post">	
				<p>
					Click here
				</p>
				<p><input type="submit" value="Obtain"></p>
			</form>
		</div>
		
		<div id="Best Customer">
			<h2>Best Customer</h2>
			<form action = "editRep.jsp" method="post">	
				<p>
					Click here
				</p>
				<p><input type="submit" value="Obtain"></p>
			</form>
		</div>
		
		<div id="5 Active lines">
			<h2>5 Most Active Train Lines</h2>
			<form action = "editRep.jsp" method="post">	
				<p>
					Click here
				</p>
				<p><input type="submit" value="Obtain"></p>
			</form>
		</div>
		
		
		
		<p>
			<a href="index.jsp">Click here to logout and return to home page.</a>
		</p>
	</body>
</html>