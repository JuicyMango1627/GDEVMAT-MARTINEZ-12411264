Walker walkerNormal = new Walker();
Walker walkerBiased = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  walkerNormal.x = -10;
  walkerNormal.y = 0;
  
  walkerBiased.x = 10;
  walkerBiased.y = 0;
}

void draw()
{
  walkerNormal.randomWalk();
  walkerNormal.render();
  
  walkerBiased.randomWalkBiased();
  walkerBiased.render();
}
