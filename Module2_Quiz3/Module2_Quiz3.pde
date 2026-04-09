    void setup()
    {
      size(1280, 720, P3D);
      camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
      background(255);
    }
    
    void draw()
    {
      float gaussian1 = randomGaussian();
      float gaussian2 = randomGaussian();
      
      float standardDeviation1 = 200;
      float standardDeviation2 = 30;
      float mean1 = 0;  
      float mean2 = 0;
      
      float x = standardDeviation1 * gaussian1 + mean1;
      float y = random(-360, 360); //bottom, top
      float z = standardDeviation2 * gaussian2 + mean2;
      
      //randomize colors
      float r = random(255);
      float g = random(255);
      float b = random(255);
      float a = random(10, 100); //alpha = opacity
      
      noStroke();
      
      fill(r, g, b, a);
      circle(x, y, z); //x pos, y pos, thickness
    }
