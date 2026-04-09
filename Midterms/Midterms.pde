void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 100; i++)
  {
    walkers.add(new Walker());
  }
}

int spawnInterval = 0;
ArrayList<Walker> walkers = new ArrayList<Walker>();
PVector position = new PVector();  

void draw()
{  
  background(0);

  if (spawnInterval > 0)
  {
    spawnInterval--;
  }

  if (spawnInterval == 0)
  {
    spawnInterval = 300;
    resetWave();
  }

  for (Walker w : walkers)
  {
    w.update(position);
    w.render();
  }

  println(position.x + " " + position.y);
  
  fill(255);
  noStroke();
  circle(position.x, position.y, 150);
}

void newTarget()
{
  position.x = random(-Window.windowWidth / 2, Window.windowWidth / 2);
  position.y = random(-Window.windowHeight / 2, Window.windowHeight / 2);
}

void resetWave()
{
  walkers.clear();

  newTarget();
  
  for (int i = 0; i < 100; i++)
  {
    walkers.add(new Walker());
  }
  
}
