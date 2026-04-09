Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initWalkers();
}

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];

    PVector accel = new PVector(0.2, 0);
    w.applyForce(accel);

    float mew = 0.01f;

    if (w.position.x > 0)
    {
      mew = 0.4f;
    }

    float normal = 1;
    float frictionMagnitude = mew * normal;

    PVector friction = w.velocity.copy();
    friction.mult(-1);

    if (friction.mag() > 0)
    {
      friction.normalize();
      friction.mult(frictionMagnitude);
      w.applyForce(friction);
    }

    w.update();
    w.checkEdges();
    w.render();
  }
}

void reset()
{
  initWalkers();
}

void initWalkers()
{
  int nWalkers = walkers.length;

  for (int i = 0; i < nWalkers; i++)
  {
    walkers[i] = new Walker();

    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 15;

    float posY = 2 * (Window.windowHeight / (float)nWalkers) * 
                 (i - (nWalkers / 2.0));

    walkers[i].position = new PVector(Window.left, posY);

    walkers[i].walkerColor = color(random(255), random(255), random(255));
  }
}
