class PerfectReflector extends ForceEffect
{
  Rectangle wall;
  // pass in the normal vector to the line of your reflector.
  public PerfectReflector(float normX, float normY, Rectangle obj)
  {
    force = new Vector2(normX, normY);
    wall = obj;
  }
  
  void applyForce(Sprite obj)
  {
    if((obj instanceof Blob && wall.collidesWith((Blob)obj)) || wall.collidesWith(obj, 20))
      obj.velocity = obj.velocity.reflectIn(force.unitVector());
  }
}
