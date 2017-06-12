import sprites.*;
class Missile extends Sprite {

  Missile(PApplet n, double x, double y, double rot) {
    super(n, "missile.png", 0);
    setXY(x, y);
    setRot(rot);
    setSpeed(600);

  }
  
  
  void update() {
    setXY(getX(), getY());
    update(0.01);
  }

}