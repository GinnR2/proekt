<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Create an account</title>
    <%-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet"> --%>
    <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
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
            
                <form:form method="POST" modelAttribute="userForm" class="box">
                    <h1>Register</h1>
                    <p class="text-muted"> Please fill all fields!</p> 
                    
                    <spring:bind path="name">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="text" path="name" placeholder="First name" required="true"></form:input>
			                <form:errors style="color:#f00" path="name"></form:errors>
			            </div>
			        </spring:bind>
			        <spring:bind path="surname">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="text" path="surname" placeholder="Last name" required="true" ></form:input>
			                <form:errors style="color:#f00" path="surname"></form:errors>
			            </div>
			        </spring:bind>
			        <spring:bind path="email">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="text" path="email" placeholder="Email" required="true"></form:input>
			                <form:errors style="color:#f00" path="email"></form:errors>
			            </div>
			        </spring:bind>
			        <spring:bind path="password">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="password" path="password" placeholder="Password" class="pass" required="true"></form:input>
			                <form:errors style="color:#f00" path="password"></form:errors>
			            </div>
			        </spring:bind>
			        <spring:bind path="confirm">
			            <div class="form-group ${status.error ? 'has-error' : ''}">
			                <form:input type="password" path="confirm" placeholder="Confirm your password" class="cpass" required="true"></form:input>
			                <form:errors style="color:#f00" path="confirm"></form:errors>
			            </div>
			        </spring:bind>
                    
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="submit" name="" value="Register">
                    <a class="forgot text-muted" href="${contextPath}/login">Login</a>
                </form:form>
            
        </div>
    </div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>