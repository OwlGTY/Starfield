Particle[] stars = new Particle[450]; //forms the rocket particles.
PImage soldier; //Soldier variable, which is my Oddball.

void setup() //establishes the array.
{
  size(500, 500);
  background(102, 255, 255);
  for (int i = 0; i < stars.length; i ++ ) { 
    stars[i] = new Particle();
    stars[0] = new OddballParticle();
  }
  soldier = loadImage("tf2soldier.png"); //associates variable with image of soldier.
}
void draw()//Allows the array to move and show.
{
  background(102, 255, 255);
  for (int i = 0; i < stars.length; i++) { 
    stars[i].move();
    stars[i].show();
  }
  fill(102, 51, 0); //Establishing the ground where you rocket jump off of.
  rect(0,400,500,100);
}

class Particle //Rocket particles setup.
{
  double x, y, speed, angle;
  int Color;
  
  Particle(){
    x = 250;
    y = 400;
    speed = (Math.random()*4)+2;
    angle = (Math.random()*Math.PI)+Math.PI; //The explosion only appears in a crescent shape in contrast to a full circle, so it looks like the rocket explodes off the ground.
    Color = color((int)(Math.random()*20)+230, (int)(Math.random()*70)+140, (int)(Math.random()*100)); //Orangish color for the explosion.
  }
  void move() {
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
      if (mousePressed) { //Resets the explosion back to the origin point once the mouse is clicked.
      x = 250;
      y = 400;
      }
  }
  void show() {//Shows the explosion particles.
    fill(Color);
    noStroke();
    ellipse((float)x, (float)y, 5, 5);
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    y = 325; //Reestablish variable y to this to appropriately place the soldier in the center on the ground.
  }
  void move() {//Soldier's movement, with the speed subtracted only to not fatigue him so much from the original value.
    x=x+Math.cos(angle)*speed-2;
    y=y+Math.sin(angle)*speed-2;
    if (mousePressed) {//Resets the soldier to the origin point once the mouse is clicked.
      x = 250;
      y = 325;
     }
    }
  void show() {//Shows the image of the soldier.
    image(soldier, (float)x, (float)y, 75, 75);
  }
}
