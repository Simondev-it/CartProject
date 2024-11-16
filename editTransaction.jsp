<%-- 
    Document   : editTransaction
    Created on : Jul 6, 2024, 10:51:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="bg-image">
            <div class="edit-container">
                <h2 class="edit-title">Edit Transaction</h2>
                <form action="MainController" method="post">
                    <input type="hidden" name="id" value="${requestScope.transactionById.id}">
                    <div class="form-group">
                        <label for="transactionDate">Date:</label>
                        <input type="date" class="form-control" id="transactionDate" name="date" value="${requestScope.transactionById.date}" required>
                    </div>
                    <div class="form-group">
                        <label for="amount">Amount</label>
                        <input type="number" class="form-control" id="amount" name="amount" step="0.01" value="${requestScope.transactionById.amount}" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description" value="${requestScope.transactionById.description}" required>
                    </div>


                    <input type="hidden" name="categoryId" value="${requestScope.transactionById.categoryId}">


                    <input type="hidden" name="controller" value="TransactionServlet">
                    <input type="hidden" name="action" value="edit">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-custom">Save Changes</button>
                    </div>
                </form>
                <div class="text-center">
                    <a href="MainController?controller=TransactionServlet&action=getActiveTransactions" class="btn btn-secondary btn-custom btn-back">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </body>
</html>
