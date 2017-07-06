<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<%
		
		String echar=request.getParameter("echar");
		String message=""; 
				try {
					JSONArray array = new JSONArray();
					JSONObject Emailid = new JSONObject();
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/EmployeeDB", "root",
							"secret");
					Statement s = con.createStatement();
					String query = "SELECT EmpID,EmailID FROM Employee where EmailID like '%"+echar+"%'";
					ResultSet rs = s.executeQuery(query);
					while (rs.next()) {
						String Email = rs.getString("EmailID");
						int Id=rs.getInt("EmpID");
						Emailid.put(Id,Email);
				}
					array.add(Emailid);
					
				%><%=Emailid%>
				<%
				} catch (SQLException se) {
					se.printStackTrace();
				} catch (Exception e) {
					out.println(e);
				}
			%>