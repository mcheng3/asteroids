public abstract class Entity implements Collidable{
  public Coordinate loc;
  public double direction;
  PVector[] vertices;
  double velX, velY;

  public abstract void accelerate();

  public abstract void changeDirection();
}