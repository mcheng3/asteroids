public abstract class Entity implements Collidable {
  float  direction;
  PShape s;
  PVector location;
  PVector velocity;

  public abstract void accelerate();

  public abstract void changeDirection(float x);
}