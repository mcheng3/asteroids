import sprites.*;
import java.lang.Math;

World world;
Ship player;
int xPos, lives;
Asteroid x;
boolean gameOver;

void setup() {
  gameOver = false;
  lives = 3;
  size(1024, 768);
  background(0);
  world = new World();
  player = new Ship(this, 512, 384);
  x= new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28);
}

void draw() {
  System.out.println("lives: " + lives);
  if (lives >= 0) {
    background (0);
    collision();
    x.draw();
    x.update();
    player.draw();
    player.move();
    player.rotate();
    player.wrapAround(); 

    player.shoot(player.getX(), player.getY(), player.getRot());
    player.updateMissiles(x);
    player.decelerate(1);
    player.update(0.0333);
  } 
  else {
    background(0);
    textSize(100);
    text("Game Over", 250, 384);
  }
}

void collision() {
  if (player.pp_collision(x)) {
    reset();
  } 
}

void reset() {
  player = new Ship(this, 512, 384);
  lives--;
}

void keyPressed() {
  player.keyPressed();
}


void keyReleased() {
  player.keyReleased();
}