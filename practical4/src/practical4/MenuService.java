package practical4;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MenuService {
    private static final List<Menu> menuList = new ArrayList<>();
    private static final Random random = new Random();

    public void addMenu(Menu menu) { menuList.add(menu); }

    public List<Menu> getMenuList() { return menuList; }

    public Menu getRandomMenu() {
        if(menuList.isEmpty()) return null;
        return menuList.get(random.nextInt(menuList.size()));
    }
}
