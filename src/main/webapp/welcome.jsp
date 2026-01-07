<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.RequestDispatcher" %>

<html>
<body>

<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        request.setAttribute("error", "Session expired");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
        return;
    }
%>

<h2>Welcome <%= user %></h2>
<p>Login successful using JDBC</p>

<a href="logout">Logout</a>

</body>
</html>
