<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login successful!</title>
	</head>
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				//Create SQL statement
				Statement stmt = con.createStatement();
				
				String user = request.getParameter("employeeUser");
				String pass = request.getParameter("employeePass");
				
				
				String str = "SELECT * FROM Employee where username='" + user + "' and password='" + pass + "'";
				
				ResultSet res = stmt.executeQuery(str);
				
				if(res.next()){
					out.println("Welcome Employee " + user + " logged in");
				}else{
					out.println("invalid username or password, try again");
				}
				
				res.close();
				stmt.close();
				con.close();
				
			}catch(Exception e) {
				out.print(e);
				out.println("Error in login");
			}
			
		%>
		<section>
			<h2>Train Schedule Editor</h2>
			<h3>Add Train Schedule</h3>
			<form action="scheduleAdd.jsp" method="post">
				<p>Transit Line Name: <input type="text" name="routeName"></p>
				<p>Train ID: <input type="text" name="trainID"></p>
				<p>Arrival Time: <input type="text" name="arrivalTime"></p>
				<p>Departure Time: <input type="text" name="departureTime"></p>
				<p>Fare: <input type="text" name="fare"></p>
				<input type="submit" value="Add">
			</form>
			<h3>Delete Train Schedule</h3>
			<form action="scheduleDelete.jsp" method="post">
				<p>Transit Line Name: <input type="text" name="routeName"></p>
				<p>Train ID: <input type="text" name="trainID"></p>
				<p>Arrival Time: <input type="text" name="arrivalTime"></p>
				<p>Departure Time: <input type="text" name="departureTime"></p>
				<p>Fare: <input type="text" name="fare"></p>
				<input type="submit" value="Delete">
			</form>
			<h3>Edit Train Schedule</h3>
			<form action="scheduleEdit.jsp" method="post">
				<p>Transit Line Name: <input type="text" name="routeName"></p>
				<p>Train ID: <input type="text" name="trainID"></p>
				<p>Arrival Time: <input type="text" name="arrivalTime"></p>
				<p>Departure Time: <input type="text" name="departureTime"></p>
				<p>Fare: <input type="text" name="fare"></p>
				<input type="submit" value="Edit">
			</form>
		</section>
		<section>
			<h2>Customer Service Message Service</h2>
			<p>TODO: messaging features</p>
		</section>
		<section>
			<h2>List of Train Schedules for a Given Station</h2>
			<form action="produceList.jsp" method="post">
				<p>Enter train station: <input type="text" name="station"></p>
				<input type="submit" value="Produce List">
			</form>
		</section>
		<section>
			<h2>List of Customers Reserved for Given Transit Line</h2>
			<form action="produceList.jsp" method="post">
				<p>Enter transit line name: <input type="text" name="route"></p>
				<p>Enter date: <input type="text" name="date"></p>
				<input type="submit" value="Produce List">
			</form>
		</section>
		<form action="index.jsp" method="post">
			<button type="submit">Log Out</button>
		</form>
	</body>
</html>