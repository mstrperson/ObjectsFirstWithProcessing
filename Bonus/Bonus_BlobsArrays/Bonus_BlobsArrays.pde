Blob player = new Blob(250, 250, 15, color(200, 0, 255));

int blobCount = 50;

Blob blobs[] = new Blob[blobCount];

void setup()
{
  size(500,500);
  frameRate(250);
  for(int i = 0; i < blobCount; i++)
  {
    blobs[i] = new Blob(random(50)*10+5, random(50)*10+5, 15, random(2.5), random(2.5), color(30, random(255), 200));
  }
}

void draw()
{
  background(#FFFFFF);
  player.keyboardControl();
  
  for(int i = 0; i < blobCount; i++)
  {
    for(int j = 0; j < blobCount; j++)
    {
      blobs[i].checkCollision(blobs[j]);
    }
    
    blobs[i].checkCollision(player);
    
    blobs[i].move();
    blobs[i].drawSprite();
  }
  
  player.drawSprite();
}
