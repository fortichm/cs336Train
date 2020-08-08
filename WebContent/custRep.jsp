<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Representative</title>
	</head>
		
		<div id="repFunctions">
			<h2>Train Schedule Editor</h2>
			<h3>Add Train Service Information</h3>
			<form action="addtrain.jsp" method="post">
			<p>Add train to fleet: <input type="text" name="train_id" value="Train ID"> <input type="submit" value="Add"></p>
			</form>
			<form action="addstation.jsp" method="post">
			<p>Add station to service:</p>
			<p><input type="text" name="station_id" value="Station ID"></p>
			<p><input type="text" name="station_name" value="Station Name"></p>
			<p><input type="text" name="city" value="City"></p>
			<p><input type="text" name="state" value="State"></p>
			<p><input type="submit" value="Add Station"></p>
			</form>
			<form action="trainToLine.jsp" method="post">
			<p>Add train to service specified line:</p>
			<p><input type="text" name="train_id" value="Train ID">
			<p><input type="text" name="transit_line" value ="Transit Line"></p>
			<p><input type="submit" value="Save"></p>
			</form>
			<h3>Delete Train Schedule</h3>
			<form action="scheduleDelete.jsp" method="post">
				<h4>Delete schedule information pertaining train and the line it services, please specify:</h4>
				<p>Train ID: <input type="text" name="train_id"></p>
				<p>Transit Line: <input type="text" name="transit_line"></p>
				<input type="submit" value="Delete">
			</form>
			<h3>Edit Train Schedule</h3>
			<form action="scheduleEdit.jsp" method="post">
				<h4>Specify transit line, stop number, and train servicing it to edit fares:</h4>
				<p>Train ID: <input type="text" name="train_id"></p>
				<p>Transit Line Name: <input type="text" name="transit_line"></p>
				<p>Stop Number: <input type="text" name="stop_no"></p>
				<p>Fare: <input type="text" name="fare"></p>
				<input type="submit" value="Save">
			</form>
		</div>
		<div id="messaging">
			<h2>Customer Service Message Service</h2>
			<form action="showMessages.jsp" method="post">
			<button type="submit">View Customer Service Forum</button>
			</form>
		</div>
		<div id=listByStation>
			<h2>List of Train Schedules for a Given Station</h2>
			<form action="listByStation.jsp" method="post">
				<p>Enter train station: <input type="text" name="station"></p>
				<input type="submit" value="Produce List">
			</form>
		</div>
		<div>
			<h2>List of Customers Reserved for Given Transit Line</h2>
			<form action="listCustomersByLine.jsp" method="post">
				<p>Enter transit line name: <input type="text" name="route"></p>
				<p>Enter date: <input type="text" name="date"></p>
				<input type="submit" value="Produce List">
			</form>
		</div>
		<form action="index.jsp" method="post">
			<button type="submit">Log Out</button>
		</form>
	</body>
</html>