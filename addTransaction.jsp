<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Transaction</title>
    </head>
    <body>
        <h1>Add Transaction</h1>
        <form action="MainController" method="post">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br><br>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" required><br><br>

            <label for="description">Description:</label><br>
            <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>

            <label for="category">Category:</label>
           <select id="category" name="categoryId" required>
                <c:forEach var="category" items="${categoriesForSelect}">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select><br><br>
            <input type="hidden" name="controller" value="TransactionServlet">
            <input type="hidden" name="action" value="create">
            <input type="submit" value="Add Transaction">
        </form>
         <div class="text-center">
                    <a href="MainController?controller=TransactionServlet&action=getActiveTransactions" class="btn btn-secondary btn-custom btn-back">Back to Dashboard</a>
                </div>
    </body>
</html>
