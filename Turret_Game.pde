int personX, personY, frameCounter, turretBulletX, turretBulletY, bulletCounter, xRate, yRate, turretBarrelX, turretBarrelY, headX, headY, exitCounter, lazerX;
boolean personState, targetState, exitState, loseState, winState;
int intro = 1;
int interval = (int)random(3) + 1;
Turret urTurret = new Turret("ur", true, 100);
Turret ulTurret = new Turret("ul", true, 100);
Turret brTurret = new Turret("br", true, 100);
Turret blTurret = new Turret("bl", true, 100);
Door topDoor = new Door("top");
Door bottomDoor = new Door("bottom");
Door leftDoor = new Door("left");
Door rightDoor = new Door("right");
Door door = new Door("none");
void setup() 
{
  background(255, 255, 255);
  size(1000, 700);
  frameRate(60);
  personX = 475;
  personY = -180;
  topDoor.chooseDoor();
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

  noFill();
  headX = 50 + personX;
  headY = 600 + personY;
  int GunBarrelX = 77 + personX;
  int GunBarrelY = 630 + personY;


  // creates man
  if (personState == true) {
    ellipse(headX, headY, 34, 40);
    line(50 + personX, 620 + personY, 50 + personX, 655 + personY);
    line(50 + personX, 655 + personY, 40 + personX, 690 + personY);
    line(50 + personX, 655 + personY, 60 + personX, 690 + personY);

    //creates gun

    int distX = personX + 50 - mouseX;
    int distY = personY + 639 - mouseY;
    float mouseS = personX + 50 + sqrt(sq(mouseX - (personX + 50)) + sq(mouseY - (personY + 635)));

    pushMatrix();

    translate(personX + 50, personY + 635);

    float angle = atan((distY + .01) / (distX +.01));

    if (distX < 0) {
      angle += PI;
    }
    angle += PI;
    rotate(angle);

    translate(-(personX + 50), -(personY + 635));


    line(50 + personX, 635 + personY, 65 + personX, 635 + personY);
    strokeWeight(3);
    line(65 + personX, 639 + personY, 65 + personX, 630 + personY); // gun handle
    line(65 + personX, 630 + personY, GunBarrelX, GunBarrelY); // gun barrel
    noFill();
    rect(65 + personX, 630 + personY, 4, 3); //trigger box

    if (mousePressed == true && (mouseButton == LEFT)) {
      stroke(255, 0, 0);

      // Draw the laser line
      line(GunBarrelX, GunBarrelY, mouseS, GunBarrelY);

      stroke(0, 0, 0); 
      if (mouseX < 1000 && mouseX > 950) 
        if (mouseY < 40 && mouseY > 0) 
          urTurret.removeHealth(1);
      if (mouseX < 1000 && mouseX > 950) 
        if (mouseY < 700 && mouseY > 660) 
          brTurret.removeHealth(1);
      if (mouseX < 50 && mouseX > 0) 
        if (mouseY < 700 && mouseY > 650) 
          blTurret.removeHealth(1);
      if (mouseX < 50 && mouseX > 0) 
        if (mouseY < 50 && mouseY > 0) 
          ulTurret.removeHealth(1);
    }


    popMatrix();
    if (targetState == true) {
      fill(255);
      ellipse(mouseX, mouseY - 10, 30, 30);
      fill(0);
      line(mouseX, mouseY - 25, mouseX, mouseY + 5);
      line(mouseX - 15, mouseY - 10, mouseX + 15, mouseY - 10);
    }

    if (keyPressed) {
      if (key == 'w') {
        personY -= 2;
      } else if (key == 'd') {
        personX += 2;
      } else if (key == 's') {
        personY += 2;
      } else if (key == 'a') {
        personX -= 2;
      }
    }
  }


  if (exitState == true) 
    exitCounter++;
  if (exitCounter == 200)
    exit();

  intro++;

  urTurret.shoot();
  ulTurret.shoot();
  brTurret.shoot();
  blTurret.shoot();
  urTurret.show();
  ulTurret.show();
  brTurret.show();
  blTurret.show();
  topDoor.show();
  bottomDoor.show();
  leftDoor.show();
  rightDoor.show();
  door.checkDoors();
}

