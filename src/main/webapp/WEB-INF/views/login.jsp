<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            max-width: 100%;
        }
        .login-container h2 {
            margin-top: 0;
            font-size: 24px;
            color: #333;
            text-align: center;
        }
        .login-container p {
            margin: 10px 0;
        }
        .login-container label {
            display: block;
            font-size: 14px;
            color: #666;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .login-container button:hover {
            background-color: #218838;
        }
        .login-container .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form:form action="login" method="post" modelAttribute="model">
            <c:if test="${not empty model}">
                <p class="error-message">${model}</p>
            </c:if>
            <p>
                <label for="username">Username</label>
                <input type="text" id="username" name="userName" required>
            </p>
            <p>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </p>
            <button type="submit">Đăng Nhập</button>
        </form:form>
    </div>
</body>
</html>
