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
				
				String user = request.getParameter("user");
				String pass = request.getParameter("pass");
				
				
				String str = "SELECT * FROM Customer where username='" + user + "' and password='" + pass + "'";
				
				ResultSet res = stmt.executeQuery(str);
				
				if(res.next()){
					out.println(user + "logged in");
				}else{
					out.println("invalid username or password, try again");
				}
				
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