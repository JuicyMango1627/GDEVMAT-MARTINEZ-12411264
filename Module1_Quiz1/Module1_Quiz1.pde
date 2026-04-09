void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(255);
  
  cartesianPlane();
  numberOne();
  numberTwo();
  numberThree();
}

void cartesianPlane()
{
 
  color black = color(0, 0, 0);
  stroke(black);
  
  strokeWeight(1);
  
  line(640, 0, -640, 0);
  line(0, 360, 0, -360);
 
 for (int i = -620; i <= 620; i+= 10)
 {
   line(i, -5, i, 5);
   line(-5, i, 5, i);
 }
  
}

void numberOne()
{
  //f(x) = x^2 - 15x - 3
  
  color yellow = color(250, 255, 3);
  fill(yellow);
  noStroke();
  
  strokeWeight(1);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, (float)Math.pow(x, 2) - (15 * x) - 3 , 3);
  }
}

void numberTwo()
{
  //f(x) = -5x + 30
  
  color purple = color(136, 3, 255);
  fill(purple);
  noStroke();
  
  for (float x = -300; x <= 300; x++)
  {
    circle(x, (-5 * x) + 30, 3);
  }
}

void numberThree()
{
  color red = color(255, 0, 0);
  fill(red);
  noStroke();
  
  float amplitude = 50;
  float frequency = 0.05;
  
   for (int x = -300; x <= 300; x++) 
   {
    circle(x , (amplitude * (float)Math.sin(x * frequency)), 3);
   }
}
