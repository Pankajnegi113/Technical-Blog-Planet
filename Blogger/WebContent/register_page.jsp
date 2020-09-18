<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Register Page</title>
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


	<main class="d-flex align-items-center bg-light banner-background bg-dark" style="height:90vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3 mb-50">
					<div class="card">
						<div class="card-header text-center">
							Register Here
						</div>
						<div class="card-body">
						<!-- Context path computes the full path of your resource, so here ${pageContext.request.contextPath} will be http://localhost:8080/Blogger or whatever your domain & port number is.here it gives "/Blogger" -->

							<form id="reg-form" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
								<div class="form-group">
								    <label for="exampleInputEmail1">Your Name</label>
								    <input name="name" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter name">
								   
								  </div>
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1">Confirm Password</label>
								    <input name="confirm_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="male" checked>
								  <label class="form-check-label" for="exampleRadios1">
								    Male
								  </label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="female">
								  <label class="form-check-label" for="exampleRadios2">
								    Female
								  </label>
								</div>
								
								<div class="text-center" id="loader" style="display: none; color: #007bff">
									<span class="fa fa-circle-o-notch fa-spin"></span>
									<h4>Please Wait</h4>
								</div>
								
								<div class="text-center">
								  <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
	$(document).ready(function(){
		debugger;
		$('#reg-form').on('submit',function(e){
			e.preventDefault();
			$('submit-btn').hide();
			$('#loader').show();
			debugger;
 			let form = new FormData(this);			
			$.ajax({
				url: "RegisterServlet",
				type:"POST",
				data:form,
				success:function(data){
					debugger;
					$('submit-btn').show();
					$('#loader').hide();
 					swal("Registered Successfully! Redirecting to Login Page")
					.then((value) =>{
					  window.location= "login_page.jsp"
					}); 
				},
				error:function(err){
					console.log("Error while registering user",err);
					return;
				},
				processData:false,
				contentType:false
				
			})
		})
	})


</script>

</body>
</html>