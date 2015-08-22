int frameCounter, headY, exitCounter, lazerX;
boolean personState, targetState, exitState, loseState, winState;
int intro = 1;
int interval = (int)random(3) + 1;
Turret urTurret = new Turret("ur", true, 200);
Turret ulTurret = new Turret("ul", true, 200);
Turret brTurret = new Turret("br", true, 200);
Turret blTurret = new Turret("bl", true, 200);
Door rightDoor = new Door("right");
Door door = new Door("none");
Person person = new Person(459, -168, 3, true);
void setup() 
{
  background(255, 255, 255);
  size(1000, 700);
  frameRate(60);
  rightDoor.chooseDoor();
}

void draw()
{
  if (loseState == true)
    gameEnd(0);

  if (winState == true) 
    gameEnd(1);

  if (loseState == false && winState == false)
    background(255);

  if (intro < 120) {
    intro();
  }

  if (exitState == true) 
    exitCounter++;
  if (exitCounter == 200)
    exit();

  person.move();
  person.showAndShoot();
  
  urTurret.showAndShootAll();
  door.checkDoors();
  rightDoor.show();

  intro++;
}

