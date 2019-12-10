/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  // this Sprite's current location.
  float x, y;
  
  // this Sprite's current velocity vector.
  float dx, dy;
  
  // initialize a Sprite at a given coordinate.
  Sprite(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    this.dx = 0;
    this.dy = 0;
  }
  
  // initalize a Sprite at a given coordinate with a given velocity.
  Sprite(float x, float y, float dx, float dy)
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }
  
  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    return get((int)x,(int)y)==c;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    float speed = sqrt(dx*dx + dy*dy);
    float delX = other.x - this.x;
    float delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while mafloataing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = sqrt(dx*dx + dy*dy);
    float delX = other.x - this.x;
    float delY = other.y - this.y;
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
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = sqrt(dx*dx + dy*dy);
    float delX = mouseX - this.x;
    float delY = mouseY - this.y;
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
      x += width;
    }
    if(x > width) 
    {
      x -= width;
    }
    if(y < 0) 
    {
      y += height;
    }
    if(y > height)
    {
      y -= height;
    }
  }
  
  // get the distance between centers of this Sprite and another
  float distanceTo(Sprite other)
  {
    float delX = other.x - this.x;
    float delY = other.y - this.y;
    return sqrt(delX*delX + delY*delY);
  }
  
  // Control this sprite using the Arrow Keys
  void keyboardControl()
  {
    // If I hit the LEFT arrow, go Left
    if(keyCode == LEFT)
    {
      dx = -1;
      dy = 0;
    }
    // if I hit the RIGHT arrow, go Right
    else if(keyCode == RIGHT)
    {
      dx = 1;
      dy = 0;
    }
    // if I hit the UP arrow, go Up
    if(keyCode == UP)
    {
      dy = -1;
      dx = 0;
    }
    // if I hit the DOWN arrow, go Down
    else if(keyCode == DOWN)
    {
      dy = 1;
      dx = 0;
    }
    // if I hit the Space Bar, Stop
    if(keyCode == ' ')
    {
      dx = 0;
      dy = 0;
    }
    
    // move x and y in the appropriate way
    x = x + dx;
    y = y + dy;
    
    // make sure we don't go out of bounds
    if(x < 0) x = 0;
    if(x > width) x = width;
    if(y < 0) y = 0;
    if(y > height) y = height;
  }
  
  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
