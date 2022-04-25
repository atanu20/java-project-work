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

import com.atanu.dao.UserDao;
import com.atanu.entities.Message;
import com.atanu.entities.User;
import com.atanu.helper.ConnectionProvider;
import com.atanu.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
PrintWriter out = response.getWriter();
		
		String name = request.getParameter("username");
//         String email = request.getParameter("useremail");
         Part part = request.getPart("profileimage");
//         System.out.println(part.getSize());
//         if (part.getSize()> 4000000) {
//         ('File should be less then 4 MB')
	//};
//         System.out.println(part.getContentType());
////        
//        System.out.println(part.getSubmittedFileName());
        UserDao dao=new UserDao(ConnectionProvider.getConnection());
         
         if(part.getSize()!=0)
         {
        	 int min=1000;
             int max=9999;
             
             String imagename=part.getSubmittedFileName();
             imagename=(int)Math.floor(Math.random()*(max-min+1)+min)+"_"+imagename;
             
             HttpSession session=request.getSession();
             User user = (User) session.getAttribute("currentuser");
    		
             String oldFile = user.getProfileImage();
             
             user.setName(name);
             
             user.setProfileImage(imagename);
             
            
//             UserDao dao=new UserDao(ConnectionProvider.getConnection());
             
             if(dao.updateUser(user))
             {
            	 
            	 
            	 String path = request.getRealPath("/") + "assets/profile" + File.separator + user.getProfileImage();

                 //start of photo work
                 //delete code
                 String pathOldFile = request.getRealPath("/") + "assets/profile" + File.separator + oldFile;
            	 
                 
                 if(!oldFile.equals("no_upload.png"))
            	 {
            		 Helper.deleteFile(pathOldFile);
            	 }
                 
                 
                 if (Helper.saveFile(part.getInputStream(), path)) {
                     out.println("Profile updated...");
                     Message msg = new Message("Profile details updated...", "success", "alert-success");
                     session.setAttribute("msg", msg);

                 } else {
                     //////////////
                     Message msg = new Message("Something went wrong..", "error", "alert-danger");
                     session.setAttribute("msg", msg);
                 }
                 
            	     	 
            	 
             }else {
            	 out.print("Something wrong");
            	 Message msg = new Message("Something went wrong..", "error", "alert-danger");
                 session.setAttribute("msg", msg);
             }
        	 
         }
         else {
        	 
        	 HttpSession session=request.getSession();
             User user = (User) session.getAttribute("currentuser");
             user.setName(name);
             
             if(dao.updateUser(user))
             {
            	 out.println("Profile updated...");
                 Message msg = new Message("Profile details updated...", "success", "alert-success");
                 session.setAttribute("msg", msg);
             }
             
            	 else {
                     //////////////
                     Message msg = new Message("Something went wrong..", "error", "alert-danger");
                     session.setAttribute("msg", msg);
                 }
             
//        	 System.out.println("nooo image");
        	 
         }
         
        
         
         
		
	}

}
