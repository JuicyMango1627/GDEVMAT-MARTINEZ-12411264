public class Walker
{
 public float x,
              y,
              z;
              
 public float r,
              g,
              b;
              
 public float tx = 0, 
              ty = 10000,
              tz = 0;

 public float tr = 0, 
              tg = 50,
              tb = 255;
              
 
 void render()
 {
   fill(r, g, b);
   noStroke();
   circle(x, y, z);
 }
 
 void perlinWalk()
 {
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   z = map(noise(tz), 0, 1, 5, 150);
   
   r = map(noise(tr), 0, 1, 0, 255);
   g = map(noise(tg), 0, 1, 0, 255);
   b = map(noise(tb), 0, 1, 0, 255);
   
   tx += 0.01f;
   ty += 0.01f;
   tz += 0.01f;
   
   tr += 0.01f;
   tg += 0.01f;
   tb += 0.01f;
 }
}
