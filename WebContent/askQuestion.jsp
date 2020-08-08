<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Service Forum</title>
	</head>
	<body>
		<% 
			try {
				//Getting database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				//Getting parameters from send message form
				String user = request.getParameter("user");
				String message = request.getParameter("message");
				//Random number between 1000 ---> 9999
				Random random = new Random();
				int messageID = random.nextInt(8999) + 1000;
				//SQL query to insert 
				String str = "INSERT INTO Messages VALUES (?,?,?,CURRENT_TIMESTAMP())";
				//Create SQL statement
				PreparedStatement ps = con.prepareStatement(str);
				ps.setInt(1, messageID);
				ps.setString(2, message);
				ps.setString(3, user);
				ps.executeUpdate();
				db.closeConnection(con);
				ps.close();
				out.print("<h2>");
				out.print("Message sent!");
				out.print("</h2>");
			}catch (Exception e) {
				out.print(e);
			}
		%>
		<p><a href="viewForum.jsp" >Click here to return to forum.</a></p>
	</body>
</html>