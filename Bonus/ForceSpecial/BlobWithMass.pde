class BlobWithMass extends Blob
{
  PointForce gravityWell;
  
  public BlobWithMass(Vector2 location, float radius, color c, float gravitationalForce)
  {
    super(location, radius, c);
    gravityWell = new PointForce(location, gravitationalForce);
  }
  
  void keyboardControl()
  {
    super.keyboardControl();
    gravityWell.location = this.position;
  }
  
  void move()
  {
    super.move();
    gravityWell.location = this.position;
  }
}
