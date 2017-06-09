import java.util.ArrayList;

public class World {
  Ship ship;
  ArrayList rocks, missles;

  World() {
    ship = new Ship(width / 2, height / 2);
  }


  void update() {
    ship.update();
  }

  void display() {
    ship.display();
  }
}      