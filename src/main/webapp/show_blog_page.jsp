
<%@page import="com.atanu.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.atanu.dao.UserDao"%>
<%@page import="com.atanu.entities.User"%>
<%@page import="com.atanu.entities.Postbox"%>
<%@page import="com.atanu.helper.ConnectionProvider"%>
<%@page import="com.atanu.dao.PostDao"%>
<%   
User user = (User) session.getAttribute("currentuser");

if (user == null) {
	
	request.getRequestDispatcher("login.jsp").forward(request, response);
	
}

int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao  d = new PostDao(ConnectionProvider.getConnection());
    Postbox p = d.getPostByPostId(postId);
    
    if(p==null)
    {
    	request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="Description" content="Enter your description here" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="assets/style.css" />
    <title>Title</title>
  </head>
  <body>
    <%@ include file="include/header.jsp" %>

    <br /><br /><br />

    <div class="container">
      <div class="row">
        <div class="col-md-8 col-12 mb-3 mx-auto">
          <div class="card">
          <img alt="" src="blogpost/<%= p.getPimage()%>" width="100%">
          
          
          <h1><%= p.getPtitle() %></h1>
          
          <div class="row m-3 ">
                                <div class="col-md-8">
                                    <% UserDao  ud = new UserDao(ConnectionProvider.getConnection()); %>
							 <img src='assets/profile/<%= ud.getUserByUserId(p.getUserId()).getProfileImage() %>' class="ppimg" />
                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : <%=  DateFormat.getDateTimeInstance().format(p.getPdate()) %>  </p>
                                </div>

                              
                            </div>
          
          <p><%= p.getPdesc() %></p>
          
          <div class="bg-dark text-white p-3">
          <%= p.getPcode() %>
          </div>
          <br>
          
          <div class="row ml-5">
          <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
          
          <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>,this)" class="btn btn-outline-dark btn-sm mr-3"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span> </a>
                
                <a href="#!" class="btn btn-outline-dark btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a></div>
          
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="assets/index.js" type="text/javascript"></script>
    <script type="text/javascript">
    
    
    </script>
    
  </body>
</html>
