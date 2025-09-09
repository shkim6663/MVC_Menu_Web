<%--
  Created by IntelliJ IDEA.
  User: kimsehyun
  Date: 2025. 9. 9.
  Time: 오후 6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="practical4.Menu" %>
<%
    Menu menu = (Menu) request.getAttribute("menu");
%>
<html>
<head>
    <title>랜덤 추천</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .card-recommend { padding: 2rem; border-radius: 1rem; background-color: #ffffff; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width:600px; margin:auto; }
        .alert { font-size: 1.2rem; }
        h2 { text-align: center; color: #495057; }
        .btn-lg { font-size: 1.1rem; }
    </style>
</head>
<body class="container mt-5">
<div class="card-recommend">
    <h2 class="mb-4">🎲 랜덤 메뉴 추천</h2>

    <% if(menu != null) { %>
    <div class="alert alert-success text-center">
        <strong><%= menu.getName() %></strong> 🍲<br>
        맵기: <%= menu.getSpiciness() %> / 가격: <%= menu.getPrice() %>원
    </div>
    <% } %>

    <div class="text-center mt-4">
        <a href="menu?action=recommend" class="btn btn-warning me-2">다시 추천</a>
        <a href="index.jsp" class="btn btn-secondary me-2">홈으로</a>
        <a href="form.jsp" class="btn btn-primary">메뉴 추가</a>
    </div>
</div>
</body>
</html>
