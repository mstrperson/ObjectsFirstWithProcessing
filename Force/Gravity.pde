class GravitationField extends ForceEffect
{
  public GravitationField(float magnitude)
  {
    this.force = new Vector2(0, magnitude);
  }
  
  void applyForce(Sprite obj)
  {
    obj.velocity.y += this.force.y;
  }
}
