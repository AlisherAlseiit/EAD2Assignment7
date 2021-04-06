
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<div id="main-form">
    <div id="form-div">
        <form id="form-one" class="form" action="edit2.jsp" method="post">
            <h1>Post</h1>
            <input type="hidden" name="id" value="<c:out value='${editPost.id}' />" />
            <input type="hidden" name="userId" value="<c:out value='${editPost.userId}' />" />
            <input type="text" class="register-input" name="title" required="required" placeholder="title" value="<c:out value='${editPost.title}' />">
            <input type="text" class="register-input" name="content" required="required" placeholder="content" value="<c:out value='${editPost.content}' />">



            <div class="submit">
                <input type="submit" value="Post" id="button-bottom"/>
                <div class="ease"></div>
            </div>
        </form>
    </div>
</div>
</body>
</html>