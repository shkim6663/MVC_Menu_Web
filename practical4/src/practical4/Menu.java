package practical4;

public class Menu {
    private String name;
    private int spiciness;
    private int price;

    public Menu(String name, int spiciness, int price) {
        this.name = name;
        this.spiciness = spiciness;
        this.price = price;
    }

    public String getName() { return name; }
    public int getSpiciness() { return spiciness; }
    public int getPrice() { return price; }
}
