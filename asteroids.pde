import sprites.*;
import java.util.HashSet;

World world;
Ship player;
int xPos;


void setup() {
  size(1024, 768);
  background(0);
  world = new World();
  player = new Ship(this, 512, 384);
}

void draw() {
  background (200);
    player.move();

  player.wrapAround();
  player.draw();
  
  player.decelerate(1);
  

  player.update(0.0333);
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased(){
  player.keyReleased();
}