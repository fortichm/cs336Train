<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin Page</title>
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
				
				
				String str = "SELECT * FROM Employee where username='" + user + "' and pword='" + pass + "' and JobRole='A' ";
				
				ResultSet res = stmt.executeQuery(str);
				
				if(res.next()){
					
					out.println("Welcome Administrator " + user + " logged in");
					
					
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
		<h1>Admin Functions</h1>
		
		<div id="registration">
			<h2>Add Customer Representative</h2>
			<p>Enter Rep Info</p>
			<form action = "custRepReg.jsp" method="post">
				<p>
					SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter desired username:
					<input type="text" name="newUser">
				</p>
				<p>
					Enter desired password:
					<input type="password" name="newPass">
				</p>
				<p>
					First Name:
					<input type="text" name="firstName">
				</p>
				<p>
					Last Name:
					<input type="text" name="lastName">
				</p>
				<p><input type="submit" value="Add"></p>
			</form>
		</div>
		
		<div id="delete">
			<h2>Delete an active Customer Representative</h2>
			<p>Enter Rep Info</p>
			<form action = "deleteRep.jsp" method="post">
				<p>
					Enter SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter username:
					<input type="text" name="user">
				</p>
				
				<p><input type="submit" value="Delete"></p>
			</form>
		</div>
		
		<div id="edit">
			<h2>Edit an active Customer Representative</h2>
			<form action = "editRep.jsp" method="post">
				<p>
					Enter their SSN:
					<input type="text" name="SSN">
				</p>
				<p>
					Enter their username:
					<input type="text" name="user">
				</p>
				<p>Enter new parameters</p>
				<p>
					Enter new password:
					<input type="password" name="newPass">
				</p>
				<p>
					Change First Name:
					<input type="text" name="firstName">
				</p>
				<p>
					Change Last Name:
					<input type="text" name="lastName">
				</p>
		
				<p><input type="submit" value="Edit"></p>
			</form>
		</div>
		
		
		
		<h1>Sales Inquiries</h1>
		
		<div id="Sales Report">
			<%
			try {
				//Getting database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				String str = "select t.purchase_date, t.res_no, p.total_fare from Ticket_Purchases p, Ticket t where t.res_no=p.res_no";
				//Creating prepared statement
				PreparedStatement ps = con.prepareStatement(str);
				ResultSet result = ps.executeQuery();
			%>
			<h2>Sales Report Per Month</h2>
				<table style="width:100%">
			<tr>
			<%
				while(result.next()) {
			%>
			<td><%=result.getString("t.res_no") %></td>	
			<td><%=result.getString("total_fare") %></td>
			<td><%=result.getString("purchase_date") %></td>
				
			</tr>
			<%
				}
				db.closeConnection(con);
				ps.close();
				con.close();
			%>
			</table>
			<%	
			} catch (Exception e) {
				out.print(e);
			}
		%>
		
		</div>
		
		
		
		
		<div id="Res List">
			<h2>List of Reservations</h2>
			<h3>By Transit Line or Customer</h3>
			
			<form action="resList.jsp" method="post">
				<p> Select:
					<select name="sortBy" id="sortBy">
					<option value="Customer"> Customer </option>
					<option value="Line"> Line </option>
					</select> 
				</p>
				<p>
					Line or Username:
					<input type="text" name="search" >
				</p>			
				<button type=submit>Search</button>
			</form>
		</div>
		
		
		
		<div id="Rev List">
			<h2>List of Revenue</h2>
			<h3>By Transit Line or Customer</h3>
			
			<form action="revList.jsp" method="post">
				<p> Select:
					<select name="sortBy" id="sortBy">
					<option value="Customer"> Customer </option>
					<option value="Line"> Line </option>
					</select> 
				</p>
				<p>
					Line or Username:
					<input type="text" name="search" >
				</p>			
				<button type=submit>Search</button>
			</form>
		</div>
		
		
		
		<div id="Best Customer">
			<h2>Best Customer</h2>
			<%
			try {
				//Getting database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				String str = "SELECT username, SUM(total_fare) FROM Ticket_Purchases GROUP BY username HAVING SUM(total_fare) = (SELECT MAX(total_fare)  FROM (SELECT SUM(total_fare)  total_fare FROM Ticket_Purchases GROUP BY username) tab) ";
				//Creating prepared statement
				PreparedStatement ps = con.prepareStatement(str);
				ResultSet result = ps.executeQuery();
			%>
			<%
				if(result.next()) {
			%>
			<table style="width:100%">
			<tr>
				<td>Username: <%=result.getString("username") %></td>
				<td>Total Fare: $<%=result.getFloat("SUM(total_fare)") %></td>
				
			</tr>
			<%
				}
				db.closeConnection(con);
				ps.close();
				con.close();
			%>
			</table>
			<%	
			} catch (Exception e) {
				out.print(e);
			}
			
		%>
		</div>
		
		<div id="5 Active lines">
			<h2>5 Most Active Train Lines</h2>
			<%
			try {
				//Getting database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				String str = "select distinct transit_line from Reservations";
				//Creating prepared statement
				PreparedStatement ps = con.prepareStatement(str);
				ResultSet result = ps.executeQuery();
			%>
			<%
				while(result.next()) {
			%>
			<table style="width:100%">
			<tr>
				<td><%=result.getString("transit_line") %></td>
			</tr>
			<%
				}
				db.closeConnection(con);
				ps.close();
				con.close();
			%>
			</table>
			<%	
			} catch (Exception e) {
				out.print(e);
			}
			
		%>
			
		</div>
		
		
		
		<p>
			<a href="index.jsp">Click here to logout and return to home page.</a>
		</p>
	</body>
</html>