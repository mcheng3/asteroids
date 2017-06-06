public abstract class Entity implements Collidable {
  private Coordinate loc;
  double direction;
  double[][] vertices;
  double velX, velY;

  public void loc(double x, double y) {
    loc = new Coordinate(x,y);
  }
  
  public double getX(){
    return loc.getX();
  }
  public double getY(){
    return loc.getY();
  }
  
  public abstract void accelerate;

  public abstract void changeDirection;
}