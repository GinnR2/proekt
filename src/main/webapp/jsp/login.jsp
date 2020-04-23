<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Log in with your account</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script type="text/javascript">
		function w3_open() {
		  document.getElementById("mySidebar").style.display = "block";
		}

		function w3_close() {
		  document.getElementById("mySidebar").style.display = "none";
		}
	</script>
</head>

<body>
		<!-- Sidebar -->
		<div class="w3-sidebar w3-bar-block w3-gray w3-animate-left" style="display:none;z-index:4;" id="mySidebar">
		  <button class="w3-bar-item w3-button" onclick="w3_close()" style="background:#f44">Close</button>
		  <a href="/home" class="w3-bar-item w3-button">Home</a>
		  <a href="/createEnt" class="w3-bar-item w3-button">Create Periodical</a>
		  <a href="/bucket" class="w3-bar-item w3-button">Bucket</a>
		</div>
		<button class="w3-button w3-xxlarge" onclick="w3_open()">&#9776;</button>
	<div class="container">
		<form method="POST" action="${contextPath}/login" class="form-signin">
			<h2 style="color: white;" class="form-heading">Log in</h2><br>
			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span>${message}</span><br>
					<input name="email" type="text" class="form-control" placeholder="Email" /><br>
					<input name="password" type="password" class="form-control" placeholder="Password" /> <br>
					<span>${error}</span> <br>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button><br>
				<h4 class="text-center">
					<a style="color: white;" href="${contextPath}/registration">Create an account</a>
				</h4>
			</div>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>