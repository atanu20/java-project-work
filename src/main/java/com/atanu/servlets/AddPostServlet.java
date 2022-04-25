package com.atanu.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.atanu.dao.PostDao;
import com.atanu.entities.Postbox;
import com.atanu.entities.User;
import com.atanu.helper.ConnectionProvider;
import com.atanu.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		
		int catid = Integer.parseInt(request.getParameter("catid"));
        String ptitle = request.getParameter("ptitle");
        String pdesc = request.getParameter("pdesc");
        String pcode = request.getParameter("pcode");
       // System.out.println(catid+" "+ptitle);
        Part part = request.getPart("pimage");
        
        int min=1000;
        int max=9999;
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentuser");
        String postimg= (int)Math.floor(Math.random()*(max-min+1)+min)+"_"+part.getSubmittedFileName();
		
        Postbox p = new Postbox(ptitle, pdesc, pcode, postimg, null, catid,user.getId());
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        if (dao.savePost(p)) {

            String path = request.getRealPath("/") + "blogpost" + File.separator + postimg;
            Helper.saveFile(part.getInputStream(), path);
            out.println("done");
        } else {
            out.println("error");
        }
		
	}

}
