package com.obssolution.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.obssolution.model.Student;
import com.obssolution.model.Department;

/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String username = "Admin";
	private static final String password = "Admin";

    /**
     * Default constructor. 
     */
    public Account() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try
		{
			// Hardcode the username and password to "Admin"
			if(!username.equals(Account.username) || !password.equals(Account.password))
			{
				throw new Exception("Invalid account information");
			}
			
			// Generate the dummy data
			Department[] departments = new Department[3];
			departments[0] = new Department("Dep 1", new Student[] {
				new Student("S1", "Student 1", 35),
				new Student("S2", "Student 2", 70),
				new Student("S3", "Student 3", 60),
				new Student("S4", "Student 4", 90)
			});
			
			departments[1] = new Department("Dep 2", new Student[] {
				new Student	("S5", "Student 5", 30)
			});
			
			departments[2] = new Department("Dep 3", new Student[] {
				new Student	("S6", "Student 6", 32),
				new Student	("S7", "Student 7", 70),
				new Student	("S8", "Student 8", 20)
			});
		
			
			request.getSession().setAttribute("userID", Account.username);
			request.getSession().setAttribute("departments", departments);
			response.sendRedirect("welcome.jsp");
		}
		catch(Exception e)
		{
			request.getSession().setAttribute("error", e.getMessage());
			response.sendRedirect("index.jsp");
		}
	}

}
