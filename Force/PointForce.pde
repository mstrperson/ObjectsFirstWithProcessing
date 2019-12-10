public class PointForce extends ForceEffect
{
  Vector2 location;
  
  public PointForce(Vector2 loc, float mag)
  {
    force = new Vector2(mag, 0);
    location = loc;
  }
  
  void applyForce(Sprite obj)
  {
    Vector2 difference = this.location.subtract(obj.position);
    float dist = difference.magnitude();
    float effect = force.x / dist;
    
    obj.velocity = obj.velocity.add(difference.unitVector().scaleBy(effect));
  }
}
