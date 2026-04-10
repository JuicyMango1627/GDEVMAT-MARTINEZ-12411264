Walker[] walkers = new Walker[10];
Liquid l = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initWalkers();
}

void draw()
{
  background(255);

  l.render();

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];
    
    PVector gravity = new PVector(0, -0.15f * w.mass);
    
    w.applyForce(wind); 
    w.applyForce(gravity);

    if (l.isCollidingWith(w))
    {
      PVector dragForce = l.calculateDragForce(w);
      w.applyForce(dragForce);
    }

    w.update();
    w.render();
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *=-1;
    }
  }
}

void initWalkers()
{
  int n = walkers.length;

  for (int i = 0; i < n; i++)
  {
    walkers[i] = new Walker();

    walkers[i].mass = random(1, 10);
    walkers[i].scale = walkers[i].mass * 10;

    float spacing = (Window.right - Window.left) / (float)n;
    float posX = Window.left + spacing * i + spacing / 2;

    float posY = 300;

    walkers[i].position = new PVector(posX, posY);

    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}
