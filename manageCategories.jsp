<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Categories</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Manage Categories</h1>
    
    <!-- Add Category Form -->
    <h2>Add New Category</h2>
    <form action="MainController" method="post">
        <input type="hidden" name="controller" value="CategoryServlet">
        <input type="hidden" name="action" value="create">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="Income">Income</option>
            <option value="Expense">Expense</option>
        </select>
        <input type="submit" value="Add Category">
    </form>
    
    <!-- Category List -->
    <h2>Category List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>${category.type}</td>
                    <td>
                        
                        <a href="MainController?controller=CategoryServlet&action=delete&id=${category.id}" onclick="return confirm('Are you sure you want to delete this category?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="MainController?controller=TransactionServlet&action=getActiveTransactions">Back to Dashboard</a>
</body>
</html>