<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.User" %>
<%
    List<?> users = (List<?>) request.getAttribute("users");
    int userCount = (Integer) request.getAttribute("userCount");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <style>
        body { max-width: 760px; margin: 40px auto; font-family: "Microsoft YaHei", sans-serif; color: #333; }
        nav a { margin-right: 16px; }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background: #f5f5f5; }
    </style>
</head>
<body>
<nav>
    <a href="<%= request.getContextPath() %>/demo">商品</a>
    <a href="<%= request.getContextPath() %>/users">用户</a>
    <a href="<%= request.getContextPath() %>/orders">订单</a>
</nav>
<h1>用户列表</h1>
<p>当前共有 <strong><%= userCount %></strong> 位模拟用户。</p>
<table>
    <thead>
    <tr><th>ID</th><th>姓名</th><th>邮箱</th><th>角色</th></tr>
    </thead>
    <tbody>
    <% for (Object item : users) {
        User user = (User) item; %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
        </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
