
// this is your player, they're a blob and they're kinda boring.
Blob player;

void setup()
{
  size(500, 500);
  
  // Blob parameters are: 
  // x (px), y (px), radius (px), 
  // x-speed (px/frame), y-speed (px/frame), and color.
  player = new Blob(100, 100, 15, 1.25, 1.5, color(150, 0, 255));
}

void draw()
{
  // make the player move automatically.
  player.move();
  
  // draw the player on the screen.
  player.drawSprite();
}
