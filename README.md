**# MVC_Menu_Web
Servlet과 JSP를 활용해 MVC 패턴 기반의 점심 메뉴 추천 웹앱을 구현**

**1. 시연영상**
   
   
   [![영상 보기](https://img.youtube.com/vi/oZkq03Pzh6c/0.jpg)](https://youtu.be/oZkq03Pzh6c)

**2.점심 메뉴 등록 폼 페이지 구성**

form.jsp(점심 메뉴 등록 폼페이지)

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

**3.메뉴 등록 요청 처리 **

1)MenuController.java(등록 처리 부분)
                  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지

    // 사용자가 form.jsp에서 입력한 값 꺼내기
    String name = request.getParameter("name");
    int spiciness = Integer.parseInt(request.getParameter("spiciness"));
    int price = Integer.parseInt(request.getParameter("price"));

    // Menu 객체 생성
    Menu menu = new Menu(name, spiciness, price);

    // Service에 저장
    service.addMenu(menu);

    // 등록 후 메뉴 목록 페이지로 이동
    response.sendRedirect("menu");  // list.jsp 직접 접근 대신 반드시 서블릿으로 이동
    }


2)MenuService.java

    public class MenuService {
    private static final List<Menu> menuList = new ArrayList<>();
    private static final Random random = new Random();

    // 메뉴 등록
    public void addMenu(Menu menu) {
        menuList.add(menu);
    }

    // 메뉴 목록 조회
    public List<Menu> getMenuList() {
        return menuList;
    }

    // 랜덤 추천
    public Menu getRandomMenu() {
        if (menuList.isEmpty()) return null;
        return menuList.get(random.nextInt(menuList.size()));
    }
    }

**4.메뉴 목록 조회 페이지**

list.jap

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    <head>
    <title>메뉴 목록</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">
    <h2 class="mb-4">등록된 메뉴 목록</h2>

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>메뉴 이름</th>
            <th>맵기 (1~5)</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="menu" items="${menus}">
            <tr>
                <td>${menu.name}</td>
                <td>${menu.spiciness}</td>
                <td>${menu.price} 원</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="index.jsp" class="btn btn-secondary">뒤로가기</a>
    </body>
    </html>

**5.랜덤 추천 기능**


1)MenuService.java(랜덤 추천기능)
      
    public Menu getRandomMenu() {
    if (menuList.isEmpty()) return null; // 등록된 메뉴가 없을 때
    return menuList.get(random.nextInt(menuList.size())); // 랜덤으로 하나 뽑기
    }

2)MenuController.java(랜덤 추천 요청 처리)


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

    List<Menu> menus = service.getMenuList();

    // 메뉴가 없을 때는 안내 페이지로
    if (menus.isEmpty()) {
        response.sendRedirect("empty.jsp");
        return;
    }

    if ("recommend".equals(action)) {
        // 랜덤 추천
        Menu randomMenu = service.getRandomMenu();
        request.setAttribute("menu", randomMenu);
        request.getRequestDispatcher("recommend.jsp").forward(request, response);

    } else {
        // 목록 조회
        request.setAttribute("menus", menus);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
    }


3)recommend.jsp(랜덤 추천 결과 보여주기)

    <%@ page contentType="text/html;charset=UTF-8" language="java" %> 
    <html>
    <head>
    <title>랜덤 메뉴 추천</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">
    <h2 class="mb-4">오늘의 추천 메뉴 🍽️</h2>

    <div class="card p-4 shadow-sm">
        <h4 class="mb-3">추천 메뉴: <strong>${menu.name}</strong></h4>
        <p>맵기: ${menu.spiciness}</p>
        <p>가격: ${menu.price} 원</p>
    </div>

    <div class="mt-4">
        <a href="menu?action=recommend" class="btn btn-primary">다시 추천받기</a>
        <a href="index.jsp" class="btn btn-secondary">메인으로</a>
    </div>
    </body>
    </html>


6.등록된 메뉴가 없을때 안내 페이지로 연결 시키기

1)MenuController.java(메뉴 없을 때 분기 처리)

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

    List<Menu> menus = service.getMenuList();

    // ✅ 메뉴가 하나도 없으면 안내 페이지로 리다이렉트
    if (menus.isEmpty()) {
        response.sendRedirect("empty.jsp");
        return;
    }

    if ("recommend".equals(action)) {
        // 랜덤 추천
        Menu randomMenu = service.getRandomMenu();
        request.setAttribute("menu", randomMenu);
        request.getRequestDispatcher("recommend.jsp").forward(request, response);

    } else {
        // 메뉴 목록 조회
        request.setAttribute("menus", menus);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
    }

2)empty.jsp(안내페이지)

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
    <title>메뉴 없음</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    </head>
    <body class="container text-center mt-5">
    <h2 class="mb-4 text-danger">등록된 메뉴가 없어요! 😢</h2>
    <p>먼저 메뉴를 등록해주세요.</p>

    <a href="form.jsp" class="btn btn-primary mt-3">메뉴 등록하기</a>
    <a href="index.jsp" class="btn btn-secondary mt-3">메인으로 돌아가기</a>
    </body>
    </html>

