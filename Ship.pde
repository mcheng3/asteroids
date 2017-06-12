import sprites.*;
//sprite constructor references sketch, image name, and draw order
import java.util.ArrayList;


class Ship extends Sprite {
  PApplet p;
  float shipSpeed, shipRot;
  boolean[] keys = new boolean[5]; //[w a s d space]  //what keys are pressed (s not used)
  int points;
  ArrayList<Missile> missiles = new ArrayList<Missile>(); //array of the missles you shoot
  int time = 0; //cooldown of missle

  //constructor references sketcch, xy cor, and current points
  Ship(PApplet n, double x, double y, int points) {
    super(n, "rocket.png", 0);
    setXY(x, y);
    p = n;
    this.points = points;
  }


  // lowers ship speed by a value
  void decelerate(double value) {
    shipSpeed -= value;
    if (shipSpeed < 0)
      shipSpeed = 0;
    setSpeed(shipSpeed);
    update(.0333);
  }

  //speeds up ship by 2 if w is pressed
  void accelerate() {
    if (keys[0]) {
      shipSpeed += 2;
      shipSpeed = constrain(shipSpeed, 0, 70);
      setAcceleration(shipSpeed, shipRot);
      shipSpeed = constrain(shipSpeed, 0, 70);
    }

    setSpeed(shipSpeed, shipRot);
    update(.0333);
    //println(getX() + " " + getY());

  }



  //wraps the ship around the board
  void wrapAround() {
    if (!isOnScreem()) {
      if (getX() > 1024)
        setX(0);
      if (getX() < 0)
        setX(1024);
      if (getY() > 768)
        setY(0);
      if (getY() < 0)
        setY(768);
    }
  }

  //checks if the player is rotating the ship
  void rotate() {
    float change = 0;
    //keys for changing rotation
    if (keys[1])
      change =  -0.05;
    if (keys[3])
      change = 0.05;
    shipRot += change;
    setRot(shipRot);
    update(.0333);
    //println("Rot: "+ getRot());
  }

  //records the pressed keys

  void keyPressed() {
    if (key == 'w') keys[0] = true;
    if (key == 'a') keys[1] = true;
    if (key == 's') keys[2] = true;
    if (key == 'd') keys[3] = true;
    if (key == ' ') keys[4] = true;
  }
  void keyReleased() {
    if (key == 'w') keys[0] = false;
    if (key == 'a') keys[1] = false;
    if (key == 's') keys[2] = false;
    if (key == 'd') keys[3] = false;
    if (key == ' ')keys[4] = false;
  }


  //checks each missles around a rock
  ArrayList<Asteroid> updateMissiles(Asteroid rock) {
    ArrayList<Asteroid> additions = new ArrayList<Asteroid>();
    ArrayList<Missile> trash = new ArrayList<Missile>();

    //check if missle is visible
    for (Missile x : missiles) {
      if (!x.isVisible()) {
        trash.add(x);
      }

      //check if it collides with a rock
      if (x.pp_collision(rock)) {
        //split rock if big enough and then kill collided objects
        if (rock.level < 3) {
          additions.addAll(rock.split());
        }
        rock.setVisible(false);
        x.setVisible(false);
        trash.add(x);
        points +=50;

        //stop checking if other missles collide with this rock
        break;
      }
    }

    //remove the missles add the extra rocks
    missiles.removeAll(trash);
    return additions;
  }




  //shoot a missle in said location and direction and set a cooldown on shooting
  void shoot(double x, double y, double theta) {
    if (time < 0)
      if (keys[4]) {
        missiles.add(new Missile(p, x, y, theta));
        time = 13;
      }
  }
}
