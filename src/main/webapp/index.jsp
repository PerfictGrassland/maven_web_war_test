<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.sendRedirect(request.getContextPath() + "/demo");
%>

src/main/webapp/index.jsp 是应用的默认入口页。访问应用根地址（例如 http://localhost:8080/mvweb001/`）时，Tomcat 通常会自动打开 index.jsp`。
目前它执行 sendRedirect，把浏览器重定向到 /demo，所以根地址会进入商品示例页。重定向会让浏览器再发起一次请求，地址栏也会变成 /demo。
