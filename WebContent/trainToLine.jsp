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
				
				String str = "SELECT * FROM Schedule_Has WHERE train_id = ? and transit_line = ?";
				PreparedStatement ps = con.prepareStatement(str);
				ps.setInt(1, trainID);
				ps.setString(2, name);
				ResultSet result = ps.executeQuery();
				
				if(result.next()){
					out.println("Train already servicing that line!");
					ps.close();
					result.close();
				}else{
					//Insert statement into Customer Table
					str = "INSERT INTO Schedule_Has(train_id, transit_line) VALUES (?,?)";
					ps = con.prepareStatement(str);
					//Adding parameters to statement
					ps.setInt(1, trainID);
					ps.setString(2, name);
					//Running query
					ps.executeUpdate();
					ps.close();
					result.close();
					out.print("<h2>");
					out.print("Operation successful!");
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