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
				//SQL query to show reservation history
				String str = "SELECT r.res_no, tp.username, t.purchase_date, tp.total_fare" 
				+ " FROM Reservations r"
				+ " INNER JOIN Ticket_Purchases tp ON tp.res_no = r.res_no"
				+ " INNER JOIN Ticket t ON t.res_no = r.res_no"
				+ " WHERE tp.username = ?"
				+ " ORDER BY purchase_date DESC";
				//Create SQL statement
				String user = request.getParameter("username");
				PreparedStatement ps = con.prepareStatement(str);
				ps.setString(1, user);
				ResultSet result = ps.executeQuery();
		%>
		<table style="width:100%">
			<tr>
				<td>Reservation ID</td>
				<td>Username</td>
				<td>Purchase Date</td>
				<td>Total Fare</td>
			<%
				while(result.next()) {
			%>
			<tr>
				<td><%=result.getInt("res_no") %></td>
				<td><%=result.getString("username") %></td>
				<td><%=result.getString("purchase_date") %></td>
				<td><%=result.getString("total_fare") %></td>
			</tr>
			<%
				}
				db.closeConnection(con);
				ps.close();
			%>
		</table>
		<%	
			} catch (Exception e) {
				out.print(e);
			}
		%>
		<p><a href="login.jsp" >Return to customer page.</a></p>
	</body>
</html>