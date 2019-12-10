Player player;
Rectangle ground;
GravitationField gravity;
ImperfectReflector groundBounce;
PointForce blackHole;
PointForce blackHole2;
PointForce projectileMass;
UniformForce brakes;
Blob point, point2;
Rectangle trampoline;
ImperfectReflector trampJump;

Blob projectile;

void setup()
{
  frameRate(250);
  fullScreen();
  brakes = new UniformForce(0.9);
  blackHole = new PointForce(new Vector2(2*width/3, height/2), 10+random(15));
  blackHole2 = new PointForce(new Vector2(width/3, height/2), 10+random(15));
  point = new Blob(blackHole.location, 10, color(200, 180,0));
  point2 = new Blob(blackHole2.location, 10, color(255,128,80));
  player = new Player(100, 100);
  ground = new Rectangle(-10, height - 20, width+20, 30, color(20, 200, 50));
  groundBounce = new ImperfectReflector(0, -1, 0.95, ground);
  gravity = new GravitationField(9.8/frameRate);
  
  trampoline = new Rectangle(width - 100, height - 50, 110, 60, color(200, 0, 180));
  trampJump = new ImperfectReflector(-1, -1, 1.5, trampoline);
  
  projectile = new Blob(random(width), random(height), 15, 2, 1.5, color(255, 30, 50));
  projectileMass = new PointForce(projectile.position, 0.5);
}

void draw()
{
  background(0);
  point.drawSprite();
  point2.drawSprite();
  //ground.drawSprite();
  //trampoline.drawSprite();
  //trampoline.keyboardControl();
  projectile.drawSprite();
  projectile.move();
  point.move();
  point2.move();
  
  projectileMass.location = projectile.position;
  blackHole.location = point.position;
  blackHole2.location = point2.position;
  
  projectileMass.applyForce(point);
  projectileMass.applyForce(point2);
  blackHole.applyForce(point2);
  blackHole2.applyForce(point);
  
  //gravity.applyForce(projectile);
  //groundBounce.applyForce(projectile);
  //trampJump.applyForce(projectile);
  brakes.applyForce(projectile);
  brakes.applyForce(point);
  brakes.applyForce(point2);
  
  blackHole.applyForce(projectile);
  blackHole2.applyForce(projectile);
}
