public abstract class Entity {
  private Coordinate location;
  private double direction;
  double[] vertices;
  double velX, velY;

  public abstract void accelerate;

  public abstract void changeDirection;
}