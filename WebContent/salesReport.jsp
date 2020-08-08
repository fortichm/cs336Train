<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Sales Report</title>
	</head>
	<body>
	
		<h2>Total Sales by Month</h2>
	
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
					
				String month = request.getParameter("sortBy");
				
				out.println("Sales for month "+month);
				
				String str = "SELECT MONTH(purchase_date) AS " 
						+ " Month, SUM(total_fare) AS "
						+ " Revenue FROM Ticket_Purchases "
						+ " tp, Ticket t "
						+ " WHERE tp.res_no = t.res_no "
						+ " AND MONTH(purchase_date) = '"+month+"'";
				PreparedStatement ps = con.prepareStatement(str);
				ResultSet result = ps.executeQuery();
			%>
			
				<table style="width:100%">
				<tr>
				<td>Total Revenue</td>
				</tr>
			
			<%
				while(result.next()) {
			%>
			<tr>
			<td>$ <%=result.getFloat("Revenue") %></td>
			<tr>
				
			</tr>
			<%
				}
				db.closeConnection(con);
				ps.close();
				con.close();
			%>
			</table>
			<%	
					
					
					
		
				con.close();
			
				
			} catch (Exception e) {
				out.print(e);
				out.print("some error");
			}
		%>
			<p>
				<a href="admin.jsp">Click here to return to admin page.</a>
			</p>
	</body>
</html>