package practical4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuController extends HttpServlet {
    private final MenuService service = new MenuService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        int spiciness = Integer.parseInt(request.getParameter("spiciness"));
        int price = Integer.parseInt(request.getParameter("price"));

        service.addMenu(new Menu(name, spiciness, price));
        response.sendRedirect("list.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        List<Menu> menus = service.getMenuList();

        if (menus.isEmpty()) {
            response.sendRedirect("empty.jsp");
            return;
        }

        if ("recommend".equals(action)) {
            Menu randomMenu = service.getRandomMenu();
            request.setAttribute("menu", randomMenu);
            request.getRequestDispatcher("recommend.jsp").forward(request, response);

        } else {
            request.setAttribute("menus", menus);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        }
    }
}
