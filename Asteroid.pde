import sprites.*;
class Asteroid extends Sprite {

  Asteroid(PApplet n, double x, double y, double rot) {
    super(n, "asteroid.png", 0);
    //Move if asteroid spawn on ship
    if(x > 420 && x< 610) x +=200;
    if(y > 280 && x< 480) y +=200;
    setXY(x, y);
    setRot(rot);
    setScale(0.25);
    setDirection(Math.random() * 6.28);
    setSpeed(100);
  }

  void wrapAround() {
  if(!isOnScreem()){
    if (getX() > 1024) {
      setX(0);
    }
    if (getX() < 0) {
      setX(1024);
    }
    if (getY() > 768) {
      setY(0);
    }
    if (getY() < 0) {
      setY(768);
    }}
  }

  void update() {
    wrapAround();
    setXY(getX(), getY());
    update(0.0333);
  }

  void accelerate() {
  }

  void changeDirection(float x) {
  }
}