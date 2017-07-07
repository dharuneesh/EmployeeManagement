package emp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class LoginCheck extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		int Emp_ID = Integer.parseInt(request.getParameter("id")),flag=0;
		String Password = request.getParameter("pwd");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeeDB","root","secret");
			Statement s=con.createStatement();
			String query="select * from Employee where EmpID='"+Emp_ID+"'";
			ResultSet rs=s.executeQuery(query);

			while(rs.next())
			{
				flag=1;
				if(Password.equals(rs.getString("Password")))
				{
					flag=2;
					if(rs.getString("Did").equals("5"))
					{
						String fname=rs.getString("FirstName");
						String lname=rs.getString("LastName");
						String name=fname+" "+lname;
						HttpSession session=request.getSession();  
						session.setAttribute("AdminName",name);
						session.setAttribute("AdminID",Emp_ID);
						RequestDispatcher rd=request.getRequestDispatcher("AdminOptions.jsp");  
						rd.forward(request, response); 
					}
					else
					{
						String fname=rs.getString("FirstName");
						String lname=rs.getString("LastName");
						String name=fname+" "+lname;
						HttpSession session=request.getSession();  
						session.setAttribute("Emp_Name",name);
						session.setAttribute("Emp_ID",Emp_ID);
						RequestDispatcher rd=request.getRequestDispatcher("Employeeoptions.jsp");  
						rd.forward(request, response); 
					}
					break;
				}
			}

			if(flag==0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
				rd.include(request, response); 
				out.println("<br><br><h3><center><font color=red>!!YOU ARE NOT REGISTERED.. CONTACT YOUR ADMIN!!</font></center></h3>");
			}
			else if(flag==1)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
				rd.include(request, response);
				out.println("<br><br><h3><center><font color=red>!!INVALID PASSWORD...TRY AGAIN!!</font></center></h3>");

			}


		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		catch(Exception e)
		{
			out.println(e);
			e.printStackTrace();
		}

	}

}
