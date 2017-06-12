import sprites.*;

class Asteroid extends Sprite {
  int level;
  PApplet p;
  Asteroid(PApplet n, double x, double y, double rot, int level) {
    super(n, "asteroid.png", 0);
    this.level = level;
    p = n;
    //Move if asteroid spawn on ship
    if (x > 420 && x< 610) x +=200;
    if (y > 280 && x< 480) y +=200;
    setXY(x, y);
    setRot(rot);
    setScale(0.25);
    setDirection(random(6.28));
    setSpeed(70);
  }

  //wraps the rock around the screen
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

  void update() {
    wrapAround();
    setXY(getX(), getY());
    update(0.0333);
  }

  void accelerate() {
  }

  int getLevel() {
    return level;
  }

  ArrayList<Asteroid> split() {
    ArrayList<Asteroid> splitRocks = new ArrayList<Asteroid>();
    setVisible(false);
    splitRocks.add(new Asteroid(p, getX() - 100, getY(), getRot() - 0.6, level+ 1));
    splitRocks.add(new Asteroid(p, getX(), getY(), getRot(), level + 1));
    splitRocks.get(0).setScale(getScale() * 0.7);
    splitRocks.get(1).setScale(getScale() * 0.7);
    return splitRocks;
  }
}