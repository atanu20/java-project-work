package com.atanu.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atanu.dao.UserDao;
import com.atanu.entities.Message;
import com.atanu.entities.User;
import com.atanu.helper.ConnectionProvider;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
			try {
			
			
			
				 String email = request.getParameter("useremail");
		         String password = request.getParameter("password");
				
		         UserDao dao=new UserDao(ConnectionProvider.getConnection());
		         User u;

			
			u = dao.getuserbyEmail(email, password);
			
			
			if(u==null)
	         {
				Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
				 response.sendRedirect("login.jsp");
	        	 
	         }else {
	        	 HttpSession s = request.getSession();
				 s.setAttribute("currentuser", u);
				 
				 response.sendRedirect("profile.jsp");
	         }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
         
	}

}
