<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxurious Registration</title>
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
        .register-container {
            background: #1f1f1f;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        }
        .register-title {
            font-family: 'Playfair Display', serif;
            color: #E0E0E0;
        }
        .form-control {
            background-color: #2c2c2c;
            border: none;
            border-bottom: 2px solid #757575;
            border-radius: 0;
            color: #E0E0E0;
        }
        .form-control:focus {
            background-color: #333333;
            box-shadow: none;
            border-color: #90caf9;
        }
        .form-control::placeholder {
            color: #b0bec5;
        }
        .btn-register {
            background-color: #90caf9;
            border: none;
            color: #1f1f1f;
            font-weight: 600;
        }
        .btn-register:hover {
            background-color: #64b5f6;
            box-shadow: 0 5px 15px rgba(100, 181, 246, 0.4);
        }
        .login-link a {
            color: #90caf9;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="register-container w-100" style="max-width: 400px;">
            <h2 class="register-title text-center mb-4">Join Us</h2>
            <form action="MainController" method="post">
                <div class="mb-4">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                </div>
                <div class="mb-4">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="mb-4">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>
                <input type="hidden" name="controller" value="UserSevlet">
                <input type="hidden" name="action" value="register">
                <button type="submit" class="btn btn-register w-100 py-2 mb-3">Create Account</button>
            </form>
            <p class="login-link text-center mb-0">Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
