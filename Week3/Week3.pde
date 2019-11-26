Player player;

void setup()
{
  size(500, 500);
  
  player = new Player(100, 100);
}

void draw()
{
  background(255,255,255);
  
  player.keyboardControl();
  player.drawSprite();
}
