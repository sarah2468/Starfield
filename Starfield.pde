//your code here

Particle[] aBunch;
void setup()
{
  aBunch = new Particle[1000];
  
  //your code here
  size(500, 500);
  for(int i = 0; i < aBunch.length; i++){
    aBunch[i] = new NormalParticle();
  }
    aBunch[0] = new OddballParticle();
    aBunch[1] = new JumboParticle();

}

void draw()
{
  //your code here
  background(0);
  for(int i = 0; i < aBunch.length; i++){
    aBunch[i].move();
    aBunch[i].show();
  }
}

class NormalParticle implements Particle
{
  double myX, myY, myDir, Speed;
  int myColor;
  float size;
  //your code here
  NormalParticle(){
   myX = 250;
   myY = 250;
   myDir = Math.random()*(2*PI);
   myColor = 255;
   Speed = Math.random()*5+2;
   size = (float)(Math.random()*3);
  }
  
  public void move(){
    myX += Speed*Math.cos(myDir);
    myY += Speed*Math.sin(myDir);
  }
  public void show(){
    noStroke();
    ellipse((float)myX, (float)myY, size, size);
  }
  public void reset(){
  myX = 250;
  myY = 250;
  myDir = Math.random()*(2*PI);
  Speed = Math.random()*5;
  }
}

interface Particle //listoffunctionstheyhaveincommon
{
  //your code here
  public void show();
  public void move();
  public void reset();
}
class OddballParticle implements Particle//uses an interface
{
  //your code here
double myX, myY;
double myDir, Speed;
OddballParticle()
{
  myX = 250;
  myY = 250;
  myDir = Math.random()/(2*PI);
  Speed = Math.random()*2;
  
}
public void move()
{
  myX -= Speed*Math.cos(myDir);
  myY -= Speed*Math.sin(myDir);
}
public void show()
{
  fill(255);
  noStroke();
  rect((int)myX, (int)myY, 8, 8);
}
public void reset()
{
  myDir = Math.random()*(2*PI);
   Speed = Math.random()*2;
   myX = 250;
   myY = 250;
}
}
class JumboParticle extends NormalParticle //uses inheritance
{
  //your code here
    public void show(){
    noStroke();

    ellipse((float) myX, (float) myY, 15, 15);
    ellipse((float) myY, (float) myX, 15, 15);
  }
}
void mousePressed(){
  for(int i = 0; i < aBunch.length; i++){
    aBunch[i].reset();
  }
}