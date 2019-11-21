/* In order to actually use the Sprite class, we must /extend/ it.
 * We can add to this class /more/ information than is in Sprite
 * but, we do NOT need to replicate the data that is stored in Sprite.
 * x, y, dx, and dy are all defined in the Sprite class and we get
 * all of those for free by using "extends Sprite"
 */
class Blob extends Sprite
{
  // Blobs have a Radius and a color
  float radius;
  color myColor;
  
  // Create a blob with default velocity.
  Blob(float x, float y, float r, color c)
  {
    // super calls the Sprite(x, y) constructor method.
    super(x, y);
    this.dx = 1;
    this.dy = 1.5;
    myColor = c;
    radius = r;
  }
  
  // Create a blob with a particular velocity vector.
  Blob(float x, float y, float r, float dx, float dy, color c)
  {
    super(x, y);
    this.dx = dx;
    this.dy = dy;
    myColor = c;
    radius = r;
  }
  
  void checkCollision(Blob other)
  {
    if(this.distanceTo(other) < (this.radius + other.radius)/2)
    {
      if((this.x < other.x && this.dx > 0) || (this.x > other.x && this.dx < 0))
        dx = -dx;
      if((this.y < other.y && this.dy > 0) || (this.y > other.y && this.dy < 0))
        dy = -dy;
    }
  }
  
  void checkCollision(color c)
  {
    if(this.collidesWith(c))
    {
      dx *= -1;
      dy *= -1;
    }
  }
  
  // This is the method that is /absolutely/ required.
  // this defines how to draw the Blob; it's just a circle...
  void drawSprite()
  {
    fill(myColor);
    ellipse(x, y, radius, radius);
  }
}
