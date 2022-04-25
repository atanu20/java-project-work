
<%@page import="com.atanu.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.atanu.helper.ConnectionProvider"%>
<%@page import="com.atanu.dao.PostDao"%>
<%@page import="com.atanu.entities.User"%>
<%@page import="com.atanu.entities.Message"%>

<%
User user = (User) session.getAttribute("currentuser");



if (user == null) {
	
	request.getRequestDispatcher("login.jsp").forward(request, response);
	
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

    <div class="jumbotron">
      <h1>My blog</h1>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum autem
        qui eos! Architecto, at nihil!
      </p>
      
      <a href="LogoutServlet" class="btn btn-info">Logout</a>
      
      <!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
My Profile
</button>

 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
 Add Post +
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header bg-primary ">
        <h4 class="modal-title text-white ">BlogBox</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <div id="profile-details">
      
      
      <img src='assets/profile/<%= user.getProfileImage() %>' class="pimg" />
      <h3><%= user.getId() %> </h3>
        <h3><%= user.getName() %> </h3>
          <h3><%= user.getEmail() %> </h3>
      </div>
      
      
      <div id="profile-edit" style="display: none;">
      
      
      <img src='assets/profile/<%= user.getProfileImage() %>' class="pimg" />
      <h3><%= user.getId() %> </h3>
        <form id="reg-form" action="EditServlet" method="post" enctype="multipart/form-data">
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
              <div class="form-group">
                <label for="name">Name:</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="username"
                  value="<%= user.getName()  %>"
                  required
                />
              </div>
              <div class="form-group">
                <label for="usr">Email:</label>
                <input
                  type="email"
                  class="form-control"
                  id="usr"
                  name="useremail"
                  value="<%= user.getEmail()  %>"
                  required
                  readonly
                />
              </div>
              <div class="form-group">
                <label for="us">Profile image:</label>
                <input
                  type="file"
                  class="form-control"
                  id="us"
                  name="profileimage"
                  
                  
                />
              </div>
              <div class="text-center">
              <button class="btn btn-success">SAVE</button>
              
              </div>
              
              </form>
      </div>
      
      
      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button  class="btn btn-primary" id="edit-profile-button" >Edit</button>
      </div>

    </div>
  </div>
</div>
    </div>
    
    
    
    <div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Upload New Post</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="AddPostServlet" method="post" enctype="multipart/form-data" id="uploadpost">
          
          <div class="form-group">
  <label for="sel1">Post Category:</label>
  <select class="form-control" id="sel1" name="catid">
     <option selected hidden value="">---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%=c.getCtitle()  %></option>

                                    <%
                                        }
                                    %>                                    
    
   
  </select>
</div>


          
          <div class="form-group">
  <label for="">Post Title:</label>
  <input type="text" class="form-control" name="ptitle" id="">
</div>

<div class="form-group">
  <label for="comment">Post Content:</label>
  <textarea class="form-control" rows="7" name="pdesc" id="comment"></textarea>
</div>

<div class="form-group">
  <label for="comment">Content code (If Any):</label>
  <textarea class="form-control" rows="7" name="pcode" id="comment"></textarea>
</div>

<div class="form-group">
  <label for="">Post Image:</label>
  <input type="file" class="form-control" name="pimage" id="">
</div>

<div class="text-center">
  <button class="btn btn-success">Upload Post</button>
</div>
          </form>
        </div>
        
       
        
      </div>
    </div>
  </div>
    

    <div class="container">
      <div class="row">
      
      <div class="col-lg-4 col-md-5 col-12" >
      
      <ul class="list-group">
  <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item active">All Category</li>
  
 <%
                                       
                                        for (Category c : list) {
                                    %>
                                  
                                   
                                   <a href="#"  onclick="getPosts(<%= c.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= c.getCtitle() %></a>

                                    <%
                                        }
                                    %>          
</ul>
      
      </div>
      
      <div class="col-lg-8 col-md-7 col-12" >
      
     		<div class=" text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container" >
                        <div class="row" id="post-container">
                        
                        
                        </div>

                        </div>
      
      </div>
          
      
              
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
     <script src="assets/index.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function ()
                                    {
                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>
        
        
        <script type="text/javascript">
        
        
        $(document).ready(function (e) {
            //
            $("#uploadpost").on("submit", function (event) {
                //this code gets called when form is submitted....
                event.preventDefault();
               // console.log("you have clicked on submit..")
                let form = new FormData(this);
                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success ..
                       // console.log(data);
                        if (data.trim() == 'done')
                        { 
                            swal("Good job!", "saved successfully", "success")
                            .then((value) => {
                            	 let allPostRef = $('.c-link')[0]
                                 getPosts(0, allPostRef)
                            });
                        } else
                        {
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error..
                        swal("Error!!", "Something went wrong try again...", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        })
        
        
        </script>
        
        
        <script type="text/javascript">
        
        
         function getPosts(catId, temp) {
            $("#loader").show();
            $("#post-container").hide()
            $(".c-link").removeClass('active')
            $.ajax({
                url: "load_posts.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR) {
                   // console.log(data);
                    $("#loader").hide();
                    $("#post-container").show();
                    $('#post-container').html(data)
                    $(temp).addClass('active')
                }
            })
        } 
        
        
        $(document).ready(function (e) {
            let allPostRef = $('.c-link')[0]
            getPosts(0, allPostRef)
        })
        
        </script>
    
    
  </body>
</html>
