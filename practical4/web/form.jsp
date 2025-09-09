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
    <title>메뉴 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        h2 { color: #495057; }
        .card-form { padding: 2rem; border-radius: 1rem; background-color: #ffffff; box-shadow: 0 4px 6px rgba(0,0,0,0.1);}
    </style>
</head>
<body class="container mt-5">
<div class="card-form mx-auto" style="max-width:700px;">
    <h2 class="mb-4 text-center">🍱 메뉴 등록</h2>

    <form action="menu" method="post" class="row g-3">
        <div class="col-md-6">
            <label class="form-label">메뉴 이름</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="col-md-3">
            <label class="form-label">맵기 (1~10)</label>
            <input type="number" name="spiciness" min="1" max="10" class="form-control" required>
        </div>
        <div class="col-md-3">
            <label class="form-label">가격</label>
            <input type="number" name="price" class="form-control" required>
        </div>
        <div class="col-12 mt-3 text-center">
            <button type="submit" class="btn btn-primary btn-lg me-2">등록</button>
            <a href="index.jsp" class="btn btn-secondary btn-lg">홈으로</a>
        </div>
    </form>
</div>
</body>
</html>
