//gets sprite library and arraylists
import sprites.*;
import java.util.ArrayList;

//what you control
Ship player;
//what is displayed
int lives;
//when you lose
boolean gameOver;
//what the 'enemies" are
ArrayList<Asteroid> rocks;


void setup() {

  //variable initialization
  rocks = new ArrayList<Asteroid>();
  gameOver = false;
  lives = 2;
  size(1024, 768);
  background(0);

  //spawn player at center
  player = new Ship(this, 512, 384, 0);

  //add 5 random rocks (away from center)
  rocks.add(new Asteroid(this, random(0, 420), random(480, 768), random(6.28), 1));
  rocks.add(new Asteroid(this, random(0, 420), random(0, 280), random(6.28), 1));
  rocks.add(new Asteroid(this, random(610, 1024), random(480, 768), random(6.28), 1));
  rocks.add(new Asteroid(this, random(610, 1024), random(480, 768), random(6.28), 1));
  rocks.add(new Asteroid(this, random(610, 1024), random(0, 280), random(6.28), 1));
}

void draw() {
  //ruthlessly spawn in more rocks after you kill them all
  if (rocks.size() == 0) {
    rocks.add(new Asteroid(this, random(1024), random(768), random(6.28), 1));
    rocks.add(new Asteroid(this, Math.random() * 1024, random(768), random(6.28), 1));
    rocks.add(new Asteroid(this, Math.random() * 1024, random(768), random(6.28), 1));
    rocks.add(new Asteroid(this, Math.random() * 1024, random(768), random(6.28), 1));
    rocks.add(new Asteroid(this, Math.random() * 1024, random(768), random(6.28), 1));
  }

  //println("lives: " + lives);
  if (lives >= 0) {
    //still alive -> redraw board
    //text
    background (0);
    textSize(40);
    text(player.points, 10, 50);
    text("Lives:" + lives, 300, 50);

    //redraw rocks
    drawAsteroids();

    //redraw player and other stuff
    player.accelerate();
    player.rotate();
    player.wrapAround();
    player.time -= 1;
    player.decelerate(1);
    player.draw();
    player.update(0.0333);

    //see if player shot
    player.shoot(player.getX(), player.getY(), player.getRot());

    //update missles
    for (Missile x : player.missiles) {
      x.draw();
      x.update();
    }
  } else {
    //you died -> display death screen
    background(0);
    textSize(100);
    text("Game Over", 250, 384);
    textSize(50);
    text("NO MORE LIVES", 320, 284);
    text("Press 'h' to play again", 250, 450);
    textSize(40);
    text(player.points, 10, 50);

    //wait for restart
    if (keyPressed) {
      if (key == 'h') {
        setup();
      }
    }
  }
}

//checks for each asteroid
void drawAsteroids() {
  ArrayList<Asteroid> trash = new ArrayList<Asteroid>();
  ArrayList<Asteroid> additions = new ArrayList<Asteroid>();

  for (Asteroid each : rocks) {
    //draw it
    each.draw();
    each.update();
    
    //missiles hit it
    additions.addAll(player.updateMissiles(each));
    
    //player hits it
    if (player.pp_collision(each)) {
      //delete both, respawn player
      if (each.level < 3) {
        additions.addAll(each.split());
      }
      each.setVisible(false);
      trash.add(each);
      respawn();
    }
    
    //delete non visible ones
    if (!each.isVisible()) {
      trash.add(each);
    }
  }
  
  //updates array of rocks
  rocks.removeAll(trash);
  rocks.addAll(additions);
}


//player repawn at center
void respawn() {
  player = new Ship(this, 512, 384, player.points);
  lives--;
}


//passes key presses to ship
void keyPressed() {
  player.keyPressed();
}
void keyReleased() {
  player.keyReleased();
}