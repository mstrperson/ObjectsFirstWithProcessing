/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  // this Sprite's current location.
  int x, y;
  
  // this Sprite's current velocity vector.
  float dx, dy;
  
  // initialize a Sprite at a given coordinate.
  Sprite(int x, int y)
  {
    this.x = x;
    this.y = y;
    
    this.dx = 0;
    this.dy = 0;
  }
  
  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    return get(x,y)==c;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    float speed = sqrt(dx*dx + dy*dy);
    int delX = other.x - this.x;
    int delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while maintaing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = sqrt(dx*dx + dy*dy);
    int delX = other.x - this.x;
    int delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(mag > 0 && mag <= minFollowDistance) 
    {
      if(delY < delX)
      {
        x -= (delY / mag) * speed * 0.5;
        y += (delX / mag) * speed * 0.5;
      }
      else
      {
        x += (delY / mag) * speed * 0.5;
        y -= (delX / mag) * speed * 0.5;
      }
      return;
    }
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pointer!
  void followMouse()
  {
    float speed = sqrt(dx*dx + dy*dy);
    int delX = mouseX - this.x;
    int delY = mouseY - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // move this sprite according to it's current velocity vector
  // bounces off the walls
  void move()
  {
    x += dx;
    y += dy;
    
    // make sure we don't go out of bounds
    if(x < 0)
    { 
      x = 0;
      dx *= -1;
    }
    if(x > width) 
    {
      x = width;
      dx *= -1;
    }
    if(y < 0) 
    {
      y = 0;
      dy *= -1;
    }
    if(y > height)
    {
      y = height;
      dy *= -1;
    }
  }
  
  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
