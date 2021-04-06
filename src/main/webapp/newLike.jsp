<%@ page import="org.example.dao.PostDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>
<jsp:useBean id="post" class="org.example.PostBean" scope="page"/>
<jsp:useBean id="likes" class="org.example.Likes" scope="page"/>
<jsp:setProperty name="likes" property="*"/>


<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    PostDao postDao = new PostDao();
    System.out.println("some likes data:" + likes.getUser_id() + "," +  likes.getPost_id());
    postDao.addLike(likes.getUser_id(), likes.getPost_id());
    response.sendRedirect("posts.jsp");

%>
</body>
</html>
