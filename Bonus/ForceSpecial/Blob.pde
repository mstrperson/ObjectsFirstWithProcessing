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
  
  Blob(Vector2 loc, float r, color c)
  {
    super(loc);
    radius = r;
    myColor = c;
  }
  
  // Create a blob with default velocity.
  Blob(float x, float y, float r, color c)
  {
    // super calls the Sprite(x, y) constructor method.
    super(x, y, 1, 1.5);
    myColor = c;
    radius = r;
  }
  
  // Create a blob with a particular velocity vector.
  Blob(float x, float y, int r, float dx, float dy, color c)
  {
    super(x, y, dx, dy);
    myColor = c;
    radius = r;
  }
  
  // I can override the default Sprite.move() method by writing a new one here
  // this one will "bounce off of" a particular color in a boring way...
  void move()
  {
    if(this.collidesWith(color(128, 0, 200)))
    {
      velocity = velocity.inverse();
    }
    
    // because I don't want to rewrite all the code in the Sprite.move() method, I can call it here using "super"
    super.move();
  }
  
  // This is the method that is /absolutely/ required.
  // this defines how to draw the Blob; it's just a circle...
  void drawSprite()
  {
    fill(myColor);
    ellipse(position.x, position.y, radius, radius);
  }
}
