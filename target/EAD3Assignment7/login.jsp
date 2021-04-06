
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>
<jsp:setProperty name="user" property="*"/>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>

<%

    session.setMaxInactiveInterval(60 * 30);
    if (user.login()){
        response.sendRedirect("posts.jsp");
        System.out.println(user.getUser_id());
        System.out.println(user.isLoggedIn());
    }else {

        response.sendRedirect("login.html");
    }
%>

</body>
</html>
