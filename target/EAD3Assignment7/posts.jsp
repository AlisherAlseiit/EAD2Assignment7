<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="post" class="org.example.PostBean" scope="page"/>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>


<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .navbar {
            overflow: hidden;
            background-color: #333;
        }

        .navbar a {
            float: left;
            font-size: 16px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: red;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .card {
            box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 100%;
            color: #1e9ce6;


        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            padding: 8px 16px;
        }

        .inactiveLink {
            pointer-events: none;
            cursor: default;
        }
    </style>
</head>

<body>
<div class="navbar">
    <a href="#">Forum</a>
    <div class="dropdown">
        <button class="dropbtn">Dropdown
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <c:if test="${user.isLoggedIn() == true}">
                <a href="addPost.html" class="">Create new Post</a>
            </c:if>
            <c:if test="${user.isLoggedIn() == false}">
                <a href="addPost.html" class="inactiveLink">Create new Post</a>
            </c:if>
            <c:if test="${user.isLoggedIn() == true}">
            <a href="logout.jsp"
               class="nav-link">Logout</a>
            </c:if>
            <c:if test="${user.isLoggedIn() == false}">
                <a href="index.jsp">exit</a>
            </c:if>

        </div>
    </div>
</div>
<h2>Posts</h2>

<c:forEach var="by" items="${post.returnPosts()}">
    <div class="card">


        <div class="container">
            <h4><b><c:out value="${by.title}"/></b></h4>
            <p><c:out value="${by.content}"/></p>
            <c:if test="${user.user_id == null}">
            <a href="post?id=<c:out value='${by.id}'/>">For More info</a>
            </c:if>
            <c:if test="${user.user_id != null}">
             <a href="post?id=<c:out value='${by.id}'/>&user_id=<c:out value='${user.user_id}'/>">For More info</a>
            </c:if>
        </div>

    </div>
</c:forEach>


</body>
</html>
