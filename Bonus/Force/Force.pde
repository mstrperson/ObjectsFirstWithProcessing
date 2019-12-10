Player player;
Rectangle ground;
GravitationField gravity;
ImperfectReflector groundBounce;
PointForce blackHole;
UniformForce brakes;
Blob point;
Rectangle trampoline;
ImperfectReflector trampJump;

Blob projectile;

void setup()
{
  frameRate(250);
  fullScreen();
  brakes = new UniformForce(
  blackHole = new PointForce(new Vector2(width/2, height/2), 50);
  point = new Blob(blackHole.location, 10, color(0));
  player = new Player(100, 100);
  ground = new Rectangle(-10, height - 20, width+20, 30, color(20, 200, 50));
  groundBounce = new ImperfectReflector(0, -1, 0.95, ground);
  gravity = new GravitationField(9.8/frameRate);
  
  trampoline = new Rectangle(width - 100, height - 50, 110, 60, color(200, 0, 180));
  trampJump = new ImperfectReflector(-1, -1, 1.5, trampoline);
  
  projectile = new Blob(20, width/2, 30, 3, 5.5, color(255, 30, 50));
}

void draw()
{
  background(255,255,255);
  point.drawSprite();
  ground.drawSprite();
  trampoline.drawSprite();
  trampoline.keyboardControl();
  projectile.drawSprite();
  projectile.move();
  //gravity.applyForce(projectile);
  //groundBounce.applyForce(projectile);
  //trampJump.applyForce(projectile);
  blackHole.applyForce(projectile);
}
