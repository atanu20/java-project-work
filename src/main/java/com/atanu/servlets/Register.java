package com.atanu.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atanu.dao.UserDao;
import com.atanu.entities.User;
import com.atanu.helper.ConnectionProvider;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("username");
         String email = request.getParameter("useremail");
         String password = request.getParameter("password");
         
         User user = new User(name, email, password);
         UserDao dao=new UserDao(ConnectionProvider.getConnection());
         
         if(dao.saveUser(user))
         {
        	 out.print("done");
        	 
         }else {
        	 out.print("Something wrong or Email already present");
         }
        
	}

	

}
