<!DOCTYPE html>
<%@page import="com.atanu.dao.PostDao"%>
<%@page import="com.atanu.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.atanu.entities.Category"%>
<%@page import="java.sql.*"%>
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

    <div class="jumbotron">
      <h1>My blog</h1>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum autem
        qui eos! Architecto, at nihil!
      </p>
      
      <% Connection con=ConnectionProvider.getConnection(); %>
     
    </div>

    <div class="container">
      <div class="row">
      
      <%
                                        PostDao postd= new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <div class="col-lg-4 col-md-6 col-12 mb-3">
          <div class="card">
            
           <a href="profile.jsp "> <h2><%= c.getCtitle() %></h2></a>
           
          </div>
        </div>

                                    <%
                                        }
                                    %>      
      
        
        
        
       
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
