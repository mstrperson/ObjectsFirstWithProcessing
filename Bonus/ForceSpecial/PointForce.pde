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
    Vector2 difference = this.location.shortestVectorTo(obj.position);
    float dist = difference.magnitude() / 10;
    float effect = force.x / (dist*dist);
    
    if(effect > 0.01 && dist > 1)
      obj.velocity = obj.velocity.add(difference.unitVector().scaleBy(effect));
  }
}
