<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Reports</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-white">
        <div class="container mt-5">
            <h2 class="mb-4">Generate Transaction Reports</h2>

            <form action="GenerateReportsServlet" method="post" class="mb-4">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="startDate">Start Date:</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="endDate">End Date:</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="categoryId">Category:</label>
                        <select class="form-control" id="categoryId" name="categoryId">
                            <option value="">All Categories</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-primary btn-block">Generate Report</button>
                    </div>
                </div>
            </form>
            <form action="GeneratePDFReportServlet" method="post" class="mb-4">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="startDate">Start Date:</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="endDate">End Date:</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="categoryId">Category:</label>
                        <select class="form-control" id="categoryId" name="categoryId">
                            <option value="">All Categories</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label>&nbsp;</label>
                        <button type="submit" formaction="GeneratePDFReportServlet" class="btn btn-success btn-block">Generate PDF</button>
                    </div>
                </div>
            </form>

            <h3 class="mt-5 mb-3">Transaction Report</h3>
            <c:if test="${not empty requestScope.transactions}">
                <div class="table-responsive">
                    <table class="table table-hover table-dark">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.transactions}" var="transaction">
                                <tr>
                                    <td><fmt:formatDate value="${transaction.date}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatNumber value="${transaction.amount}" type="currency"/></td>
                                    <td>${transaction.description}</td>
                                    <td>${transaction.status}</td>
                                    <td>${transaction.categoryId}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${empty requestScope.transactions}">
                <p>No transactions found for the selected criteria.</p>
            </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>