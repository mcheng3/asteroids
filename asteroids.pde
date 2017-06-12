import sprites.*;
import java.lang.Math;
import java.util.ArrayList;

Ship player;
int xPos, lives;
ArrayList<Asteroid> rocks;
boolean gameOver;
int score;

void setup() {

  score = 0;

  rocks = new ArrayList<Asteroid>();
  gameOver = false;
  lives = 2;
  size(1024, 768);
  background(0);
  player = new Ship(this, 512, 384);
  player.setPoints(0);
  rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
  rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
  rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
  rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
  rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
}

void draw() {

  if (rocks.size() == 0) {
    rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
    rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
    rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
    rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
    rocks.add( new Asteroid(this, Math.random() * 1024, Math.random() * 768, Math.random() * 6.28, 1));
  }

  System.out.println("lives: " + lives);
  if (lives >= 0) {
    background (0);
    textSize(40);
    text(score, 10, 50);
    text("Lives:" + lives, 300, 50);
    drawAsteroids();
    player.draw();
    player.accelerate();
    player.rotate();
    player.wrapAround(); 

    player.shoot(player.getX(), player.getY(), player.getRot());

    player.decelerate(1);
    player.update(0.0333);
  } else {
    background(0);
    textSize(100);
    text("Game Over", 250, 384);
    textSize(50);
    text("NO MORE LIVES", 320, 284);
    text("Press 'h' to play again", 250, 450);
    textSize(40);
    text(score, 10, 50);
    if (keyPressed) {
      if (key == 'h') {
        setup();
      }
    }
  }
}

void drawAsteroids() {
  ArrayList<Asteroid> trash = new ArrayList<Asteroid>();
  ArrayList<Asteroid> additions = new ArrayList<Asteroid>();
  for (Asteroid each : rocks) {
    each.draw();
    each.update();
    collision(each);
    score = player.getPoints();
    additions.addAll(player.updateMissiles(each));
    player.updateMissiles(each);
    if(!each.isVisible()){
      trash.add(each);
    }
  }
  rocks.removeAll(trash);
  rocks.addAll(additions);
}

void collision(Asteroid x) {
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