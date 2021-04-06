<%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 05/04/2021
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="org.example.UserBean" scope="session" />
<jsp:setProperty name="user" property="*"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    user.logout();
    response.sendRedirect("index.jsp");
%>
</body>
</html>