<%@page import="com.blogger.dao.PostDao" %>
<%@page import="com.blogger.helper.ConnectionProvider" %>
 <%@page import="com.blogger.entities.Post" %>
 <%@page import="java.util.List" %>


<div class="row">


<%
Thread.sleep(100);
PostDao pDao = new PostDao(ConnectionProvider.getConnection());
int catId  = Integer.parseInt(request.getParameter("catId"));
List<Post>posts = null;
if(catId==0 )
	posts= pDao.getAllPosts();
else
	posts= pDao.getPostByCatId(catId);

if(posts.size()==0)
	out.print("<h5>No posts in this category</h5>");

for(Post p : posts){
%>

<div class="col-md-6 mt-2">
	<div class="card">
		<img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
		<div class="card-body">
				<b><%=p.getpTitle() %></b>
				<p><%=p.getpContent() %></p>
				<pre><%=p.getpCode() %></pre>
				
		
		</div>
		
		<div class="card-footer bg-dark text-white text-center">
<%--                 <% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %> --%>

<%--                 <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
 --%>
                <a href="show_blog_page.jsp?post_id=<%=p.getpId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
            </div>
	</div>


</div>
<%}%>

</div>