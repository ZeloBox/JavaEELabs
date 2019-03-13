<%-- 
    Document   : Portfolio.jsp
    Created on : Mar 12, 2019, 12:44:09 PM
    Author     : admin
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portfolio JSP Page</title>
    </head>
    <body>        

        <table border="1" width="1">
            <thead>
                <tr>
                    <th><a href=’CustomerDetails’>Customer Details</a></th>
                    <th><a href='AllCustomers'>All Customers</a></th>
                    <th><a href='Stocks.xhtml'>Stocks</a> </th>
                </tr>
            </thead>


            <tbody>
                <c:forEach var="share" items="${requestScope.shares}">
                    <tr><td>
                        <td>${share.stockSymbol}</td>
                        <td>${share.quantity}</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach> 
        <c:choose>
            <c:when test="${requestScope.message == null}">
                ${requestScope.customer.name}'s Stocks
                <br />
                <table border="1" cellpadding="4">
                    <thead>
                        <tr>
                            <th>Stock Symbol</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="share" items="${requestScope.shares}">
                            <tr>
                                <td>${share.stockSymbol}</td>
                                <td>${share.quantity}</td>
                            </tr>
                        </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div style="color:red;">${requestScope.message}</div>
            </c:otherwise>
        </c:choose>

    </body>
</html>
