<%@ page import="org.example.dao.PostDao" %><%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 05/04/2021
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>
<jsp:useBean id="post" class="org.example.PostBean" scope="page"/>
<jsp:setProperty name="post" property="*"/>



<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PostDao postDao = new PostDao();
        postDao.addPost(user.getUser_id(), post.getTitle(), post.getContent());
        response.sendRedirect("posts.jsp");

%>
</body>
</html>
