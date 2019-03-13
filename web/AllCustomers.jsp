<%@page import="trader.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Customers</title>
    </head>
    <body>
    <body>
        <table border='1' cellpadding='4'>
            <tbody>
                <tr><td><a href='CustomerDetails'>Customer Details</a></td><td><a href='AllCustomers'>All Customers</a></td><td><a href='Stocks.xhtml'>Stocks</a></td></tr>
            </tbody>
        </table>
        <br/>

        <table border="1" cellpadding="4">
            <thead>
                <tr>
                    <th>Customer Id</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Portfolio</th>
                </tr>
            </thead>
            <tbody>
                <%
            Customer[] customers = (Customer[]) request.getAttribute("customers");

            for (int i = 0; i < customers.length; i++) {
                %>
                <tr>
                    <td><a href="CustomerController?customerIdentity=<%= customers[i].getId()%>&submit=Get Customer"><%= customers[i].getId()%></a></td>
                    <td><%= customers[i].getName()%></td>
                    <td><%= customers[i].getAddr()%></td>
                    <td align='center'><a href='PortfolioController?customerIdentity=<%= customers[i].getId()%>'>View</a></td>
                </tr>
                <%
            }
                %>
            </tbody>
        </table>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println("<font color='red'>" + message + "</font>");
            }
        %>
    </body>
</html