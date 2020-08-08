<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin Page</title>
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
					%>
					
					<div id="adminLogin">
						<h3>Click to enter Admin Portal</h3>
						<form action="admin.jsp" method="post">
							<p> <input type="submit" value="Enter"> </p>
						</form>
					</div>
							
					<% 
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
		
	
		
		<p>
			<a href="index.jsp">Click here to logout and return to home page.</a>
		</p>
	</body>
</html>