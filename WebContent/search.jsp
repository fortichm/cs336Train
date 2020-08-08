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
				
				String origin = request.getParameter("origin");
				String destination = request.getParameter("destination");
				String date = request.getParameter("date");
				date += "%";
				String criteria = request.getParameter("sortBy");
				//SQL query to get stop number on origin
				String str = "SELECT ss.stop_no" 
				+ " FROM Schedule_Station ss"
				+ " INNER JOIN Station a ON ss.station_id = a.station_id"
				+ " INNER JOIN Station b ON ss.next_station_id = b.station_id"
				+ " WHERE a.station_name = ?";
				//Creating prepared statement
				PreparedStatement ps = con.prepareStatement(str);
				ps.setString(1, origin);
				ResultSet result = ps.executeQuery();
				int x = 0;
				if (result.next()) {
					x = result.getInt("stop_no");
				}
				//SQL query to get stop number on destination
				str = "SELECT ss.stop_no" 
				+ " FROM Schedule_Station ss"
				+ " INNER JOIN Station a ON ss.station_id = a.station_id"
				+ " INNER JOIN Station b ON ss.next_station_id = b.station_id"
				+ " WHERE b.station_name = ?";
				ps = con.prepareStatement(str);
				ps.setString(1, destination);
				result = ps.executeQuery();
				int y = 0;
				if (result.next()) {
					y = result.getInt("stop_no");
				}
				//The SQL query to display table
				str = "SELECT ss.transit_line, ss.train_id,"
				+ " a.station_name origin, b.station_name destination, ss.departure, ss.arrival,"
				+ " ROUND(ss.fare, 2) adult, ROUND(ss.fare*0.75, 2) child, ROUND(ss.fare*0.65, 2) senior, ROUND(ss.fare*0.50, 2) disabled, TIMESTAMPDIFF(MINUTE, departure, arrival) travel_time"
				+ " FROM Schedule_Station ss"
				+ " INNER JOIN Station a ON ss.station_id = a.station_id"
				+ " INNER JOIN Station b ON ss.next_station_id = b.station_id"
				+ " WHERE ss.stop_no >= ? AND ss.stop_no <= ?"
				+ " AND departure LIKE ?"
				+ " ORDER BY ? ASC";
				//Running the query
				ps = con.prepareStatement(str);
				ps.setInt(1, x);
				ps.setInt(2, y);
				ps.setString(3, date);
				ps.setString(4, criteria);
				result = ps.executeQuery();
		%>
		<table style="width:100%">
			<tr>
				<th>Transit Line Name</th>
				<th>Train ID</th>
				<th>Origin</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Travel Time</th>
				<th>Adult Fare</th>
				<th>Child Fare</th>
				<th>Senior Fare</th>
				<th>Disabled Fare</th>
			</tr>
			<%
				while(result.next()) {
			%>
			<tr>
				<td><%=result.getString("transit_line") %></td>
				<td><%=result.getInt("train_id") %></td>
				<td><%=result.getString("origin") %></td>
				<td><%=result.getString("destination") %></td>
				<td><%=result.getTimestamp("departure") %></td>
				<td><%=result.getTimestamp("arrival") %></td>
				<td><%=result.getString("travel_time") %></td>
				<td><%=result.getFloat("adult") %></td>
				<td><%=result.getFloat("child") %></td>
				<td><%=result.getFloat("senior") %></td>
				<td><%=result.getFloat("disabled") %></td>
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
		<p><a href="index.jsp" >Click here to return to main page.</a></p>
	</body>
</html>