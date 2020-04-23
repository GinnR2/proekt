<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2 style="color: white;">Welcome <c:out value="${pageContext.request.userPrincipal.name}"/> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
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
					<th>Image</th>
					<th>Id</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Purchase Date</th>
					<th>Action</th>
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
     	
      <h3 style="color: white;">Total ${bucket.size()} items - ${bucket.stream().map(x->x.periodical.price).sum()} $</h3>
      
     </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>