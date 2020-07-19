<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train Schedules</title>
</head>
<body>
<% try {
	
			//get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			out.println("If you're customer with an account, login here:");
			

		%>
			<table style="with: 100%">
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>

            </table>
            <input type="submit" value="Login" />
	
				

			<% 
			//close the connection.
			db.closeConnection(con);
			%>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	
</body>
</html>