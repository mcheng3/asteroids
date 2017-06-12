import sprites.*;
import java.util.ArrayList;
float shipSpeed, shipRot;
PApplet p;
boolean[] keys;
int points;
ArrayList<Missile> missiles = new ArrayList<Missile>();
int time = 0;


class Ship extends Sprite {
  Ship(PApplet n, double x, double y) {
    super(n, "rocket.png", 0);
    setXY(x, y);
    p = n;
    keys = new boolean[5];
  }


  void decelerate(double value) {
    //////System.out.println("Speed: " + shipSpeed);
    if (shipSpeed > 0) {
      if (shipSpeed <= value) shipSpeed -= shipSpeed;
      else shipSpeed -= value;
      setSpeed(shipSpeed);
    }
    ////////System.out.println("Speed2: " + shipSpeed);
    update(this);
  }

  void wrapAround() {
    if (getX() > 1024) {
      setX(0);
    }
    if (getX() < 0) {
      setX(1024);
    }
    if (getY() > 768) {
      setY(0);
    }
    if (getY() < 0) {
      setY(768);
    }
  }

  /*
  void update(this) {
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
   */

  void rotate() {
    float change = 0;
    if (keys[1]) {
      change =  -0.05;
    }
    if (keys[3]) {
      change = 0.05;
    }
    shipRot += change;
    setRot(shipRot);
    update(this);
    ////////System.out.println("Rot: "+ getRot());
  }

  void accelerate() {
    time -= 1;
    double change = 0;
    if (keys[0]) {
      change = 2;
      shipSpeed += change;
      shipSpeed = constrain(shipSpeed, 0, 70);
      setAcceleration(shipSpeed, shipRot);
    }


    shipSpeed = constrain(shipSpeed, 0, 70);

    setSpeed(shipSpeed, getDirection());


    update(this);
    //////System.out.println(getX() + " " + getY());
  }


  void keyPressed() {
    if (key == 'w') keys[0] = true;
    if (key == 'a') keys[1] = true;
    if (key == 's') keys[2] = true;
    if (key == 'd') keys[3] = true;
    if (key == ' ') keys[4] = true;

    ////////System.out.println(keys[0] + " " + keys[1]+ " " + keys[2]+ " " + keys[3]);
  }


  void keyReleased() {
    if (key == 'w') keys[0] = false;
    if (key == 'a') keys[1] = false;
    if (key == 's') keys[2] = false;
    if (key == 'd') keys[3] = false;
    if (key == ' ')keys[4] = false;
  }
  ArrayList<Asteroid> updateMissiles(Asteroid rock) {
    ArrayList<Asteroid> additions = new ArrayList<Asteroid>();
    ArrayList<Missile> trash = new ArrayList<Missile>();
    for (Missile each : missiles) {
      if(!each.isVisible()){
        trash.add(each);
      }
      each.draw();
      each.update();
      if (each.pp_collision(rock)) {
        if(rock.getLevel() < 3){
          additions.addAll(rock.split());
          rock.setVisible(false);
        }
        else rock.setVisible(false);
        points +=50;
      }
     
      
    }
    missiles.removeAll(trash);
    return additions;
  }

  
  int getPoints(){
    return points;
  }
  void setPoints(int n){
    points = n;
  }
  
  void update(Sprite s) {   
    s.setXY(s.getX(), s.getY());
    update(0.0333);
    
  }

  void shoot(double x, double y, double theta) {
    if (time < 0) {
      if (keys[4]) {
        //////System.out.println("SHOOT");
        missiles.add(new Missile(p, x, y, theta));
        time = 14;
      }
    }
  }
}