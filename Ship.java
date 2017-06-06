public class Ship extends Entity{
  
  public Ship(double x, double y){
    direction = 0;
    loc(x,y);
    vertices = new double[2][3];
    vertices = {{.5,0}, {.5, 120}, {.5, 240}};
    
  }


  public boolean isCollided(Entity other){
    return false;
  }
}