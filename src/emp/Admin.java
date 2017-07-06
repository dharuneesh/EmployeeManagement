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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Admin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		PrintWriter out=response.getWriter();
		//out.println("Inside");
		String file=request.getParameter("file");
		
		if(file.equals("Add"))
		{
			 
			String Employeeid=request.getParameter("eid");
			String EmployeePass=request.getParameter("epwd");
			int EmployeeId=Integer.parseInt(Employeeid.trim());
			int EmployeePassword=Integer.parseInt(EmployeePass.trim());
			String EmployeeMail		=request.getParameter("email");
			String EmployeeFName     =request.getParameter("efirstname");
			String EmployeeLName     =request.getParameter("elastname");
			String EmployeeAge      =request.getParameter("empage");
			String EmployeeAddress  =request.getParameter("empaddress");
			String EmployeeMobile   =request.getParameter("empmob");
			String EmployeeGender   =request.getParameter("empgender");
			String EmployeeDesgination =request.getParameter("empdesg");
			String ReportingName    =request.getParameter("empreport");
			int ReportingId=0;
			try
			{
				RequestDispatcher rd=request.getRequestDispatcher("AdminOptions.jsp");  
				rd.include(request, response); 
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s=con.createStatement();
				Statement s1=con.createStatement();
				Statement s2=con.createStatement();
				String query1="Select EmpID from Employee where EmailID='"+ReportingName+"'";
				ResultSet rs=s2.executeQuery(query1);
				while(rs.next())
					{
						ReportingId=rs.getInt("EmpID");
					}
				
				String query="insert into Employee values('"+EmployeeId+"','"+EmployeePassword+"','"+EmployeeFName+"','"+EmployeeLName+"','"+EmployeeAge+"','"+EmployeeMail+"','"+EmployeeAddress+"','"+EmployeeMobile+"','"+EmployeeGender+"','"+EmployeeDesgination+"')";
				s.executeUpdate(query);
				String query2="insert into ReportingDetails values('"+EmployeeId+"','"+ReportingId+"')";
				s1.executeUpdate(query2);
				out.println("<h3><center><font color=green> DATA ADDED TO THE RECORD</font></center></h3>");
				
			}

			catch(SQLException se) {
				se.printStackTrace();
			}
			catch(Exception e)
			{
				out.println(e);
			}
		}
		else if(file.equals("Delete"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("AdminOptions.jsp");  
			rd.include(request, response); 
			int flag=0;
			int EmployeeId=Integer.parseInt(request.getParameter("empid"));
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s=con.createStatement();
				Statement s1=con.createStatement();
				String query="select EmpID from Employee where EmpID= '"+EmployeeId+"'";
				ResultSet rs=s.executeQuery(query);
				while(rs.next())
				{
					if(EmployeeId==(rs.getInt("EmpID")))
					{
						flag=1;
						String query1="Delete from Employee where EmpID='"+EmployeeId+"'";
						String query2="Delete from ReportingDetails where EmpID='"+EmployeeId+"'";
						s1.executeUpdate(query1);
						s1.executeUpdate(query2);
						out.println("<h3><font color=red><center>"+EmployeeId+"</font><font color=green> USER DATA DELETED FROM THE RECORD");
					}
				}
				if(flag==0)
				{
					out.println("<h3><center><font color=red>"+EmployeeId+"</font><font color=green> USER DATA NOT AVAILABLE!!!");

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
		else if(file.equals("Search"))
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
		else if(file.equals("report"))
		{
			String ReportingName    =request.getParameter("ereporting");
			int ReportingId=0;
			try
			{

				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
				Statement s1=con.createStatement();
				String query1="Select EmpID from Employee where EmailID='"+ReportingName+"'";
				ResultSet rs=s1.executeQuery(query1);
				while(rs.next())
					{
						ReportingId=rs.getInt("EmpID");
					}
				if(ReportingId==0)
				{		
					
					out.println("1");
					
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

		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("ViewPagination.jsp");  
			rd.include(request, response); 
			
//			try
//			{
//				RequestDispatcher rd=request.getRequestDispatcher("AdminOptions.jsp");  
//				rd.include(request, response); 
//				out.println("<html><head><title></title></head><body><h3><font color=Brown>EMPLOYEE DETAILS:</h3><table border=1 cellpadding=5 cellspacing=5><tr><th>EmpID</th><th>FirstName</th><th>LastName</th><th>Age</th><th>Email ID</th><th>Address</th><th>Mobileno</th><th>Gender</th>");
//				out.println("<th>Designation</th></font</tr>");
//				Class.forName("com.mysql.jdbc.Driver");
//				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
//				Statement s=con.createStatement();
//				String query="select * from Employee limit 0,5";
//				ResultSet rs=s.executeQuery(query);
//				while(rs.next())
//				{
//					out.print("<tr><td>"+rs.getInt("EmpID")+"</td>");
//					out.print("<td>"+rs.getString("FirstName")+"</td>");
//					out.print("<td>"+rs.getString("LastName")+"</td>");
//					out.print("<td>"+rs.getInt("Age")+"</td>");
//					out.print("<td>"+rs.getString("EmailID")+"</td>");
//					out.print("<td>"+rs.getString("Address")+"</td>");
//					out.print("<td>"+rs.getLong("Mobileno")+"</td>");
//					out.print("<td>"+rs.getString("Gender")+"</td>");
//					out.print("<td>"+rs.getString("Designation")+"</td></tr>");
//				}
//				out.println("</table></body></html>");
//			}
//			catch(SQLException se) {
//				se.printStackTrace();
//			}
//			catch(Exception e)
//			{
//				out.println(e);
//			}
//
		}
	}
}
