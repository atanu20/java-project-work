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
        <div class="col-md-6 col-12 mb-3 mx-auto">
          <div class="card">
            <form id="reg-form" action="Register" method="post" >
              <div class="form-group">
                <label for="name">Name:</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="username"
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
              
              
             <div id="spin" style="display: none;">
             <span class="fa fa-refresh fa-spin fa-4x"></span>
             <br>
             <b>Wait ...</b>
             </div>
              
              <button type="submit" id="sumbimt-btn" class="btn btn-primary">
                Register Now
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function()
    		{
    	console.log("hii");
    	
    			$('#reg-form').on('submit',function(e){
    				e.preventDefault();
    				let form = new FormData(this);
    				$("#sumbimt-btn").hide();
                    $("#spin").show();
    				
    			$.ajax({
    				
    				url:"Register",
    				type:'POST',
    				data:form,
    				success:function(data)
    				{
    					
    					
    					$("#sumbimt-btn").hide();
                        $("#spin").show();
                        
                        if (data.trim() === 'done')
                        {
                            swal("Registered successfully..We are going to redirect to login page")
                                    .then((value) => {
                                        window.location = "login.jsp"
                                    });
                        } else
                        {
                            swal(data).then((value) => {
                                window.location.reload();
                            });
                        }
                        
    					
    				},
    				error:function(e)
    				{
    					$("#sumbimt-btn").hide();
                        $("#spin").show();
                        swal(e).then((value) => {
                            window.location.reload();
                        });
    				},
    				processData: false,
                    contentType: false
    			})
    			
    				
    				
    			})
    	
    		})
    </script>
    
  </body>
</html>
