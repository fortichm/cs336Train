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
	
		<h2>List of Reservations</h2>
	
		<%
			try {
				//Get database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
					
					String param = request.getParameter("search");
					String criteria = request.getParameter("sortBy");
					
					if(criteria.charAt(0)=='L'){
						
						
					}else if(criteria.charAt(0)=='C'){
						String str = "select res_no, total_fare from Ticket_Purchases where username='"+param+"'";
						//Creating prepared statement
						PreparedStatement ps = con.prepareStatement(str);
						ResultSet result = ps.executeQuery();
						%>
						<table style="width:100%">
						<tr>
							<td>Res Num</td>
							<td>Fare</td>
							
						</tr>
						
						<%
							while(result.next()) {
						%>
							<tr>
								<td><%=result.getInt("res_no") %></td> 
								<td> $ <%=result.getFloat("total_fare")%> </td>
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