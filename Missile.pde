import sprites.*;
//sprite constructor references sketch, image name, and draw order

class Missile extends Sprite {
  int life = 60;

  //constructor references the screen, xy cor and the rotation the missle is in
  Missile(PApplet n, double x, double y, double rot) {
    super(n, "missile.png", 0);
    setXY(x, y);
    setRot(rot);
    setSpeed(350);
  }

  //wraps the missle around the screen
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

  //checks if its on screen, lowers life span, and then updates sketch
  void update() {
    wrapAround();
    if(life == 0)
      setVisible(false);
    else
      life --;
    setXY(getX(), getY());
    update(0.0333);
  }
}