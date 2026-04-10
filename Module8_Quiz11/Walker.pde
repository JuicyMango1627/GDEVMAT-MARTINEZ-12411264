public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityMax = 10;
  public float scale = 15;
  
  public float mass = 1;
  
  public float r = 255, g = 255, b = 255, a = 255;
  
  public float gC = 1;
  
  public Walker()
  {
    
  }

  //Newton's Second Law
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass); // divides force by mass
     this.acceleration.add(f);
  }
  
  public void update()
  {
    
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityMax); // limits the amount of attainable velocity
    this.position.add(this.velocity); // adds velocity to the object
    this.acceleration.mult(0); // resets acceleration every frame
  }
  
  public void render()
  {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }
  
  public PVector calculateAttraction(Walker w)
  {
   PVector force = PVector.sub(this.position, w.position); 
   float distance = force.mag();
   force.normalize(); // NORMALIZE TO ACCURATELY GET THE DIRECTION
   
   distance = constrain(distance, 5, 25); // solves divide by 0, and dividing by extrenely tiny values
   
   float strength = (this.gC * this.mass * w.mass) / (distance * distance);
   force.mult(strength);
   return force;
  }
}
