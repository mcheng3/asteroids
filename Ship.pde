<<<<<<< HEAD
class Ship extends Entity {

  Ship(float x, float y) {
    direction = 180;
    s = createShape();
    s.beginShape();
    s.fill(153);
    s.noStroke();
    s.vertex(0, -20);
    s.vertex(-20, 30);
    s.vertex(20, 30);
    s.endShape(CLOSE);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
=======
import sprites.*;
float shipSpeed, shipRot;
boolean[] keys;

class Ship extends Sprite {
  Ship(PApplet n, double x, double y) {
    super(n, "rocket.png", 0);
    setXY(x, y);
   keys = new boolean[4];
>>>>>>> b8bb8181df35c4c0f3dcec64e3aee6e5c8d1dc39
  }


  void decelerate(double value) {
    System.out.println("Speed: " + shipSpeed);
    if (shipSpeed > 0) {
      if (shipSpeed <= value) shipSpeed -= shipSpeed;
      else shipSpeed -= value;
      setSpeed(shipSpeed);
    }
    System.out.println("Speed2: " + shipSpeed);
    update();
  }

  void wrapAround() {
    if (player.getX() > 1024) {
      player.setX(0);
    }
    if (player.getX() < 0) {
      player.setX(1024);
    }
    if (player.getY() > 768) {
      player.setY(0);
    }
    if (player.getY() < 0) {
      player.setY(768);
    }
  }

<<<<<<< HEAD
  void update() {
    accelerate();
    location.add(velocity);
    if(location.x > width) location.x %= width;
    if(location.x < 0) location.x += width;
    if(location.y > height) location.y %= height;
    if(location.y < 0) location.y += width;
    
  }
  
  void accelerate() {
    //PVector temp = new PVector(cos(radians(direction)), sin(radians(direction)));
    PVector temp = new PVector(mouseX, mouseY);
    temp.sub(location);
    temp.setMag(.3);
    direction = degrees(temp.heading()) % 360;
    println(direction);
    velocity.add(temp);
    velocity.limit(3);
=======

  void move() {
    float change = 0;
    if (keys[1]) {
      change =  -0.08;
    }
    if (keys[3]) {
      change = 0.08;
    }
    shipRot += change;

    change = 0;
    if (keys[0]) {
      change = 1.5;
      shipSpeed += change;
    }

    if (keys[2]) {
      decelerate(1.5);
    }
    shipSpeed = constrain(shipSpeed, 0, 100);
    setRot(shipRot);
    setSpeed(shipSpeed, shipRot);


    update();
    System.out.println(getX() + " " + getY());
  }
  void keyPressed() {
    if (key == 'w') {
      keys[0] = true;
    }

    if (key == 'a') keys[1] = true;
    if (key == 's') keys[2] = true;
    if (key == 'd') keys[3] = true;
    //System.out.println(keys[0] + " " + keys[1]+ " " + keys[2]+ " " + keys[3]);
  }

  void keyReleased() {
    if (key == 'w') keys[0] = false;
    if (key == 'a') keys[1] = false;
    if (key == 's') keys[2] = false;
    if (key == 'd') keys[3] = false;
>>>>>>> b8bb8181df35c4c0f3dcec64e3aee6e5c8d1dc39
  }



  void update() {
    player.setXY(getX(), getY());
    player.update(0.0333);
  }
}