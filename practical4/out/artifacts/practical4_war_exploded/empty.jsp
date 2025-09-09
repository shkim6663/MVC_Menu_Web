<%--
  Created by IntelliJ IDEA.
  User: kimsehyun
  Date: 2025. 9. 9.
  Time: 오후 7:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메뉴 안내</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .card-empty { padding: 2rem; border-radius: 1rem; background-color: #ffffff; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width:500px; margin:auto; margin-top:100px; text-align:center;}
        h2 { color: #495057; }
    </style>
</head>
<body>
<div class="card-empty">
    <h2>⚠️ 등록된 메뉴가 없습니다!</h2>
    <p>먼저 메뉴를 등록해주세요.</p>
    <a href="form.jsp" class="btn btn-primary me-2">메뉴 등록</a>
    <a href="index.jsp" class="btn btn-secondary">홈으로</a>
</div>
</body>
</html>

