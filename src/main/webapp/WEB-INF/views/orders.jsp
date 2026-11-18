<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.DemoOrder" %>
<%
    List<?> orders = (List<?>) request.getAttribute("orders");
    int totalAmount = (Integer) request.getAttribute("totalAmount");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>订单列表</title>
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
<h1>订单列表</h1>
<table>
    <thead>
    <tr><th>订单号</th><th>客户</th><th>商品</th><th>金额</th><th>状态</th></tr>
    </thead>
    <tbody>
    <% for (Object item : orders) {
        DemoOrder order = (DemoOrder) item; %>
        <tr>
            <td><%= order.getOrderNumber() %></td>
            <td><%= order.getCustomer() %></td>
            <td><%= order.getProduct() %></td>
            <td>¥<%= order.getAmount() %></td>
            <td><%= order.getStatus() %></td>
        </tr>
    <% } %>
    </tbody>
</table>
<p>订单金额合计：<strong>¥<%= totalAmount %></strong></p>
</body>
</html>
