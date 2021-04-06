<%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 05/04/2021
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<%

    session.setMaxInactiveInterval(60 * 30);
    if (user.registration()){
        response.sendRedirect("login.html");
    }else {
        response.sendRedirect("registration.html");
    }
%>
</body>
</html>
