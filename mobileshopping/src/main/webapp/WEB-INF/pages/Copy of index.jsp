<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tools Shop</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/iecss.css" />
<![endif]-->
<script type="text/javascript" src="js/boxOver.js"></script>
</head>
<body>
<div id="main_container">
  <div id="header">
    <div class="top_right">
      <div class="languages">
        <div class="lang_text">Languages:</div>
        <a href="http://all-free-download.com/free-website-templates/" class="lang"><img src="img/en.gif" alt="" border="0" /></a> <a href="http://all-free-download.com/free-website-templates/" class="lang"><img src="img/de.gif" alt="" border="0" /></a> </div>
      <div class="big_banner"> <a href="http://all-free-download.com/free-website-templates/"><img src="img/banner728.jpg" alt="" border="0" /></a> </div>
    </div>
    <div id="logo"> <a href="http://all-free-download.com/free-website-templates/"><img src="img/logo.png" alt="" border="0" width="182" height="85" /></a> </div>
  </div>
  <div id="main_content">
    <div id="menu_tab">
      <ul class="menu">
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav"> Home </a></li>
        <li class="divider"></li>
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav">Products</a></li>
        <li class="divider"></li>
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav">Specials</a></li>
        <li class="divider"></li>
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav">My account</a></li>
        <li class="divider"></li>
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav">Sign Up</a></li>
        <li class="divider"></li>
        <li><a href="http://all-free-download.com/free-website-templates/" class="nav">Shipping </a></li>
        <li class="divider"></li>
        <li><a href="contact.html" class="nav">Contact Us</a></li>
        <li class="divider"></li>
        <li><a href="details.html" class="nav">Details</a></li>
      </ul>
    </div>
    <!-- end of menu tab -->
    <div class="crumb_navigation"> Navigation: <span class="current">Home</span> </div>
    <div class="left_content">
      <div class="title_box">Categories</div>
      <ul class="left_menu">
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Power Tools</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Air Tools</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Hand Tools</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Accessories</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Workwear</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Spare Parts</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Power Tools</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Air Tools</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Hand Tools</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Accessories</a></li>
        <li class="odd"><a href="http://all-free-download.com/free-website-templates/">Workwear</a></li>
        <li class="even"><a href="http://all-free-download.com/free-website-templates/">Spare Parts</a></li>
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
      
      <c:forEach items="${listProducts}" var="product">
      	<div class="prod_box">
        <div class="center_prod_box">
          <div class="product_title"><a href="http://all-free-download.com/free-website-templates/">${product.name }</a></div>
          <div class="product_img"><a href="http://all-free-download.com/free-website-templates/"><img src="${pageContext.request.contextPath}/productImage?id=${product.id}" alt="" border="0" /></a></div>
          <div class="prod_price"><span class="reduce">${product.saleOff}vnd</span> <span class="price">${product.price }vnd</span></div>
        </div>
        <div class="prod_details_tab"> <a href="http://all-free-download.com/free-website-templates/" class="prod_buy">Add to Cart</a> <a href="http://all-free-download.com/free-website-templates/" class="prod_details">Details</a> </div>
      </div>
      </c:forEach>
      
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
      <div class="title_box">Search</div>
      <div class="border_box">
        <input type="text" name="newsletter" class="newsletter_input" value="keyword"/>
        <a href="http://all-free-download.com/free-website-templates/" class="join">search</a> </div>
      <div class="shopping_cart">
        <div class="title_box">Shopping cart</div>
        <div class="cart_details"> 3 items <br />
          <span class="border_cart"></span> Total: <span class="price">350$</span> </div>
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
  <div class="footer">
    <div class="left_footer"> <img src="img/footer_logo.png" alt="" width="89" height="42"/> </div>
    <div class="center_footer"> Template name. All Rights Reserved 2008<br />
      <a href="http://csscreme.com"><img src="img/csscreme.jpg" alt="csscreme" title="csscreme" border="0" /></a><br />
      <img src="img/payment.gif" alt="" /> </div>
    <div class="right_footer"> <a href="http://all-free-download.com/free-website-templates/">home</a> <a href="http://all-free-download.com/free-website-templates/">about</a> <a href="http://all-free-download.com/free-website-templates/">sitemap</a> <a href="http://all-free-download.com/free-website-templates/">rss</a> <a href="http://all-free-download.com/free-website-templates/">contact us</a> </div>
  </div>
</div>
<!-- end of main_container -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>