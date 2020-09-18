<%@page import="com.blogger.entities.Message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 89%, 50% 97%, 25% 89%, 0 100%, 0% 35%, 0 0);
	}
	
</style>
</head>
<body>
	
	<!-- navbar -->
	<%@include file="navbar.jsp" %>


	<main class="d-flex align-items-center bg-light banner-background bg-dark" style="height:70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center">
							Login Here
						</div>
						<div class="card-body">
						<% 
							Message msg=(Message)session.getAttribute("msg");
						 	if(msg!=null)
						 	{%>
						 		<div class="alert text-center <%=msg.getCssClass()%>" role="alert">
							    	<%=msg.getContent() %>
								</div>
						 	<% }
						 		session.removeAttribute("msg");		
						%>
							
							<form action="${pageContext.request.contextPath}/LoginServlet" method="GET">
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								    <small id="emailHelp" class="form-text text-muted">You are just step away from our planet..</small>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  <div class="text-center">
								  	<button type="submit" class="btn btn-primary">Submit</button>
								  </div>
							</form>
						</div>
					</div>
				
				</div>
			
			</div>
		
		
		</div>
	
	
	</main>




<!-- Jquery & Javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>