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
				//SQL query to show entire forum
				String str = "SELECT * FROM Messages m ORDER BY time_stamp";
				//Create SQL statement
				Statement stmt = con.createStatement();
				ResultSet result = stmt.executeQuery(str);
		%>
		<table style="width:100%">
			<tr>
				<td>Message ID</td>
				<td>Owner</td>
				<td>Message</td>
				<td>Date</td>
			<%
				while(result.next()) {
			%>
			<tr>
				<td><%=result.getInt("message_id") %></td>
				<td><%=result.getString("poster") %></td>
				<td><%=result.getString("content") %></td>
				<td><%=result.getString("time_stamp") %></td>
			</tr>
			<%
				}
				db.closeConnection(con);
				stmt.close();
			%>
		</table>
		<div id="representativeReply">
			<form action="sendMessage.jsp" method="post">
			<p>Enter message: </p>
			<textarea name="message" rows="4" cols="50">500 CHARACTERS MAX</textarea>
			<p>Sign username: </p>
			<input type="text" name="user">
			<input type="submit" value="Post Message">
			</form>
		</div>
		<%	
			} catch (Exception e) {
				out.print(e);
			}
		%>
		<p><a href="custRep.jsp" >Return to customer representative page.</a></p>
	</body>
</html>