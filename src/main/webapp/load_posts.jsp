
<%@page import="com.atanu.entities.User"%>
<%@page import="com.atanu.dao.LikeDao"%>
<%@page import="com.atanu.entities.Postbox"%>
<%@page import="java.util.List"%>
<%@page import="com.atanu.helper.ConnectionProvider"%>
<%@page import="com.atanu.dao.PostDao"%>
<%

User uuu=(User)session.getAttribute("currentuser");

Thread.sleep(1000);


PostDao d = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));
List<Postbox> posts = null;

if (cid == 0) {
    posts = d.getAllPosts();
} else {
    posts = d.getPostByCatId(cid);
}

if (posts.size() == 0) {
    out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
    return;
}

for (Postbox p : posts) 
{
%>

<div class="col-md-6  mt-2">
        <div class="card">
            <img class="card-img-top" src="blogpost/<%= p.getPimage()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getPtitle() %></b>
                <p><%= p.getPdesc()%></p>
                <br>
                <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                 <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>,this)" class="btn btn-outline-dark btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span> </a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-dark btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-dark btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>

            </div>
            

        </div>


    </div>



<%
}

%>




