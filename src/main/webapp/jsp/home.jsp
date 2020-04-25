<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <title>Welcome</title>
    <link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/list.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
</head>

<body>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="container">
	    <c:if test="${pageContext.request.userPrincipal.name != null}">
	        <form id="logoutForm" method="POST" action="${contextPath}/logout">
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        </form>
	        <h2 style="color: white;">Welcome <c:out value="${pageContext.request.userPrincipal.name}"/> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
	    </c:if>
	    <c:if test="${pageContext.request.userPrincipal.name == null}">
	        <h2 style="color: white;">Hello guest: <a href="/registration">Register</a> or <a href="/login">Login</a></h2>
	    </c:if>
	    
	    <div class="listbase">
	    	<c:if test="${periodicals.size() == 0}">
	    			<h4 style="color: white;" class="text-center">Empty list
						<a href="${contextPath}/createEnt">Add something</a>
					</h4>
	    	</c:if>
	    <c:forEach items="${periodicals}" var="item">
	        <div class="card">
			  <img src="${item.image == null ? '/img/NO_IMG_600x600.png' : item.image.getFileDownloadUri()}" alt="none" style="width:100%">
			  <h1><c:out value="${item.name}"/></h1>
			  <p class="price">$${item.price}</p>
			  <p style="overflow: hidden; white-space: pre-line"><c:out value="${item.description}"/></p>
			  <security:authorize access = "hasRole('ROLE_USER') or hasRole('ROLE_DEBUG')">
				  <form:form action="${contextPath}/bucketAdd" method="POST" enctype="multipart/form-data">
						<input type="hidden" value="${item.id}" class="form-control" name="id"> 
						<input type="submit" class="w3-button w3-block w3-dark-grey" value="+ add to bucket">
				  </form:form>
			  </security:authorize>
			</div>
	      </c:forEach>
	     </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>