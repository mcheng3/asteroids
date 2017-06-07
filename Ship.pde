public class Ship extends Entity{
  
  public Ship(int x, int y){
    direction = 0;
    loc = new Coordinate(x,y);
    vertices = new PVector[] {new PVector(x,y), new PVector(20+x, 50+y), new PVector(40+x, y)};
  }

  void setup(){
  }

  void draw(){
    triangle(vertices[0][0], vertices[0][1], vertices[1][0], vertices[1][1], vertices[2][0], vertices[2][1]);
    if(keyPressed){
      if(key == 'w'){
        vertices[0][1] += 1;
        vertices[1][1] += 1;
        vertices[2][1] += 1;
      }
      if(key == 's'){
        vertices[0][1] -= 1;
        vertices[1][1] -= 1;
        vertices[2][1] -= 1;
      }
      if(key == 'a'){
        vertices[0][0] += 1;
        vertices[1][0] += 1;
        vertices[2][0] += 1;
      }
      if(key == 'd'){
        vertices[0][0] -= 1;
        vertices[1][0] -= 1;
        vertices[2][0] -= 1;
      }
    }
  }

  public boolean isCollided(Entity other){
    return false;
  }
  public void accelerate(){
  }

  public void changeDirection(){
  }
}