<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Railway</title>
	</head>
	<body>
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				//Getting parameters
				int trainID = Integer.valueOf(request.getParameter("train_id"));
				String name = request.getParameter("transit_line");
				int stopNumber = Integer.valueOf(request.getParameter("stop_no"));
				float newFare = Float.valueOf(request.getParameter("fare"));
				
				String str = "SELECT * FROM Schedule_Station WHERE train_id = ?"
						+ " AND transit_line = ? AND stop_no = ?";
				PreparedStatement ps = con.prepareStatement(str);
				ps.setInt(1, trainID);
				ps.setString(2, name);
				ps.setInt(3, stopNumber);
				ResultSet result = ps.executeQuery();
				
				if(result.next()){
					str = "UPDATE Schedule_Station set fare = ?"
						+ " WHERE train_id = ? AND transit_line = ? AND stop_no = ?";
					ps = con.prepareStatement(str);
					ps.setFloat(1, newFare);
					ps.setInt(2, trainID);
					ps.setString(3, name);
					ps.setInt(4, stopNumber);
					ps.executeUpdate();
					ps.close();
					result.close();
					out.print("<h2>");
					out.print("Operation successful!");
					out.print("</h2>");
				}else{
					//Insert statement into Customer Table
					out.print("<h2>");
					out.print("Record does not exist!");
					out.print("</h2>");
				} 
				//Closing connection
				con.close();
			} catch (Exception e) {
				out.print(e);
				out.print("Error!");
			}
		%>
			<p>
				<a href="custRep.jsp">Return to customer representative page.</a>
			</p>
	</body>
</html>