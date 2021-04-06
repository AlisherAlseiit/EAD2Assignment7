package org.example;

import org.example.dao.PostDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       Long id = Long.parseLong(request.getParameter("id"));



        PostDao postDao = new PostDao();
        String liked = "no";
        String disLiked = "no";
        try {

            RequestDispatcher requestDispatcher =  request.getRequestDispatcher("post.jsp");
            request.setAttribute("commentsCount", postDao.returnComments(id).stream().count());
            request.setAttribute("likes", postDao.returnLikesOfPost(id).stream().count());
            request.setAttribute("dislikes", postDao.returnDislikes(id).stream().count());


            if (request.getParameter("user_id") != null) {
                Long user_id = Long.parseLong(request.getParameter("user_id"));

                for(Likes likes : postDao.returnLike(user_id, id)) {
                    if (likes.getUser_id().equals(user_id))
                        liked = "yes";

                }

                for (Likes dislikes : postDao.returnDislike(user_id, id)){
                    if(dislikes.getUser_id().equals(user_id))
                        disLiked = "yes";
                }

            }



            request.setAttribute("dislikeInfos", disLiked);
            request.setAttribute("likeInfos", liked);

            System.out.println(liked);
            request.setAttribute("post", postDao.returnPost(id));

            requestDispatcher.forward(request, response);



        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }


}
