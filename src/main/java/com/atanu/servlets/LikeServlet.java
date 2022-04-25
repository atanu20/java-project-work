package com.atanu.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atanu.dao.LikeDao;
import com.atanu.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
        int likeuid = Integer.parseInt(request.getParameter("likeuid"));
        int likepid = Integer.parseInt(request.getParameter("likepid"));
		//System.out.println(likepid+"_"+likeuid+"_"+operation);
        
        LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
        if (operation.equals("like")) {
            boolean f=ldao.insertLike(likepid, likeuid);
            out.println(f);
        }
        
		
	}

}
