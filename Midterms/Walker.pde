public class Walker
{
  PVector position;
  PVector velocity;

  float size;
  float r, g, b, a;

  Walker()
  {
    float gaussian1 = randomGaussian();
    float gaussian2 = randomGaussian();

    float standardDeviation1 = 200;
    float standardDeviation2 = 30;

    float x = standardDeviation1 * gaussian1;
    float y = random(-360, 360);

    position = new PVector(x, y);
    velocity = new PVector(0, 0);

    size = standardDeviation2 * gaussian2;

    r = random(255);
    g = random(255);
    b = random(255);
    a = random(10, 100);
  }

  void update(PVector target)
  {
    PVector direction = PVector.sub(target, position);

    direction.normalize();
    direction.mult(4);

    velocity = direction;
    position.add(velocity);
  }

  void render()
  {
    noStroke();
    fill(r, g, b, a);
    circle(position.x, position.y, size);
  }
}
