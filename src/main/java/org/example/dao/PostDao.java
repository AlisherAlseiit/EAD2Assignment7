package org.example.dao;

import org.example.CommentBean;
import org.example.Likes;
import org.example.PostBean;
import org.example.dbInfo.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";
    private static Connection connection = null;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public PostBean returnPost(Long post_id) throws SQLException {
        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("SELECT * FROM posts WHERE id = ?  ");

        preparedStatement.setLong(1, post_id);
        ResultSet resultSet = preparedStatement.executeQuery();

        resultSet.next();

        PostBean postBean = new PostBean();
        postBean.setId(resultSet.getLong("id"));
        postBean.setTitle(resultSet.getString("title"));
        postBean.setContent(resultSet.getString("content"));
        postBean.setUserId(resultSet.getLong("user_id"));

        return postBean;
    }

    public List<Likes> returnLike(Long user_id, Long post_id) throws SQLException {
        PreparedStatement preparedStatement = null;

        List<Likes> likesList = new ArrayList<>();
        preparedStatement = connection.prepareStatement("SELECT * FROM likes WHERE user_id = ? and post_id = ?  ");

        preparedStatement.setLong(1, user_id);
        preparedStatement.setLong(2, post_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {

            Likes likes = new Likes();
            likes.setId(resultSet.getLong("id"));
            likes.setUser_id(resultSet.getLong("user_id"));
            likes.setPost_id(resultSet.getLong("post_id"));

            likesList.add(likes);
        }

        return likesList;

    }

    public List<Likes> returnDislike(Long user_id, Long post_id) throws SQLException {
        PreparedStatement preparedStatement = null;

        List<Likes> disLikes = new ArrayList<>();
        preparedStatement = connection.prepareStatement("SELECT * FROM dislikes WHERE user_id = ? and post_id = ?  ");

        preparedStatement.setLong(1, user_id);
        preparedStatement.setLong(2, post_id);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {

            Likes likes = new Likes();
            likes.setId(resultSet.getLong("id"));
            likes.setUser_id(resultSet.getLong("user_id"));
            likes.setPost_id(resultSet.getLong("post_id"));

            disLikes.add(likes);
        }

        return disLikes;

    }


    public List<CommentBean> returnComments(Long postId) throws SQLException {
        List<CommentBean> commentBeans = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("SELECT * FROM comments WHERE post_id = ?  ");

        preparedStatement.setLong(1, postId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {

            CommentBean commentBean = new CommentBean();
            commentBean.setContent(resultSet.getString("content"));
            commentBean.setId(resultSet.getLong("id"));
            commentBean.setPost_id(resultSet.getLong("post_id"));
            commentBean.setUser_id(resultSet.getLong("user_id"));

            commentBeans.add(commentBean);

        }
        return commentBeans;
    }

    public List<Likes> returnLikesOfPost(Long postId) throws SQLException {
        List<Likes> likes = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("SELECT * FROM likes WHERE post_id = ?  ");

        preparedStatement.setLong(1, postId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Likes like = new Likes();

            like.setId(resultSet.getLong("id"));
            like.setPost_id(resultSet.getLong("post_id"));
            like.setUser_id(resultSet.getLong("user_id"));

            likes.add(like);
        }


        return likes;

    }

    public List<Likes> returnDislikes(Long postId) throws SQLException {
        List<Likes> disLikes = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("SELECT * FROM dislikes WHERE post_id = ?  ");

        preparedStatement.setLong(1, postId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            Likes like = new Likes();

            like.setId(resultSet.getLong("id"));
            like.setPost_id(resultSet.getLong("post_id"));
            like.setUser_id(resultSet.getLong("user_id"));

            disLikes.add(like);
        }


        return disLikes;

    }



    public List<PostBean> returnPosts() {

        List<PostBean> posts = new ArrayList<>();
        connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM posts ORDER BY id asc");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                PostBean postBean = new PostBean();

                postBean.setId(resultSet.getLong("id"));
                postBean.setTitle(resultSet.getString("title"));
                postBean.setContent(resultSet.getString("content"));
                postBean.setUserId(resultSet.getLong("user_id"));


                posts.add(postBean);
            }
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }

        return  posts;

    }

    public void addPost(Long user_id, String title, String content) throws SQLException {
        Connection connection = null;
        connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;


        preparedStatement = connection.prepareStatement("INSERT INTO posts(title, content, user_id) VALUES(?, ?, ?)");
        preparedStatement.setString(1, title);
        preparedStatement.setString(2, content);
        preparedStatement.setLong(3, user_id);

        preparedStatement.executeUpdate();


    }

    public void addLike(Long user_id, Long post_id) throws SQLException {

        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("INSERT INTO likes(user_id, post_id) VALUES (?,?)");
        preparedStatement.setLong(1, user_id);
        preparedStatement.setLong(2,post_id);
        preparedStatement.executeUpdate();
    }

    public void addDislike(Long user_id, Long post_id) throws SQLException {

        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("INSERT INTO dislikes(user_id, post_id) VALUES (?,?)");
        preparedStatement.setLong(1, user_id);
        preparedStatement.setLong(2,post_id);
        preparedStatement.executeUpdate();
    }


    public void addComment(Long user_id, Long post_id, String content) throws SQLException {

        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("INSERT INTO comments(content, user_id, post_id) VALUES(?, ?, ?)");

        preparedStatement.setString(1, content);
        preparedStatement.setLong(2, user_id);
        preparedStatement.setLong(3, post_id);

        preparedStatement.executeUpdate();


    }


    public void editPost(Long post_id, PostBean postBean) throws SQLException {
        Connection connection = null;
        connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        preparedStatement = connection.prepareStatement("UPDATE posts SET  title=?, content=? WHERE id=?");

        preparedStatement.setString(1, postBean.getTitle());
        preparedStatement.setString(2, postBean.getContent());
        preparedStatement.setLong(3, post_id);

        preparedStatement.executeUpdate();
    }
}
