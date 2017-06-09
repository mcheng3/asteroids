World world;


void setup() {
  size(1024, 768);
  background(0);
  world = new World();
}

void draw() {
  background (0);
  world.update();
  world.display();
}

/*
void keyPressed() {
  switch(key) {
  case 'w':
  case 'W':
    world.ship.accelerate();
    break;
  case 'a':
  case 'A':
    world.ship.changeDirection(-20);
    break;
  case 'd':
  case 'D':
    world.ship.changeDirection(20);
    break;
  }
}
*/