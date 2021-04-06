<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="user" class="org.example.UserBean" scope="session"/>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/comment.css">


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

<div>
    <div class="comment-thread">
        <!-- Comment 1 start -->
        <details open class="comment" id="comment-2">
            <a href="#comment-1" class="comment-border-link">
                <span class="sr-only">Jump to comment-1</span>
            </a>
            <summary>
                <div class="comment-heading">
                    <div class="comment-voting">
                        <button type="button">
                            <span aria-hidden="true">&#9650;</span>
                            <span class="sr-only">Vote up</span>
                        </button>
                        <button type="button">
                            <span aria-hidden="true">&#9660;</span>
                            <span class="sr-only">Vote down</span>
                        </button>
                    </div>
                    <div class="comment-info">
                        <a href="#" class="comment-author">someguy14</a>
                        <p class="m-0">
                            22 points &bull; 4 days ago
                        </p>
                    </div>
                </div>
            </summary>

            <div class="comment-body">
                <p>
                    This is a PlaceHolder!!!
                </p>
                <c:if test="${user.loggedIn != false}">
                <button type="button" data-toggle="reply-form" data-target="comment-1-reply-form">Add comment</button>
                <button type="button">Flag</button>
                </c:if>
                <!-- Reply form start -->
                <form action="addComment.jsp" method="post" class="reply-form d-none" id="comment-1-reply-form">
                    <input type="hidden" name="user_id" value="<c:out value='${user.user_id}' />"/>
                    <input type="hidden" name="post_id" value="<c:out value='${postId}' />"/>
                    <textarea type="text" placeholder="Add  comment" rows="4" name="content"></textarea>
                    <button type="submit">Submit</button>
                    <button type="button" data-toggle="reply-form" data-target="comment-1-reply-form">Cancel</button>
                </form>
                <!-- Reply form end -->
            </div>
        </details>
    </div>
</div>


        <c:forEach var="comment" items="${comments}">
    <div class="comment-thread">
        <!-- Comment 1 start -->
        <details open class="comment" id="comment-1">
            <a href="#comment-1" class="comment-border-link">
                <span class="sr-only">Jump to comment-1</span>
            </a>
            <summary>
                <div class="comment-heading">
                    <div class="comment-voting">
                        <button type="button">
                            <span aria-hidden="true">&#9650;</span>
                            <span class="sr-only">Vote up</span>
                        </button>
                        <button type="button">
                            <span aria-hidden="true">&#9660;</span>
                            <span class="sr-only">Vote down</span>
                        </button>
                    </div>
                    <div class="comment-info">
                        <a href="#" class="comment-author">id: <c:out value="${comment.user_id}"/></a>
                        <p class="m-0">
                            22 points &bull; 4 days ago
                        </p>
                    </div>
                </div>
            </summary>

            <div class="comment-body">
                <p>
                    <c:out value="${comment.content}"/>
                </p>
                <c:if test="${user.loggedIn != false}">
                    <button type="button" data-toggle="reply-form" data-target="<c:out value="${comment.id} "/>">Add
                        Comment
                    </button>
                    <button type="button">Flag</button>
                </c:if>

                <form class="reply-form d-none" action="addComment.jsp" method="post"
                      id="<c:out value="${comment.id} "/>">
                    <input type="hidden" name="user_id" value="<c:out value='${user.user_id}' />"/>
                    <input type="hidden" name="post_id" value="<c:out value='${comment.post_id}' />"/>
                    <textarea type="text" placeholder="Add  comment" rows="4" name="content"></textarea>
                    <button type="submit">Submit</button>
                    <button type="button" data-toggle="reply-form" data-target="<c:out value="${comment.id} "/>">
                        Cancel
                    </button>
                </form>
            </div>


        </details>

    </div>
</div>

</c:forEach>


</div>

<script>
    document.addEventListener(
        "click",
        function (event) {
            var target = event.target;
            var replyForm;
            if (target.matches("[data-toggle='reply-form']")) {
                replyForm = document.getElementById(target.getAttribute("data-target"));
                replyForm.classList.toggle("d-none");
            }
        },
        false
    );
</script>
</body>
</html>
