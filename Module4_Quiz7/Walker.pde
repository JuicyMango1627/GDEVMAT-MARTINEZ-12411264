public class Walker
{
  public PVector position;
  public PVector velocity;
  public PVector acceleration;

  public float velocityMax = 10;
  public float scale;
  public color walkerColor;

  public Walker()
  {
    position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );

    velocity = new PVector();
    acceleration = new PVector();

    scale = random(15, 30);
    
    float r = random(100, 150);
    float g = random(150, 220);
    float b = random(200, 255);

    walkerColor = color(r, g, b);
  }

  public void update()
  {
    PVector mouse = new PVector(
      mouseX - width/2,
      mouseY - height/2
    );

    PVector direction = PVector.sub(mouse, position);
    
    direction.normalize();
    direction.mult(0.2);
    
    this.acceleration = direction;

    velocity.add(acceleration);
    velocity.limit(velocityMax);
    position.add(velocity);
  }

  public void render()
  {
    fill(walkerColor);
    noStroke();
    circle(position.x, position.y, scale);
  }

}
