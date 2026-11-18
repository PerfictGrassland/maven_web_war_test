package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.Product;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class DemoController extends HttpServlet {
    private static final List<Product> MOCK_PRODUCTS = List.of(
            new Product("机械键盘", 299, 12),
            new Product("无线鼠标", 89, 35),
            new Product("Java 入门书", 59, 20)
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        if (name == null || name.trim().isEmpty()) {
            name = "朋友";
        } else {
            name = name.trim();
        }

        int totalStock = MOCK_PRODUCTS.stream()
                .mapToInt(Product::getStock)
                .sum();
        String currentTime = LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        request.setAttribute("name", name);
        request.setAttribute("products", MOCK_PRODUCTS);
        request.setAttribute("totalStock", totalStock);
        request.setAttribute("currentTime", currentTime);

        request.getRequestDispatcher("/WEB-INF/views/demo.jsp").forward(request, response);
    }
}
