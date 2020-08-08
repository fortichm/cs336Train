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
		
		<div id="reservation">
			<h2>Make a reservation: </h2>
			<form action="reservCheckOut.jsp" method ="post">
				<p>
					Origin:
					<input type="text" name="origin">
				</p>
				<p>
					Destination:
					<input type="text" name="destination">
				</p>
				<p>
					Travel Date:
					<input type="text" name="date" value="YYYY-MM-DD">
				</p>
				<p> Discount if applicable:
					<select name="disc" id="disc">
					<option value="none"> none </option>
					<option value="child"> Child </option>
					<option value="Senior"> Senior </option>
					<option value="Disabled"> Disabled </option>
					</select> 
				</p>
				
				<p> <input type="submit" value="Reserve"> </p>
			</form>
		</div>
		
		<div id="history">
		<h2>View Current and Past Reservations</h2>
		<form action="reservationHistory.jsp" method="post">
		<p>Enter username again: <input type="text" name="username"></p>
		<input type="submit" value="View"> 
		</form>
		</div>
		
		<div id="cancelReserv">
			<h2>Cancel Reservation</h2>
			<form action="reservCheckOut.jsp" method="post">
			
				<p>
					Please input reservation number to be cancelled
					<input type="text" name="resnum">
				</p>
				
				<p> <input type="submit" value="Cancel"> </p>
			</form>
		</div>
		
		<div id="customerService">
			<h2>Customer Service Forum</h2>
			<form action="viewForum.jsp" method="post">
			<button type="submit">View Customer Service Forum</button>
			</form>
			<form action="searchForum.jsp" method="post">
			<h3>Search forum by keyword</h3>
			<input type="text" name="keyword" value="Enter keyword here">
			<input type="submit" value="Search">
			</form>
		</div>
		
		<p>
			<a href="index.jsp">Click here to logout and return to home page.</a>
		</p>
	</body>
</html>