<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.stream.Stream" %>
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
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
</head>

<body>
		<jsp:include page="sidebar.jsp"></jsp:include>
<div class="container">
    	<c:if test="${pageContext.request.userPrincipal.name != null}">
	        <form id="logoutForm" method="POST" action="${contextPath}/logout">
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        </form>
	        <h2 style="color: white;"> <spring:message code="home.welcome" /> <c:out value="${pageContext.request.userPrincipal.name}"/> |
	         <a onclick="document.forms['logoutForm'].submit()"> <spring:message code="home.logout" /> </a></h2>
	    </c:if>
	    <c:if test="${pageContext.request.userPrincipal.name == null}">
	        <h2 style="color: white;"><spring:message code="home.hello" />: <a href="/login"> <spring:message code="home.login" /> </a></h2>
	    </c:if>
    <div class="listbase">
    	<c:if test="${periodicals.size() == 0}">
    			<h4 style="color: white;" class="text-center">Empty list
					<a href="${contextPath}/home">Add something</a>
				</h4>
    	</c:if>
    	<table class="table table-striped">
	    	<thead>
				<tr>
					<th><spring:message code="bucket.image" /></th>
					<th><spring:message code="bucket.id" /></th>
					<th><spring:message code="bucket.name" /></th>
					<th><spring:message code="bucket.desc" /></th>
					<th><spring:message code="bucket.price" /></th>
					<th><spring:message code="bucket.date" /></th>
					<th><spring:message code="bucket.action" /></th>
				</tr>
			</thead>
			<tbody>
						<c:forEach var="item" items="${bucket}">
							<tr style="vertical-align:middle">
								<td style="width: 10%"><img src="${item.periodical.image == null ? '/img/NO_IMG_600x600.png' : item.periodical.image.getFileDownloadUri()}" alt="image" style="width: 100%"></td>
								<td style="vertical-align:middle">${item.id}</td>
								<td style="vertical-align:middle"><c:out value="${item.periodical.name}"/></td>
								<td style="vertical-align:middle">
								<c:out value="${item.periodical.description.length()>50?item.periodical.description.substring(1,50):item.periodical.description}"/></td>
								<td style="vertical-align:middle">${item.periodical.price}$</td>
								<td style="vertical-align:middle">${item.purchaseDate}</td>
								<td style="vertical-align:middle"><a href="bucketRemove?id= ${item.id}">delete</a></td>
								
							</tr>
						</c:forEach>
      		</tbody>
      </table>
     	
      <h3 style="color: white;"><spring:message code="bucket.total" /> ${bucket.size()} <spring:message code="bucket.items" /> - ${bucket.stream().map(x->x.periodical.price).sum()} $</h3>
      
     </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>