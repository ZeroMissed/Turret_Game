int personX, personY, frameCounter, turretBulletX, turretBulletY, bulletCounter, xRate, yRate, turretHealth1, turretHealth2, turretBarrelX, turretBarrelY, headX, headY, exitCounter, lazerX;
boolean turretState1, turretState2, personState, shotRunnerUp, shotRunnerLow, LowDefault, UpDefault, targetState, exitState, doorState, loseState, winState;
int intro = 1;
int interval = 1;
Turret UpTurret = new Turret();
Turret LowTurret = new Turret();
void setup() 
{
  background(255, 255, 255);
  size(1000, 700);
  frameRate(60);
}

void draw()
{
  if (loseState == true)
    gameEnd("lose");
  if (winState == true) 
    gameEnd("win");
  if (loseState == false && (winState == false))
    background(255);
  if (doorState == true)
    door();
  fill(0);
  if (UpDefault == true) {
    if (turretState1 == true) {
      ellipse(1000, 0, 125, 125);
      line(1000, 0, 900, 40);
    }
    if (turretState2 == true) {
      ellipse(1000, 700, 125, 125);
      line(1000, 700, turretBarrelX, turretBarrelY);
    }
  }
  if (LowDefault == true) {
    if (turretState2 == true) {
      ellipse(1000, 700, 125, 125);
      line(1000, 700, 900, 660);
    }
    if (turretState1 == true) {
      ellipse(1000, 0, 125, 125);
      line(1000, 0, turretBarrelX, turretBarrelY);
    }
  }
  fill(255);
  if (intro < 60) {
    intro();
    turretHealth1 = 100;
    turretHealth2 = 100;
    personState = true;
    targetState = true;
    doorState = true;
  }

  noFill();
  headX = 50 + personX;
  headY = 600 + personY;
  int GunBarrelX = 77 + personX;
  int GunBarrelY = 630 + personY;

  //creates turret
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
    //println(mouseX);
    //println(mouseY);
    //println(mouseS);
    pushMatrix();
    
    translate(personX + 50, personY + 635);

    float angle = atan((distY + .01) / (distX +.01));

    if (distX < 0) {
      angle += PI;
    }

    angle += PI;


    rotate(angle);
    //println(degrees(angle));

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
      }
      else if (key == 'd') {
        personX += 2;
      }
      else if (key == 's') {
        personY += 2;
      }
      else if (key == 'a') {
        personX -= 2;
      }
    }


  }
  

  if (frameCounter > 400) {
    frameCounter = 0;
    if (turretState1 == true) 
      UpTurret.shoot(1);
  }
  if (shotRunnerUp == true) {
    if (turretState1 == true)
      UpTurret.shoot(1);
    bulletCounter++;
  }


  if (frameCounter == 200) {
    frameCounter++;
    if (turretState2 == true)
      LowTurret.shoot(2);
  } 
  else
    frameCounter++;

  if (shotRunnerLow == true) {
    if (turretState2 == true)
      LowTurret.shoot(2);
    bulletCounter++;
  }

  if (bulletCounter == 150) {
    shotRunnerUp = false;
    shotRunnerLow = false;
    bulletCounter = 0;
  }

  if (turretHealth1 > 0) 
    turretState1 = true;
  else 
    turretState1 = false;
  if (turretHealth2 > 0) 
    turretState2 = true;
  else 
    turretState2 = false;

  if (exitState == true) 
    exitCounter++;
  if (exitCounter == 200)
    exit();
  intro++;
}

void gameEnd(String winLose) {
  exitState = true;
  doorState = false;
  targetState = false;
  personState = false;
  turretHealth1 = 0;
  turretHealth2 = 0;
  if (winLose == "lose") {
    fill(255, 0, 0);
    background(0);
    textSize(100);
    text("You Lose", 275, 400);
    fill(0);
  }
  if (winLose == "win") {
    fill(0, 255, 0);
    background(0);
    textSize(100);
    text("You Win", 275, 400);
    fill(0);
  }
}
class Turret {
  Turret() {
  }

  void shoot(int corner) {
    headX = 50 + personX;
    headY = 600 + personY;

    if (shotRunnerUp == false && shotRunnerLow == false) {
      switch(interval) {
      case 1:
        turretBarrelX = 900;
        turretBarrelY = 40;
        xRate = -10;
        yRate = 4;
        break;

      case 2:
        turretBarrelX = 935;
        turretBarrelY = 85;
        xRate = -6;
        yRate = 8;
        break;

      case 3:
        turretBarrelX = 917;
        turretBarrelY = 63;
        xRate = -8;
        yRate = 6;
        break;
      }
      if (corner == 2) {
        if (yRate > 0) {
          yRate = -yRate;
          turretBarrelY = 700 - turretBarrelY;
        }
        shotRunnerLow = true;
        UpDefault = true;
        LowDefault = false;
      } 
      else {
        if (turretBarrelY > 100) {
          yRate = -yRate;
          turretBarrelY = 700 - turretBarrelY;
        }
        shotRunnerUp = true;
        LowDefault = true;
        UpDefault = false;
      }
      turretBulletX = turretBarrelX;
      turretBulletY = turretBarrelY;

      if (interval < 4)
        interval++;
      else
        interval = 1;
    }


    turretBulletX+= xRate;
    turretBulletY+= yRate;
    stroke(0, 255, 0);
    line(turretBarrelX, turretBarrelY, turretBulletX, turretBulletY);
    stroke(0);
    if (turretBulletX < headX + 15 && (turretBulletX > headX - 15)) {
      if (turretBulletY < headY + 17 && (turretBulletY > headY - 17)) {
        loseState = true;
      }
    }
  }
}

void intro() {
  fill(0);
  textSize(20);
  text("Welcome to the Turret Game", 370, 250);
  text("You must destroy both turrets and walk through the door", 225, 300);
  fill(255);
}

void door() {
  headX = 50 + personX;
  headY = 600 + personY;
  fill(0);
  rect(980, 180, 20, 40);
  rect(980, 480, 20, 40);
  fill(255);
  if (headX > 1050) {
    if (headY > 329 && (headY < 371)) {
      winState = true;
    }
  }
}


