class Rectangle extends Sprite
{
  float w, h;
  color myColor;
  
  public Rectangle(float x, float y, float w, float h)
  {
    super(x, y);
    myColor = color(255,255,255);
    this.w = w;
    this.h = h;
  }
  
  public Rectangle(float x, float y, float w, float h, color c)
  {
    super(x, y);
    myColor = c;
    this.w = w;
    this.h = h;
  }
  
  void drawSprite()
  {
    fill(myColor);
    rect(position.x, position.y, w, h);
  }
  
  boolean collidesWith(Sprite other, float otherRadius)
  {
    return (other.position.x+otherRadius >= this.position.x 
         && other.position.x - otherRadius <= this.position.x + w
         && other.position.y + otherRadius >= this.position.y
         && other.position.y - otherRadius <= this.position.y + h);
  }
  
  boolean collidesWith(Blob other)
  {
    return collidesWith(other, other.radius/2);
  }
}
