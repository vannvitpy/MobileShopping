<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tools Shop</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/iecss.css" />
<![endif]-->

<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="js/boxOver.js"></script>
<script type="text/javascript">
function searchOnFocus(){
	$("#searchBox")[0].value = "";
}
 function searchLeaveFocus(){
	if($("#searchBox")[0].value.length == 0){
		$("#searchBox")[0].value = "keyword";
	} 
} 
</script>

</head>
<body>
<div id="main_container">
<!-- Header -->
  <jsp:include page="header.jsp"></jsp:include>
  <div id="main_content">
  <!-- Menu -->
    <jsp:include page="menu.jsp"></jsp:include>
    
    <div class="crumb_navigation"> Navigation: <span class="current">Home</span> </div>
    
    <div class="left_content">
      <div class="title_box">Categories</div>
      <ul class="left_menu">
      <c:forEach items="${listManufacture}" var="manufacture">
      <c:if test="${ manufacture.id % 2 == 0}">
      	<li class="even"><a href="${pageContext.request.contextPath}/productByManufacture?id=${manufacture.id}">${manufacture.name}</a></li>
      </c:if>
      <c:if test="${ manufacture.id % 2 != 0}">
      	<li class="odd"><a href="${pageContext.request.contextPath}/productByManufacture?id=${manufacture.id}">${manufacture.name}</a></li>
      </c:if>  
      </c:forEach>
      </ul>
      
      <div class="title_box">Special Products</div>
      <div class="border_box">
        <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Makita 156 MX-VL</a></div>
        <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p1.jpg" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
      </div>
      <div class="title_box">Newsletter</div>
      <div class="border_box">
        <input type="text" name="newsletter" class="newsletter_input" value="your email"/>
        <a href="http://all-free-download.com/free-website-templates/" class="join">subscribe</a> </div>
      <div class="banner_adds"> <a href="http://all-free-download.com/free-website-templates/"><img src="img/bann2.jpg" alt="" border="0" /></a> </div>
    </div>
    <!-- end of left content -->
    
    
    <div class="center_content">
    
      <div class="oferta"> <img src="img/p1.png" width="165" height="113" border="0" class="oferta_img" alt="" />
        <div class="oferta_details">
          <div class="oferta_title">Power Tools BST18XN Cordless</div>
          <div class="oferta_text"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco </div>
          <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">details</a> </div>
      </div>
      
      <div class="center_title_bar">Latest Products</div>
      <!-- Show Products by manufacturers -->
      <c:forEach items="${listProduct}" var="product">
      	<div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">${product.name }</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="${pageContext.request.contextPath}/productImage?id=${product.id}" alt="" border="0" /></a></div>
          <div class="prod_price">
	          <span class="reduce">${product.price } vnd</span> 
	          <span class="price">${product.saleOff} vnd</span> 
          </div>
        </div>
        <div class="prod_details_tab"> <a href="${pageContext.request.contextPath}/buyProduct?id=${product.id}" class="prod_buy">Add to Cart</a> <a href="orderList?page=${page}" class="prod_details">Details</a> </div>
      </div>
      </c:forEach>
      
      <!-- Show Products -->
      <c:forEach items="${paginationProducts.list}" var="product">
      	<div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">${product.name }</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="${pageContext.request.contextPath}/productImage?id=${product.id}" alt="" border="0" /></a></div>
          <div class="prod_price">
	          <span class="reduce">${product.price } vnd</span> 
	          <span class="price">${product.saleOff} vnd</span> 
          </div>
        </div>
        <div class="prod_details_tab"> <a href="${pageContext.request.contextPath}/buyProduct?id=${product.id}" class="prod_buy">Add to Cart</a> <a href="orderList?page=${page}" class="prod_details">Details</a> </div>
      </div>
      </c:forEach>
      
    <br/>
  
    <c:if test="${paginationProducts.totalPages > 1}">
        <div class="page-navigator">
           <c:forEach items="${paginationProducts.navigationPages}" var = "page">
               <c:if test="${page != -1 }">
                 <a href="productList?page=${page}" class="nav-item">${page}</a>
               </c:if>
               <c:if test="${page == -1 }">
                 <span class="nav-item"> ... </span>
               </c:if>
           </c:forEach>
            
        </div>
    </c:if>
      
      
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Makita 156 MX-VL</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p1.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Bosch XC</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p2.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Lotus PP4</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p4.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Makita 156 MX-VL</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p3.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Bosch XC</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p5.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Lotus PP4</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p6.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      
      <div class="center_title_bar">Recomended Products</div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Makita 156 MX-VL</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p7.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Bosch XC</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p1.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      <div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Lotus PP4</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p3.jpg" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
    </div>
    
    
    <!-- end of center content -->
    <div class="right_content">
    <form:form method="GET" modelAttribute="keyword" 
    action="${pageContext.request.contextPath}/search">
    	<div class="title_box">Search</div>
      <div class="border_box">
        <input id="searchBox" type="text" name="keyword" class="newsletter_input" title="Input keyword" value = "keyword" onfocus="searchOnFocus()" onblur="searchLeaveFocus()"/>
        <input class="button-update-sc" type="submit" value="Search" />
      </div>
    </form:form>
      
      <div class="shopping_cart">
        <div class="title_box">Shopping cart</div>
        <div class="cart_details"> ${cartForm.cartLines.size()} items <br />
          <span class="border_cart"></span> Total: <span class="price">${cartForm.amountTotal} vnd</span> </div>
        <div class="cart_icon"><a href="http://all-free-download.com/free-website-templates/"><img src="img/shoppingcart.png" alt="" width="35" height="35" border="0" /></a></div>
      </div>
      <div class="title_box">What’s new</div>
      <div class="border_box"> 
        <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">Motorola 156 MX-VL</a></div>
        <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="img/p2.jpg" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
      </div>
      <div class="title_box">Manufacturers</div>
      <ul class="left_menu">
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Bosch</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Samsung</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Makita</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">LG</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Fujitsu Siemens</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Motorola</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Phillips</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Beko</a></li>
      </ul>
      <div class="banner_adds"> <a href="http://all-free-download.com/free-website-templates/"><img src="img/bann1.jpg" alt="" border="0" /></a> </div>
    </div>
    <!-- end of right content -->
  </div>
  <!-- end of main content -->
  
  <c:if test="${paginationProducts.totalPages > 1}">
        <div class="page-navigator">
           <c:forEach items="${paginationProducts.navigationPages}" var = "page">
               <c:if test="${page != -1 }">
                 <a href="productList?page=${page}" class="nav-item">${page}</a>
               </c:if>
               <c:if test="${page == -1 }">
                 <span class="nav-item"> ... </span>
               </c:if>
           </c:forEach>
            
        </div>
    </c:if>
    
  <jsp:include page="footer.jsp"></jsp:include> 
</div>
<!-- end of main_container -->
</html>