
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	<script type="text/javascript">
		function w3_open() {
		  document.getElementById("mySidebar").style.display = "block";
		}

		function w3_close() {
		  document.getElementById("mySidebar").style.display = "none";
		}
	</script>



		<!-- Sidebar -->
		<div class="w3-sidebar w3-bar-block w3-gray w3-animate-left" style="display:none;z-index:4;" id="mySidebar">
		  <button class="w3-bar-item w3-button" onclick="w3_close()" style="background:#f44"> <spring:message code="side.close" /> </button>
		  <a href="/home" class="w3-bar-item w3-button"> <spring:message code="side.home" /> </a>
		  <security:authorize access = "hasRole('ROLE_ADMIN') or hasRole('ROLE_DEBUG')">
		  <a href="/createEnt" class="w3-bar-item w3-button"> <spring:message code="side.create" /> </a>
		  </security:authorize>
		  <security:authorize access = "hasRole('ROLE_USER') or hasRole('ROLE_DEBUG')">
		  <a href="/bucket" class="w3-bar-item w3-button"> <spring:message code="side.bucket" /> </a>
		  </security:authorize>
		  <br>
		  <jsp:include page="langmenu.jsp"></jsp:include>
		</div>
		<button class="w3-button w3-xxlarge" onclick="w3_open()">&#9776;</button>
	
