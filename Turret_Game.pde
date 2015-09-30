int colorChange, r, g, b;
int frameCounter, headY, restartCounter, lazerX;
boolean personState, targetState, restartState, loseState, winState;
boolean[] keys = new boolean[4];
float  bulletMult = 1;
PImage TGLogo;
boolean gameStart = false;
boolean rules = false;

Button BPlay = new Button(450, 300, "Play Game");
Button BRules = new Button(450, 335, "How to Play");
Button BBack = new Button(20, 20, "Back");
Turret urTurret = new Turret("ur", true, 200);
Turret ulTurret = new Turret("ul", true, 200);
Turret brTurret = new Turret("br", true, 200);
Turret blTurret = new Turret("bl", true, 200);
Door rightDoor = new Door("right");
Person person = new Person(459, -168, 3, true);

void setup() 
{
  size(1000, 700);
  TGLogo = loadImage("TG.png");
  TGLogo.resize(1000, 700);
  frameRate(60);
}

void draw() {
  background(TGLogo);
  if (!gameStart && !rules) {
    background(TGLogo);
    BPlay.show();
    BRules.show();
    if (BRules.checkHitBox())
      rules = true;
    if (BPlay.checkHitBox())
      gameStart = true;
  } else if (rules) {
    showRules();
    BBack.show();
    if (BBack.checkHitBox())
      rules = false;
  } else if (gameStart && !rules)
    gameRunner();
}

void keyPressed() {
  println("hi");
  if (key == 'w') 
    keys[0] = true;
  if (key == 'a') 
    keys[1] = true;
  if (key == 's') 
    keys[2] = true;
  if (key == 'd') 
    keys[3] = true;
}

void keyReleased() {
  if (key == 'w') 
    keys[0] = false;
  if (key == 'a') 
    keys[1] = false;
  if (key == 's') 
    keys[2] = false;
  if (key == 'd') 
    keys[3] = false;
}