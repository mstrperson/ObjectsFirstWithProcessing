Blob player;

void setup()
{
  size(500, 500);
  
  player = new Blob(100, 100, 15, 1.25, 1.5, color(150, 0, 255));
}

void draw()
{
  player.move();
  player.drawSprite();
}
