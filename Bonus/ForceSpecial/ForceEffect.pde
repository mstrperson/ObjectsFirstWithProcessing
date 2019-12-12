abstract class ForceEffect
{
  Vector2 force;  // magnitude of the force in the x and y directions.
  
  // Apply the force to a given sprite object.
  abstract void applyForce(Sprite obj);
}
