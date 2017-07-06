package emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();

		String file=request.getParameter("file");
		if(file.equals("Search"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminOptions.jsp");  
			rd.include(request, response); 	
			String name="",value="";
			int flag=0;
			Enumeration en = request.getParameterNames();
			while(en.hasMoreElements())
			{
				name=(String) en.nextElement();
				value=request.getParameter(name);
				break;
			}   

			try
			{

				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s=con.createStatement();
				String query="select * from Employee Inner join Designation on Employee.Did=Designation.DId where "+name+"='"+value+"'";
				ResultSet rs=s.executeQuery(query);
				out.println("<html><head><title></title></head><body><h3><font color=Brown>EMPLOYEE DETAILS:</h3><table border=1 cellpadding=5 cellspacing=5><tr><th>EmpID</th><th>FirstName</th><th>LastName</th><th>Age</th><th>Email ID</th><th>Address</th><th>Mobileno</th><th>Gender</th>");
				out.println("<th>Designation</th></font</tr>");
				while(rs.next())
				{
					flag=1;
					out.print("<tr><td>"+rs.getInt("EmpID")+"</td>");
					out.print("<td>"+rs.getString("FirstName")+"</td>");
					out.print("<td>"+rs.getString("LastName")+"</td>");
					out.print("<td>"+rs.getInt("Age")+"</td>");
					out.print("<td>"+rs.getString("EmailID")+"</td>");
					out.print("<td>"+rs.getString("Address")+"</td>");
					out.print("<td>"+rs.getLong("Mobileno")+"</td>");
					out.print("<td>"+rs.getString("Gender")+"</td>");
					out.print("<td>"+rs.getString("Designation")+"</td></tr>");
				}
				out.println("</table></body></html>");
				if(flag==0)
				{
					out.println("REQUESTED USER DATA NOT AVAILABLE");
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
		else if(file.equals("update"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("Employeeoptions.jsp");  
			rd.include(request, response); 
			String Employeeid=request.getParameter("upid");
			String EmployeePass=request.getParameter("uppassword");
			String EmployeeFirstName     =request.getParameter("upfname");
			String EmployeeLastName     =request.getParameter("uplname");
			String EmployeeAge     =request.getParameter("upage");
			String EmployeeMail      =request.getParameter("upemail");
			String EmployeeAddress  =request.getParameter("upaddress");
			String EmployeeMobile   =request.getParameter("upmobile");
			String EmployeeGender   =request.getParameter("upgender");
			String EmployeeDesgination =request.getParameter("updesg");
			try
			{

				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s=con.createStatement();
				String query="update Employee set EmpID='"+Employeeid+"',Password='"+EmployeePass+"',FirstName='"+EmployeeFirstName+"',LastName='"+EmployeeLastName+"',Age='"+EmployeeAge+"',EmailID='"+EmployeeMail+"',Address='"+EmployeeAddress+"',Mobileno='"+EmployeeMobile+"',Gender='"+EmployeeGender+"',Designation='"+EmployeeDesgination+"' where EmpID='"+Employeeid+"'";
				s.executeUpdate(query);
				out.println("<h2><center><font color=green>!!!DATA GET UPDATED!!!</font></center></h2>");

			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
		else if(file.equals("Profile"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("Employeeoptions.jsp");  
			rd.include(request, response); 
			int Employeeid=Integer.parseInt(request.getParameter("EmpID"));
			try
			{

				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s=con.createStatement();
				Statement s1=con.createStatement();
				String query="Select EmpID from ReportingDetails where ReportingDetails.ReportingempID='"+Employeeid+"'";
				ResultSet rs=s.executeQuery(query);
				out.println("<html><head><title></title></head><body><h3><font color=Brown>EMPLOYEE DETAILS:</h3><table border=1 cellpadding=5 cellspacing=5><tr><th>EmpID</th><th>FirstName</th><th>LastName</th><th>Age</th><th>Email ID</th><th>Address</th><th>Mobileno</th><th>Gender</th>");
				out.println("<th>Designation</th></font</tr>");
				while(rs.next())
				{
					//int empid=rs.getInt("EmpID");
					//out.println(empid);select  * from Employee Inner join Designation on Employee.Did=Designation.DId;
					String query1="Select * from Employee Inner join Designation on Employee.Did=Designation.DId where EmpID='"+rs.getInt("EmpID")+"'";
					ResultSet rs1=s1.executeQuery(query1);
					while(rs1.next())
					{
						out.print("<tr><td>"+rs1.getInt("EmpID")+"</td>");
						out.print("<td>"+rs1.getString("FirstName")+"</td>");
						out.print("<td>"+rs1.getString("LastName")+"</td>");
						out.print("<td>"+rs1.getInt("Age")+"</td>");
						out.print("<td>"+rs1.getString("EmailID")+"</td>");
						out.print("<td>"+rs1.getString("Address")+"</td>");
						out.print("<td>"+rs1.getLong("Mobileno")+"</td>");
						out.print("<td>"+rs1.getString("Gender")+"</td>");
						out.print("<td>"+rs1.getString("Designation")+"</td></tr>");
					}
				}
				out.println("</table></body></html>");
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
	}

}
