<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            margin-top: 100px;
        }
        .logout {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<%
    // Get existing session only (do NOT create new)
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        request.setAttribute("error", "Session expired! Please login again.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    String username = (String) sessionObj.getAttribute("username");
%>

<h2>Welcome, <%= username %>!</h2>
<p>You are successfully logged in.</p>

<a href="logout" class="logout">Logout</a>

</body>
</html>
