int personX, personY, frameCounter, turretBulletX, turretBulletY, bulletCounter, xRate, yRate, turretHealth1, turretHealth2, turretBarrelX, turretBarrelY, headX, headY, exitCounter, lazerX;
boolean turretState1, turretState2, personState, shotRunnerUp, shotRunnerLow, LowDefault, UpDefault, targetState, exitState, loseState, winState;
int intro = 1;
int interval = 1;
Turret UrTurret = new Turret(1);
Turret BrTurret = new Turret(2);
void setup() 
{
  background(255, 255, 255);
  size(1000, 700);
  frameRate(60);
}

void draw()
{
  UrTurret.show();
  BrTurret.show();
  if (loseState == true)
    gameEnd("lose");
    
  if (winState == true) 
    gameEnd("win");
    
  if (loseState == false && (winState == false))
    background(255);

  door();
  fill(0);
  
  
  
  fill(255);
  if (intro < 60) {
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
    float mouseS = personY + personX + 50 + sqrt(sq(mouseX - (personX + 50)) + sq((height - mouseY) - (personY + height - 635)));

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
      if (mouseX < 1000 && (mouseX > 955)) 
        if (mouseY < 40 && (mouseY > 0)) 
          turretHealth1--;
      if (mouseX < 1000 && (mouseX > 955)) 
        if (mouseY < 700 && (mouseY > 660)) 
          turretHealth2--;
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


  if (frameCounter > 400) {
    frameCounter = 0;
    UrTurret.shoot();
  }

  if (shotRunnerUp == true) {
    
    UrTurret.shoot();
    bulletCounter++;
  }

  if (frameCounter == 200) {
    frameCounter++;
    BrTurret.shoot();
  }
   else
    frameCounter++;

  if (shotRunnerLow == true) {
    if (turretState2 == true)
      BrTurret.shoot();
    bulletCounter++;
  }

  if (bulletCounter == 150) {
    shotRunnerUp = false;
    shotRunnerLow = false;
    bulletCounter = 0;
  }

 
  if (exitState == true) 
    exitCounter++;
  if (exitCounter == 200)
    exit();
  intro++;
}

