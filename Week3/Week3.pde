Player player;
Blob blober;

void setup()
{
  size(500, 500);
  blober = new Blob(200, 400, 20, 2, 2.4, color(220, 180, 20)); 
  player = new Player(100, 100);
  frameRate(200);
}

void draw()
{
  background(255,255,255);
  
  // if blober hits the player, ....
  if(blober.collidesWith(player, 20))
  {
    // blober bounces off and...
    blober.dx = -blober.dx;
    blober.dy = -blober.dy;
    
    // player moves back to start.
    player.x = 100;
    player.y = 100;
  }
  
  blober.move();
  blober.drawSprite();
  
  player.keyboardControl();
  player.drawSprite();
}
