package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.DemoOrder;

import java.io.IOException;
import java.util.List;

public class OrderController extends HttpServlet {
    private static final List<DemoOrder> MOCK_ORDERS = List.of(
            new DemoOrder("ORD-1001", "林小明", "机械键盘", 299, "已发货"),
            new DemoOrder("ORD-1002", "陈小美", "无线鼠标", 89, "待付款"),
            new DemoOrder("ORD-1003", "王大力", "Java 入门书", 59, "已完成")
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int totalAmount = MOCK_ORDERS.stream()
                .mapToInt(DemoOrder::getAmount)
                .sum();

        request.setAttribute("orders", MOCK_ORDERS);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("/WEB-INF/views/orders.jsp").forward(request, response);
    }
}
