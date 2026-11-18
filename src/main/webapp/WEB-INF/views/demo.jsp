<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Product" %>
<%!
    private String escapeHtml(String value) {
        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<%
    String name = (String) request.getAttribute("name");
    String currentTime = (String) request.getAttribute("currentTime");
    int totalStock = (Integer) request.getAttribute("totalStock");
    List<?> products = (List<?>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>Java Controller + JSP 示例</title>
    <style>
        body {
            max-width: 760px;
            margin: 40px auto;
            font-family: "Microsoft YaHei", sans-serif;
            color: #333;
        }
        form {
            margin: 20px 0;
        }
        input, button {
            padding: 8px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 12px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background: #f5f5f5;
        }
    </style>
</head>
<body>
<nav>
    <a href="<%= request.getContextPath() %>/demo">商品</a>
    <a href="<%= request.getContextPath() %>/users">用户</a>
    <a href="<%= request.getContextPath() %>/orders">订单</a>
</nav>
<h1>你好，<%= escapeHtml(name) %>！</h1>
<p>页面数据由 DemoController 提供，更新时间：<strong><%= escapeHtml(currentTime) %></strong></p>

<form method="get" action="<%= request.getContextPath() %>/demo">
    <label for="name">输入名字：</label>
    <input id="name" name="name" value="<%= escapeHtml(name) %>">
    <button type="submit">调用控制器</button>
</form>

<h2>模拟商品数据</h2>
<table>
    <thead>
    <tr>
        <th>商品</th>
        <th>价格</th>
        <th>库存</th>
    </tr>
    </thead>
    <tbody>
    <% for (Object item : products) {
        Product product = (Product) item; %>
        <tr>
            <td><%= escapeHtml(product.getName()) %></td>
            <td>¥<%= product.getPrice() %></td>
            <td><%= product.getStock() %></td>
        </tr>
    <% } %>
    </tbody>
</table>
<p>总库存：<strong><%= totalStock %></strong></p>
</body>
</html>
