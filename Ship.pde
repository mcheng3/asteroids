class Ship extends Entity {

  Ship(float x, float y) {
    direction = 180;
    s = createShape();
    s.beginShape();
    s.fill(153);
    s.noStroke();
    s.vertex(0, 0);
    s.vertex(-20, 50);
    s.vertex(20, 50);
    s.endShape(CLOSE);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
  }


  public boolean isCollided(Entity other) {
    return false;
  }

  void display() {
    shape(s, location.x, location.y);
  }

  void update() {
    location.add(velocity);
    if(location.x > width) location.x %= width;
    if(location.x < 0) location.x += width;
    if(location.y > height) location.y %= height;
    if(location.y < 0) location.y += height;
    
  }
  
  void accelerate() {
    PVector temp = new PVector(cos(radians(direction)), sin(radians(direction)));
    temp.setMag(.3);
    velocity.add(temp);
    velocity.limit(1.5);
  }

  void changeDirection(float x) {
    direction += x;
  }
}