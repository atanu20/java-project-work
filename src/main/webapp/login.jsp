<!DOCTYPE html>
<%@page import="com.atanu.entities.Message"%>
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
        <div class="col-md-6 col-12 mb-3 mx-auto">
          <div class="card">
           <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 
                            <%        
                                    session.removeAttribute("msg");
                                }
                            %>
          
                           
            <form action="Login" method="post" id="log_form">
              <div class="form-group">
                <label for="usr">Email:</label>
                <input
                  type="email"
                  class="form-control"
                  id="usr"
                  name="useremail"
                  required
                />
              </div>
              <div class="form-group">
                <label for="pwd">Password:</label>
                <input
                  type="password"
                  class="form-control"
                  id="pwd"
                  name="password"
                  required
                />
              </div>
              <button type="submit" class="btn btn-primary">Login Now</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>
