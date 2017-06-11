import sprites.*;
float shipSpeed, shipRot;
boolean isW, isA, isS, isD = false;

class Ship extends Sprite {
  Ship(PApplet n, double x, double y) {
    super(n, "rocket.png", 0);
    setXY(x, y);
  }


  void decelerate(double value) {
    System.out.println("Speed: " + shipSpeed);
    if (shipSpeed > 0) {
      if(shipSpeed <= value) shipSpeed -= shipSpeed;
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


  void move() {
    float change = 0;
    if (isA) {
      change =  -0.05;
       shipRot += change;
    setRot(shipRot);
    }
    if (isD) {
      change = 0.05;
       shipRot += change;
    setRot(shipRot);
    }

    change = 0;
    if (isW) {
      change = 5;
      shipSpeed += change;

    setSpeed(shipSpeed, shipRot);
    }
    if (isS) {
      decelerate(2.1);
    }
    

    update();
    System.out.println(getX() + " " + getY());
  }
  void keyPressed() {
    if (key == 'w') isW = true;
    if (key == 'a') isA = true;
    if (key == 's') isS = true;
    if (key == 'd') isD = true;
  }

  void keyReleased() {
    if (key == 'w') isW = false;
    if (key == 'a') isA = false;
    if (key == 's') isS = false;
    if (key == 'd') isD = false;
  }



  void update() {
    player.setXY(getX(), getY());
    player.update(0.0333);
  }
}