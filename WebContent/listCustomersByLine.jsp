<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Results</title>
	</head>
	<body>
		<% 
			try {
				//Getting database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String transit_line = request.getParameter("route");
				String date = request.getParameter("date");
				//The SQL query to display table
				String str = "SELECT DISTINCT r.transit_line, t.passenger, t.purchase_date"
				+ " FROM Reservations r"
				+ " INNER JOIN Ticket t ON r.res_no = t.res_no"
				+ " INNER JOIN Schedule_Station ss ON ss.transit_line = r.transit_line"
				+ " WHERE r.transit_line = ? AND t.purchase_date = ?";
				//Running the query
				PreparedStatement ps = con.prepareStatement(str);
				ps.setString(1, transit_line);
				ps.setString(2, date);
				ResultSet result = ps.executeQuery();
		%>
		<table style="width:100%">
			<tr>
				<th>Transit Line</th>
				<th>Passenger</th>
				<th>Date</th>
			</tr>
			<%
				while(result.next()) {
			%>
			<tr>
				<td><%=result.getString("transit_line") %></td>
				<td><%=result.getString("passenger") %></td>
				<td><%=result.getString("purchase_date") %></td>
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
		<p><a href="custRep.jsp" >Return to customer representative page.</a></p>
	</body>
</html>