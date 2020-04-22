<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		  <a href="#" class="w3-bar-item w3-button">Bucket</a>
		</div>
		<button class="w3-button w3-xxlarge" onclick="w3_open()">&#9776;</button>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Welcome <c:out value="${pageContext.request.userPrincipal.name}"/> | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>
    <div class="listbase">
    	<c:if test="${periodicals.size() == 0}">
    			<h4 class="text-center">Empty list
					<a href="${contextPath}/createEnt">Add something</a>
				</h4>
    	</c:if>
    <c:forEach items="${periodicals}" var="item">
        <div class="card">
		  <img src="${item.image == null ? '/img/NO_IMG_600x600.png' : item.image.getFileDownloadUri()}" alt="none" style="width:100%">
		  <h1><c:out value="${item.name}"/></h1>
		  <p class="price">$${item.price}</p>
		  <p style="overflow: hidden; white-space: pre-line"><c:out value="${item.description}"/></p>
		  <p><button>Add to Cart</button></p>
		</div>
      </c:forEach>
     </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>