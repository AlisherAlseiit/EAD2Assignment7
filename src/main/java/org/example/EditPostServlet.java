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

@WebServlet("/edit")
public class EditPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));
        PostDao postDao = new PostDao();

        try {

            RequestDispatcher requestDispatcher =  request.getRequestDispatcher("edit.jsp");
            request.setAttribute("editPost", postDao.returnPost(id));
            System.out.println(postDao.returnPost(id));
            requestDispatcher.forward(request, response);

        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }
}
