<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>

<%
    System.out.println(user.isLoggedIn());
%>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="styles/button.css">
    <%--    <script type="text/javascript" src="styles/some.js"></script>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: black">
        <div>
            <a href="posts.jsp" class="navbar-brand">
                FORUM</a>
        </div>


        <c:if test="${user.isLoggedIn() == true}">
            <ul class="navbar-nav navbar-collapse justify-content-end">
                <li><a href="logout.jsp"
                       class="nav-link">Logout</a></li>
            </ul>
        </c:if>
    </nav>
</header>
<body>

<%--<div>--%>


<%--    <div class="container text text-center">--%>
<%--        <h4><b><c:out value="${post.title}"/></b></h4>--%>
<%--        <p><c:out value="${post.content}"/></p>--%>
<%--        <c:if test="${user.user_id == post.userId && user.loggedIn != false}">--%>
<%--            <a href="edit?id=<c:out value='${post.id}'/> ">Edit Post</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>

<%--</div>--%>


<div class="card">
    <div class="card-image"></div>
    <div class="card-text">
        <c:if test="${user.user_id == post.userId && user.loggedIn != false}">
            <span class="date"><a href="edit?id=<c:out value='${post.id}'/> ">Edit Post</a></span>
        </c:if>
        <h2><c:out value="${post.title}"/></h2>
        <p><c:out value="${post.content}"/></p>

        <c:if test="${likeInfos == 'no' && user.loggedIn == true}">
            <div class="container">
                <div class="wrapper">
                    <form action="newLike.jsp" method="post">
                        <button name="foo" value="like" class="btn btn-like">
                            <input type="hidden" name="post_id" value="<c:out value='${post.id}' />" />
                            <input type="hidden" name="user_id" value="<c:out value='${user.user_id}' />" />

              <span class="btn-content  btn-content--liked">
              Liked
            </span>
                            <span class="btn-content btn-content--default">
              Like
            </span>
                        </button>
                    </form>

                </div>
            </div>
        </c:if>
    </div>

    <div class="card-stats">
        <div class="stat">
            <div class="value"><c:out value='${dislikes}'/></div>
        <c:if test="${dislikeInfos == 'no' && user.loggedIn == true}">
            <form action="newDislike.jsp" method="post" >
                <button  style="border:none  ; color: white; background-color: transparent;" name="foo" value="like" class=" fa fa-thumbs-down" >

                    <input type="hidden" name="post_id" value="<c:out value='${post.id}' />" />
                    <input type="hidden" name="user_id" value="<c:out value='${user.user_id}' />" />
                </button>
            </form>
        </c:if>
<c:if test="${dislikeInfos == 'yes'}">
            <div class="type">dislikes</div>
</c:if>
        </div>
        <div class="stat border">
            <div class="value"><c:out value='${likes}'/></div>
            <div class="type">likes</div>

        </div>
        <div class="stat">
            <div class="value"><c:out value='${commentsCount}'/></div>
            <a href="comment?id=<c:out value='${post.id}'/> ">comments</a>
        </div>
    </div>
</div>


<script>
    const button = document.querySelector('.btn')

    button.addEventListener('click', () => {
        button.classList.toggle('liked')
    })
</script>
</body>
</html>
