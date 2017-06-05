public abstract class Entity implements Collidable{
  private Coordinate loc;
  private double direction;
  double[][] vertices;
  double velX, velY;

  public abstract void accelerate;

  public abstract void changeDirection;
}