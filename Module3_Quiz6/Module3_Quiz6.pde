void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size (1280, 720, P3D);
}

PVector mousePos()
{
    float x = mouseX - Window.windowWidth;
    float y = -(mouseY - Window.windowHeight);
    
    return new PVector(x, y);
}

void draw()
{
  PVector mouse = mousePos();
  
  background(70);
  
  //normalize length
  mouse.normalize().mult(350);
  
  //red outline
  strokeWeight(8);
  stroke(255, 0, 0);
  
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  //white core
  strokeWeight(6);
  stroke(255);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  //emitter
  strokeWeight(8);
  stroke(150);
  line(0, 0, mouse.x/9, mouse.y/9);
  line(0, 0, -mouse.x/9, -mouse.y/9);
  
  //handle1
  strokeWeight(8);
  stroke(0);
  line(0, 0, mouse.x/10, mouse.y/10);
  line(0, 0, -mouse.x/10, -mouse.y/10);
  
  //buttons
  strokeWeight(4);
  stroke(255, 0, 0);
  line(0, 0, mouse.x/13, mouse.y/13);
  line(0, 0, -mouse.x/13, -mouse.y/13);
  
  //handle2
  strokeWeight(8);
  stroke(0);
  line(0, 0, mouse.x/15, mouse.y/15);
  line(0, 0, -mouse.x/15, -mouse.y/15);
  
  println(mouse.mag()); //prints the magnitude of the mouse position

}
