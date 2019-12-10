/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  // this Sprite's current location.
  Vector2 position;
  
  // this Sprite's current velocity vector.
  Vector2 velocity;
  
  Sprite(Vector2 pos)
  {
    position = pos;
    velocity = new Vector2(0, 0);
  }
  
  Sprite(Vector2 pos, Vector2 vel)
  {
    position = pos;
    velocity = vel;
  }
  
  // initialize a Sprite at a given coordinate.
  Sprite(float x, float y)
  {
    position = new Vector2(x, y);
    //this.x = x;
    //this.y = y;
    
    this.velocity = new Vector2(0, 0);
    //this.dx = 0;
    //this.dy = 0;
  }  
  
  // initalize a Sprite at a given coordinate with a given velocity.
  Sprite(float x, float y, float dx, float dy)
  {
    position = new Vector2(x, y);
    //this.x = x;
    //this.y = y;
    
    this.velocity = new Vector2(dx, dy);
    //this.dx = 0;
    //this.dy = 0;
  }
  
  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    return get((int)position.x,(int)position.y)==c;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    float speed = velocity.magnitude();//sqrt(velocity.x*velocity.x + velocity.y*velocity.y);
    float delX = other.position.x - this.position.x;
    float delY = other.position.y - this.position.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) position.x += (delX / mag) * speed;
    if(delY != 0) position.y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while mafloataing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = velocity.magnitude();//sqrt(dx*dx + dy*dy);
    float delX = other.position.x - this.position.x;
    float delY = other.position.y - this.position.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(mag > 0 && mag <= minFollowDistance) 
    {
      if(delY < delX)
      {
        position.x -= (delY / mag) * speed * 0.5;
        position.y += (delX / mag) * speed * 0.5;
      }
      else
      {
        position.x += (delY / mag) * speed * 0.5;
        position.y -= (delX / mag) * speed * 0.5;
      }
      return;
    }
    
    if(delX != 0) position.x += (delX / mag) * speed;
    if(delY != 0) position.y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = velocity.magnitude();//sqrt(velocity.x*velocity.x + velocity.y*velocity.y);
    float delX = mouseX - this.position.x;
    float delY = mouseY - this.position.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) position.x += (delX / mag) * speed;
    if(delY != 0) position.y += (delY / mag) * speed;
  }
  
  // move this sprite according to it's current velocity vector
  // bounces off the walls
  void move()
  {
    position.x += velocity.x;
    position.y += velocity.y;
    
    // make sure we don't go out of bounds
    if(position.x < 0)
    { 
      position.x += width;
    }
    if(position.x > width) 
    {
      position.x -= width;
    }
    if(position.y < 0) 
    {
      position.y += height;
    }
    if(position.y > height)
    {
      position.y -= height;
    }
  }
  
  // get the distance between centers of this Sprite and another
  float distanceTo(Sprite other)
  {
    float delX = other.position.x - this.position.x;
    float delY = other.position.y - this.position.y;
    return sqrt(delX*delX + delY*delY);
  }
  
  // Control this sprite using the Arrow Keys
  void keyboardControl()
  {
    // If I hit the LEFT arrow, go Left
    if(keyCode == LEFT)
    {
      velocity.x = -1;
      velocity.y = 0;
    }
    // if I hit the RIGHT arrow, go Right
    else if(keyCode == RIGHT)
    {
      velocity.x = 1;
      velocity.y = 0;
    }
    // if I hit the UP arrow, go Up
    if(keyCode == UP)
    {
      velocity.y = -1;
      velocity.x = 0;
    }
    // if I hit the DOWN arrow, go Down
    else if(keyCode == DOWN)
    {
      velocity.y = 1;
      velocity.x = 0;
    }
    // if I hit the Space Bar, Stop
    if(keyCode == ' ')
    {
      velocity.x = 0;
      velocity.y = 0;
    }
    
    // move x and y in the appropriate way
    position.x = position.x + velocity.x;
    position.y = position.y + velocity.y;
    
    // make sure we don't go out of bounds
    if(position.x < 0) position.x = 0;
    if(position.x > width) position.x = width;
    if(position.y < 0) position.y = 0;
    if(position.y > height) position.y = height;
  }
  
  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
