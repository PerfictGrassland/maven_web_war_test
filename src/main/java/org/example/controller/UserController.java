package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.User;

import java.io.IOException;
import java.util.List;

public class UserController extends HttpServlet {
    private static final List<User> MOCK_USERS = List.of(
            new User(1, "林小明", "ming@example.com", "管理员"),
            new User(2, "陈小美", "mei@example.com", "编辑"),
            new User(3, "王大力", "dali@example.com", "访客")
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("users", MOCK_USERS);
        request.setAttribute("userCount", MOCK_USERS.size());
        request.getRequestDispatcher("/WEB-INF/views/users.jsp").forward(request, response);
    }
}
