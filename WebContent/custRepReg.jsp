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
				
				
				
				//Getting parameters
				String SSN = request.getParameter("SSN");
				String username = request.getParameter("newUser");
				String password = request.getParameter("newPass");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				
				
				
				String str = "SELECT * FROM Employee where username='" + username + "' OR SSN='" + SSN +"'";
				Statement stmt0 = con.createStatement();
				ResultSet res = stmt0.executeQuery(str);
				
				if(res.next()){
					out.println("Customer Rep exists!, try again");
					stmt0.close();
					res.close();		
				}else{
				
					//Create SQL statement
					Statement stmt = con.createStatement();
					//Insert statement into Customer Table
					String insert = "INSERT INTO Employee(SSN, Username, Password, FirstName, LastName)" 
							+ "VALUES (?, ?, ?, ?, ?)";
					
					//Creating prepared statement
					PreparedStatement ps = con.prepareStatement(insert);
					
					//Adding parameters to statement
					ps.setString(1,SSN);
					ps.setString(2,username);
					ps.setString(3,password);
					ps.setString(4,firstName);
					ps.setString(5,lastName);
					
					//Running query
					ps.executeUpdate();
					stmt.close();
					out.print("new Customer Representative added");
				}
				//Closing connection
				
		
				con.close();
				
				
			} catch (Exception e) {
				out.print(e);
				out.print("Error in registration");
			}
		%>
			<p>
				<a href="admin.jsp">Click here to return to admin page.</a>
			</p>
	</body>
</html>