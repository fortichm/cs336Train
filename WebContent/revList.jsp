<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Revenue List</title>
	</head>
	<body>
	
		<h2>Revenue List</h2>
	
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
					
					String param = request.getParameter("search");
					String criteria = request.getParameter("sortBy");
					
					if(criteria.charAt(0)=='L'){
						out.print(param+"'s Revenue");
						String str = "SELECT r.transit_line, t.purchase_date, tp.total_fare" 
								+ " FROM Reservations r"
								+ " INNER JOIN Ticket_Purchases tp ON tp.res_no = r.res_no"
								+ " INNER JOIN Ticket t ON t.res_no = r.res_no"
								+ " WHERE r.transit_line = ?"
								+ " ORDER BY purchase_date DESC";
								//Create SQL statement
						PreparedStatement ps = con.prepareStatement(str);
						ps.setString(1, param);
						ResultSet result = ps.executeQuery();
						%>
						<table style="width:100%">
						<tr>
							
							<td>Transit Line</td>
							<td>Purchase Date</td>
							<td>Total Fare</td>
						
						<%
							while(result.next()) {
						%>
							<tr>
								
								<td><%=result.getString("transit_line") %></td>
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
						
						
					}else if(criteria.charAt(0)=='C'){
						out.print("User: "+param+"'s reservations");
						String str = "SELECT tp.username, t.purchase_date, tp.total_fare" 
								+ " FROM Reservations r"
								+ " INNER JOIN Ticket_Purchases tp ON tp.res_no = r.res_no"
								+ " INNER JOIN Ticket t ON t.res_no = r.res_no"
								+ " WHERE tp.username = ?"
								+ " ORDER BY purchase_date DESC";
								//Create SQL statement
						PreparedStatement ps = con.prepareStatement(str);
						ps.setString(1, param);
						ResultSet result = ps.executeQuery();
						%>
						<table style="width:100%">
						<tr>
							
							<td>Username</td>
							<td>Purchase Date</td>
							<td>Total Fare</td>
						
						<%
							while(result.next()) {
						%>
							<tr>
								
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
					}
					
									
					
		
				con.close();
			
			} catch (Exception e) {
				//out.print(e);
				out.print("no revenue generated");
			}
		%>
			<p>
				<a href="admin.jsp">Click here to return to admin page.</a>
			</p>
	</body>
</html>