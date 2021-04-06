package org.example;

import org.example.dao.PostDao;
import org.example.dbInfo.DBConnection;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostBean implements Serializable {

    private Long id = null;
    private String title = null;
    private String content = null;


    private Long userId = null;

    public PostBean() {
    }




    public List<PostBean> returnPosts() {
        PostDao postDao = new PostDao();
        return postDao.returnPosts();

    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

}
