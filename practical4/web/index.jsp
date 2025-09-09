<%--
  Created by IntelliJ IDEA.
  User: kimsehyun
  Date: 2025. 9. 9.
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>점심 메뉴 추천</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        h1 { font-weight: bold; color: #343a40; }
        .btn-lg { font-size: 1.2rem; }
        .card-home { padding: 2rem; border-radius: 1rem; background-color: #ffffff; box-shadow: 0 4px 6px rgba(0,0,0,0.1);}
    </style>
</head>
<body class="container mt-5">
<div class="card-home text-center mx-auto" style="max-width:600px;">
    <h1>🍴 점심 메뉴 추천</h1>
    <p class="text-muted mb-4">메뉴를 등록하고, 목록을 확인하거나 랜덤 추천받아보세요!</p>

    <div class="d-grid gap-3">
        <a href="form.jsp" class="btn btn-primary btn-lg">메뉴 등록</a>
        <!-- MenuController 거치도록 수정 -->
        <a href="menu" class="btn btn-success btn-lg">등록된 메뉴 목록</a>
        <a href="menu?action=recommend" class="btn btn-warning btn-lg">랜덤 추천</a>
    </div>
</div>
</body>
</html>


