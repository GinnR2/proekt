<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Not permitted</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/css/index.css">
</head>

<body>
		<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="container">
		<div>
			<h3 style="color: white;">You have no permission to access page!</h3>
		</div>
		<form action="/logout" method="post">
			<input type="submit" value="Sign in as different user" /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>