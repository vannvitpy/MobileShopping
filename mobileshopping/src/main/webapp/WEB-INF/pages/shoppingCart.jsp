<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Shopping Cart</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/iecss.css" />
<![endif]-->
<script type="text/javascript" src="js/boxOver.js"></script>

</head>
<body>
	<div id="main_container">
		<jsp:include page="header.jsp" />

		<jsp:include page="menu.jsp" />

		<fmt:setLocale value="en_US" scope="session" />

		<div class="page-title">My Cart</div>

		<c:if test="${empty cartForm or empty cartForm.cartLines}">
			<h2>There is no items in Cart</h2>
			<a href="${pageContext.request.contextPath}/productList">Show
				Product List</a>
		</c:if>

		<c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
			<form:form method="POST" modelAttribute="cartForm" 
				action="${pageContext.request.contextPath}/shoppingCart">

				<c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
					varStatus="varStatus">
					<div class="product-preview-container">
						<ul>
							<li><img class="product-image"
								src="${pageContext.request.contextPath}/productImage?id=${cartLineInfo.productInfo.id}" />
							</li>
							<li>Code: ${cartLineInfo.productInfo.id} <form:hidden
									path="cartLines[${varStatus.index}].productInfo.id" />

							</li>
							<li>Name: ${cartLineInfo.productInfo.name}</li>
							<li>Price: <span class="price"> <fmt:formatNumber
										value="${cartLineInfo.productInfo.price}" type="currency" />
							</span></li>
							<li>Quantity: <form:input
									path="cartLines[${varStatus.index}].quantity" /></li>
							<li>Subtotal: <span class="subtotal"> <fmt:formatNumber
										value="${cartLineInfo.amount}" type="currency" />

							</span>
							</li>
							<li><a
								href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?id=${cartLineInfo.productInfo.id}">
									Delete </a></li>
						</ul>
					</div>
				</c:forEach>
				<div style="clear: both"></div>
				<input class="button-update-sc" type="submit"
					value="Update Quantity" />

				<a class="navi-item"
					href="${pageContext.request.contextPath}/productList">Continue
					Buy</a>
				<a class="navi-item"
					href="${pageContext.request.contextPath}/shoppingCartCustomer">Done</a>
			</form:form>


		</c:if>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- end of main_container -->
</body>
</html>