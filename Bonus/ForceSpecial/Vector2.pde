public class Vector2
{  
  float x, y;
  
  public Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public float dotProduct(Vector2 v)
  {
    return (this.x * v.x + this.y * v.y);
  }
  
  public float magnitude()
  {
    return (float)Math.sqrt(x*x + y*y);
  }
  
  public Vector2 perpendicular()
  {
    return new Vector2(y, -x);
  }
  
  public Vector2 inverse()
  {
    return new Vector2(-x, -y);
  }
  
  public Vector2 unitVector()
  {
    float mag = magnitude();
    return new Vector2(x / mag, y / mag);
  }
  
  public Vector2 scaleBy(float factor)
  {
    return new Vector2(factor * x, factor * y);
  }
  
  public Vector2 add(Vector2 v)
  {
    return new Vector2(this.x + v.x, this.y + v.y);    
  }
  
  public Vector2 shortestVectorTo(Vector2 other)
  {
    Vector2 difference = this.subtract(other);
    
    if(difference.x > width / 2) difference.x -= width;
    if(difference.x < -width / 2) difference.x += width;
    
    if(difference.y > height / 2) difference.y -= height;
    if(difference.y < -height / 2) difference.y += height;
    
    return difference;
  }
  
  public Vector2 subtract(Vector2 v)
  {
    return new Vector2(this.x - v.x, this.y - v.y);
  }
  
  public Vector2 reflectIn(Vector2 normal)
  {
    return this.subtract(normal.scaleBy(2*this.dotProduct(normal)));
  }
}
