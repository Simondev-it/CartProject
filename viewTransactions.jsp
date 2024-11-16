<%-- 
    Document   : viewTransactions
    Created on : Jul 6, 2024, 10:51:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div >
            <div >
                <h2 >All Transaction</h2>
                <c:if test="${requestScope.transactionsAll != null}" >
                    <div >
                        <table>
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Category</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.transactionsAll}" var="a">
                                <tr>
                                    <td>${a.date}</td>
                                    <td>${a.amount}</td>
                                    <td>${a.description}</td>
                                    <td>${a.status}</td>
                                    <td>${a.categoryId}</td>
                                    <td>
                                        <a  href="MainController?controller=TransactionServlet&action=getTransactionById&id=${a.id}">Edit</a>
                                        <a  href="MainController?controller=TransactionServlet&action=delete&id=${a.id}">Delete</a>
                                       
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <div class="text-center">
                    <a href="MainController?controller=TransactionServlet&action=getActiveTransactions" class="btn btn-secondary btn-custom btn-back">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </body>
</html>
