<%@ page import="org.example.dao.PostDao" %>

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
    postDao.editPost(post.getId(), post);
    response.sendRedirect("posts.jsp");

%>
</body>
</html>
