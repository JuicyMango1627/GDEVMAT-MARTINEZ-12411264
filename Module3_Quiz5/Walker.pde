class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector();
  
  void render()
  {
    circle(speed.x, speed.y, 30);
  }
  
   void randomWalk()
  {
    int rng = int(random(4));
    
    if (rng == 0)
    {
      speed.y += 5;
    }
    if (rng == 1)
    {
      speed.y -= 5;
    }
    if (rng == 2)
    {
      speed.x += 5;
    }
    if (rng == 3)
    {
      speed.x -= 5;
    }
  }
}
