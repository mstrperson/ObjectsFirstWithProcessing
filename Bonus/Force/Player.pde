class Player extends Sprite
{
  // start your player with a particular starting point.
  Player(float x, float y)
  {
    super(x, y, 0, 0);
  }
  
  void drawSprite()
  {
    // draw your character here, 
    // but be sure that everything you draw is relative to this.x and this.y!
    
    // Draw your own character instead of mine!
    
    strokeWeight(1);
    //make the head
    fill(180, 0, 200);
    ellipse(position.x, position.y, 30, 30);
    // make the ears
    fill(200, 20, 220);
    ellipse(position.x-15, position.y-15, 10, 30);
    ellipse(position.x+15, position.y-15, 10, 30);
    // draw the mouth
    strokeWeight(4);
    arc(position.x, position.y+2, 20, 15, 0,PI);
    // draw the eyes
    line(position.x-5, position.y-2, position.x-2, position.y-2);
    line(position.x+5, position.y-2, position.x+2, position.y-2);
  }
}
