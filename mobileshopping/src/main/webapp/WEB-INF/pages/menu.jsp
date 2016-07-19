<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<div id="menu_tab">
	<ul class="menu">
		<li><a
			href="${pageContext.request.contextPath}/index"
			class="nav"> Home </a></li>
		<li class="divider"></li>
		<li><a
			href="${pageContext.request.contextPath}/productList"
			class="nav">Products</a></li>
		<li class="divider"></li>
		<li><a
			href="http://all-free-download.com/free-website-templates/"
			class="nav">Specials</a></li>
		<li class="divider"></li>
		<li><a
			href="http://all-free-download.com/free-website-templates/"
			class="nav">My account</a></li>
		<li class="divider"></li>
		<li><a
			href="http://all-free-download.com/free-website-templates/"
			class="nav">Sign Up</a></li>
		<li class="divider"></li>
		<li><a
			href="http://all-free-download.com/free-website-templates/"
			class="nav">Shipping </a></li>
		<li class="divider"></li>
		<li><a href="contact.html" class="nav">Contact Us</a></li>
		<li class="divider"></li>
		<li><a href="details.html" class="nav">Details</a></li>
	</ul>
</div>
<!-- end of menu tab -->