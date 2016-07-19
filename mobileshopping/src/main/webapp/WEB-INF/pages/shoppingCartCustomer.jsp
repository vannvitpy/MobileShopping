<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Enter Your Information</title>

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
 
<div class="page-title">Enter Your Information</div>
 
    <form:form method="POST" modelAttribute="customerForm"
        action="${pageContext.request.contextPath}/shoppingCartCustomer">
 
        <table>
            <tr>
                <td>Name *</td>
                <td><form:input path="name" /></td>
                <td><form:errors path="name" class="error-message" /></td>
            </tr>
 
            <tr>
                <td>Email *</td>
                <td><form:input path="email" /></td>
                <td><form:errors path="email" class="error-message" /></td>
            </tr>
 
            <tr>
                <td>Phone *</td>
                <td><form:input path="phone" /></td>
                <td><form:errors path="phone" class="error-message" /></td>
            </tr>
 
            <tr>
                <td>Address *</td>
                <td><form:input path="address" /></td>
                <td><form:errors path="address" class="error-message" /></td>
            </tr>
 
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" value="Submit" /> <input type="reset"
                    value="Reset" /></td>
            </tr>
        </table>
 
    </form:form>
 
 
    <jsp:include page="footer.jsp" />
 
 
</body>
</html>