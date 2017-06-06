public class Ship extends Entity{
  
  public Ship(int x, int y){
    direction = 0;
    loc = new Coordinate(x,y);
    vertices = new float[][] {{500+x,30+y}, {520+x, 80+y}, {540+x, 30+y}};
    
  }

  void setup(){
  }

  void draw(){
    triangle(vertices[0][0], vertices[0][1], vertices[1][0], vertices[1][1], vertices[2][0], vertices[2][1]);
  }

  public boolean isCollided(Entity other){
    return false;
  }
  public void accelerate(){
  }

  public void changeDirection(){
  }
}