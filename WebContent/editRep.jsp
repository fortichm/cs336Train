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
				String username = request.getParameter("user");
				String password = request.getParameter("newPass");
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
			
				
				String str = "SELECT * FROM Employee where username='" + username + "' AND SSN='" + SSN +"'";
				Statement stmt0 = con.createStatement();
				ResultSet res = stmt0.executeQuery(str);
				
				if(res.next()){
					//Create SQL statement
					
					Statement stmt = con.createStatement();
					//Insert statement into Customer Table
					String delete = "UPDATE Employee SET password='" +password+"', FirstName='" +firstName+"', LastName='" +lastName+"' where username='" + username + "' AND SSN='" + SSN +"'";
					
					//Creating prepared statement
					PreparedStatement ps = con.prepareStatement(delete);
					
					
					//Running query
					ps.executeUpdate();
					stmt.close();
					
					out.print("Customer Representative edited");
					
				}else{
		
					out.println("Customer Rep does not exist, try again");
					stmt0.close();
					res.close();
							
				}
				//Closing connection
				
		
				con.close();
				
				
			} catch (Exception e) {
				out.print(e);
				out.print("Error in edit");
			}
		%>
			<p>
				<a href="admin.jsp">Click here to return to admin page.</a>
			</p>
	</body>
</html>