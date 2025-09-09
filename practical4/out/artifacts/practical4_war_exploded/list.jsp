<%--
  Created by IntelliJ IDEA.
  User: kimsehyun
  Date: 2025. 9. 9.
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, practical4.Menu, practical4.MenuService" %>
<%
    MenuService service = new MenuService();
    List<Menu> menus = service.getMenuList();
%>
<html>
<head>
    <title>등록된 메뉴</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        h2 { color: #495057; }
        .table thead { background-color: #343a40; color: white; }
        .card-list { padding: 2rem; border-radius: 1rem; background-color: #ffffff; box-shadow: 0 4px 6px rgba(0,0,0,0.1);}
    </style>
</head>
<body class="container mt-5">
<div class="card-list mx-auto" style="max-width:800px;">
    <h2 class="mb-4 text-center">📋 등록된 메뉴 목록</h2>

    <table class="table table-striped table-bordered text-center">
        <thead>
        <tr>
            <th>메뉴 이름</th>
            <th>맵기</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <% for(Menu m : menus) { %>
        <tr>
            <td><%= m.getName() %></td>
            <td><%= m.getSpiciness() %></td>
            <td><%= m.getPrice() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="form.jsp" class="btn btn-primary me-2">메뉴 추가</a>
        <a href="index.jsp" class="btn btn-secondary me-2">홈으로</a>
        <a href="menu?action=recommend" class="btn btn-warning">랜덤 추천</a>
    </div>
</div>
</body>
</html>
