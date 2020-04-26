<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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
	<link href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/login.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
</head>

<body>
		<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="container">
    <div class="row">
        <div class="col-md-6">
            
                <form method="POST" action="${contextPath}/login" class="box">
                    <h1>Login</h1>
                    <p class="text-muted"> Please enter your login and password!</p> 
                    <div class="form-group ${status.error ? 'has-error' : ''}">
	                    <input type="text" name="email" placeholder="Username" required> 
	                    <input type="password" name="password" placeholder="Password" required>  
	                    	<span style="color:#f00">${message}</span>
	                    	<span style="color:#f00">${error}</span>     
	                    <br>
	                    <a class="forgot text-muted" href="#">Forgot password?</a> 
	                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <input type="submit" name="" value="Login">
                    </div>
                    <a class="forgot text-muted" href="${contextPath}/registration">Create an account</a>
                </form>
            
        </div>
    </div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>