<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxurious Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #121212;
            color: #E0E0E0;
            min-height: 100vh;
        }
        .dashboard-container {
            background: #1f1f1f;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        }
        .dashboard-title {
            font-family: 'Playfair Display', serif;
            color: #E0E0E0;
        }
        .welcome-message {
            color: #90caf9;
        }
        .table {
            background-color: #2c2c2c;
            color: #E0E0E0;
        }
        .table th {
            background-color: #424242;
            color: #E0E0E0;
            border-color: #757575;
        }
        .table td {
            border-color: #757575;
        }
        .btn-custom {
            background-color: #90caf9;
            border: none;
            color: #1f1f1f;
            font-weight: 600;
        }
        .btn-custom:hover {
            background-color: #64b5f6;
            box-shadow: 0 5px 15px rgba(100, 181, 246, 0.4);
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="dashboard-container">
            <h2 class="dashboard-title text-center mb-4">Dashboard</h2>
            <p class="welcome-message text-center mb-4">Welcome, <%= session.getAttribute("username") %></p>
            <form action="MainController" method="post" class="text-center mb-4">
                <input type="hidden" name="controller" value="UserSevlet">
                <input type="hidden" name="action" value="logout">  
                <button type="submit" class="btn btn-custom">Logout</button>
            </form>
            <h3 class="text-white mt-5 mb-3">Upcoming Transaction</h3>
            <c:if test="${not empty requestScope.transactions}">
                <div class="table-responsive">
                    <table class="table table-hover">
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
                            <c:forEach items="${requestScope.transactions}" var="a">
                                <tr>
                                    <td>${a.date}</td>
                                    <td>${a.amount}</td>
                                    <td>${a.description}</td>
                                    <td>${a.status}</td>
                                    <td>${a.categoryId}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <div class="mt-5 text-center">
                <a href="MainController?controller=CategoryServlet&action=listForSelect" class="btn btn-custom m-2">Create New Transaction</a>
                <a href="MainController?controller=TransactionServlet&action=getTransactions" class="btn btn-custom m-2">View All Transaction</a>
                <a href="MainController?controller=CategoryServlet&action=list" class="btn btn-custom m-2">Manage Category</a>
                <a href="GenerateReportsServlet" class="btn btn-custom m-2">Generate Report</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
