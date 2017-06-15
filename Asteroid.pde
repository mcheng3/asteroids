import sprites.*;
//sprite constructor references sketch, image name, and draw order

class Asteroid extends Sprite {
  int level; //size of the rock. bigger level = smaller rock
  PApplet p; //reference to the sketch
  
  
  Asteroid(PApplet n, double x, double y, double rot, int level) {
    super(n, "asteroid.png", 0);
    this.level = level;
    p = n;
    
    //sets initial variables
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

  //updates the asteroid
  void update() {
    wrapAround();
    //roate a little
    setRot(getRot() + random(.01, .03));
    setXY(getX(), getY());
    update(0.0333);
  }


  //splits the asteroid into smaller ones
  ArrayList<Asteroid> split() {
    ArrayList<Asteroid> splitRocks = new ArrayList<Asteroid>();

    //removes original
    setVisible(false);

    //add new ones up to 3. less likely for 3
    for (int i = 0; i < random(35, 80) / 35; i ++)
      splitRocks.add(new Asteroid(p, getX() + random(-30, 30), getY() + random(-30, 30), getRot() + random(6.28), level+ 1));

    //makes each of the new rocks smaller
    for (Asteroid x : splitRocks)
      x.setScale(getScale() * 0.7);

    return splitRocks;
  }
}