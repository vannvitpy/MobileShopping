<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Shopping Cart Finalize</title>
 
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/iecss.css" />
<![endif]-->
<script type="text/javascript" src="js/boxOver.js"></script>

<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
 
</head>
<body>
    <jsp:include page="header.jsp" />
 
    <jsp:include page="menu.jsp" />
 
    <div class="page-title">Finalize</div>
    
    <div class="container">
        <h3>Thank you for your Order</h3>
        Your order number is: ${lastOrderedCart.orderNum}
    </div>
 
    <jsp:include page="footer.jsp" />
 
</body>
</html>