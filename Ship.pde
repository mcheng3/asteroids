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
  }


  public boolean isCollided(Entity other) {
    return false;
  }

  void display() {
    shape(s, location.x, location.y);
  }

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
  }

  void changeDirection(float x) {
    direction += x;
  }
}