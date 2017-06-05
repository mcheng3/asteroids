public class Ship extends Entity{
  
  public Ship(int x, int y){
    direction = 0;
    loc = new Coordinate(x,y);
    vertices = {{.5,0}, {.5, 120}, {.5, 240}};
    
  }


  public boolean isCollided(Entity other){
    return false;
  }
}