Player player;
Rectangle ground;
GravitationField gravity;
ImperfectReflector groundBounce;
UniformForce brakes;
BlobWithMass blackHole, blackHole2;
Rectangle trampoline;
ImperfectReflector trampJump;

BlobWithMass projectile;

void setup()
{
  frameRate(250);
  fullScreen();
  brakes = new UniformForce(0.9);
  blackHole = new BlobWithMass(new Vector2(2*width/3, height/2), 10, color(200, 180,0), 10+random(15));
  blackHole2 = new BlobWithMass(new Vector2(width/3, height/2), 10, color(255,128,80), 10+random(15));
  player = new Player(100, 100);
  ground = new Rectangle(-10, height - 20, width+20, 30, color(20, 200, 50));
  groundBounce = new ImperfectReflector(0, -1, 0.95, ground);
  gravity = new GravitationField(9.8/frameRate);
  
  trampoline = new Rectangle(width - 100, height - 50, 110, 60, color(200, 0, 180));
  trampJump = new ImperfectReflector(-1, -1, 1.5, trampoline);
  
  projectile = new BlobWithMass(new Vector2(random(width), random(height)), 15, color(255, 30, 50), 1);
}

void draw()
{
  background(0);
  blackHole.drawSprite();
  blackHole2.drawSprite();
  //ground.drawSprite();
  //trampoline.drawSprite();
  //trampoline.keyboardControl();
  projectile.drawSprite();
  projectile.move();
  blackHole.move();
  blackHole2.move();
  
  projectile.gravityWell.applyForce(blackHole);
  projectile.gravityWell.applyForce(blackHole2);
  blackHole.gravityWell.applyForce(blackHole2);
  blackHole2.gravityWell.applyForce(blackHole);
  
  //gravity.applyForce(projectile);
  //groundBounce.applyForce(projectile);
  //trampJump.applyForce(projectile);
  brakes.applyForce(projectile);
  brakes.applyForce(blackHole);
  brakes.applyForce(blackHole2);
  
  blackHole.gravityWell.applyForce(projectile);
  blackHole2.gravityWell.applyForce(projectile);
}
