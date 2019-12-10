class UniformForce extends ForceEffect
{
  public UniformForce(float magnitude)
  {
    this.force = new Vector2(magnitude, 0);
  }
  
  void applyForce(Sprite obj)
  {
    obj.velocity = obj.velocity.scaleBy(this.force.x);
  }
}
