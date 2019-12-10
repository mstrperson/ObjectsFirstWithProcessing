class ImperfectReflector extends ForceEffect
{
  float scaleFactor;
  Rectangle wall;
  // pass in the normal vector to the line of your reflector.
  public ImperfectReflector(float normX, float normY, float scale, Rectangle obj)
  {
    force = new Vector2(normX, normY);
    wall = obj;
    scaleFactor = scale;
  }
  
  void applyForce(Sprite obj)
  {
    if((obj instanceof Blob && wall.collidesWith((Blob)obj)) || wall.collidesWith(obj, 20))
      obj.velocity = obj.velocity.reflectIn(force.unitVector()).scaleBy(scaleFactor);
  }
}
