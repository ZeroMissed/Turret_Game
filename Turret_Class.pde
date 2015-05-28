class Turret {
  String corner;
  int turretHealth;
  boolean turretState, shotRunner, firing;
  Turret(String corner, boolean turretState, int turretHealth) {
    this.corner = corner;
    this.turretState = turretState;
    this.turretHealth = turretHealth;
    this.shotRunner = shotRunner;
    this.firing = firing;
  }

  void checkHealth() {
    if (turretHealth > 0) 
      turretState = true;
    else 
      turretState = false;
  }

  boolean returnState() {
    this.checkHealth();
    return turretState;
  }

  void makeOnlyShotRunner() {
    urTurret.shotRunner = false;
    ulTurret.shotRunner = false;
    brTurret.shotRunner = false;
    blTurret.shotRunner = false;
    shotRunner = true;
  }

  void removeHealth(int numberToRemove) {
    turretHealth -= numberToRemove;
    this.checkHealth();
  }

  void shoot() {

    if (frameCounter == 60) {
      frameCounter++;
      urTurret.move();
    } 

    if (frameCounter == 160) {
      frameCounter++;
      ulTurret.move();
    }
    if (frameCounter == 260) {
      frameCounter++;
      brTurret.move();
    } 

    if (frameCounter == 360) {
      frameCounter = 0;
      blTurret.move();
    }

    if (bulletCounter >= 100) {
      urTurret.shotRunner = false;
      ulTurret.shotRunner = false;
      brTurret.shotRunner = false;
      blTurret.shotRunner = false;
      bulletCounter = 0;
    }
    if (turretState) {
      if (shotRunner) {
        this.move();
        this.takeShot();
        bulletCounter++;
      }
    }
    frameCounter++;
  }

  void show() {
    fill(0);
    int xMod = 0;
    int yMod = 0;
    int xDef = 0;
    int yDef = 0;
    if (corner == "ul") {
      xMod = -1000;
      xDef = -800;
    }
    if (corner == "br") {
      yMod = 700;
      yDef = 620;
    }
    if (corner == "bl") {
      xMod = -1000;
      yMod = 700;
      xDef = -800;
      yDef = 620;
    }
    if (shotRunner) {
      ellipse(1000 + xMod, 0 + yMod, 125, 125);
      line(1000 + xMod, 0 + yMod, turretBarrelX, turretBarrelY);
    } else {
      ellipse(1000 + xMod, 0 + yMod, 125, 125);
      line(1000 + xMod, 0 + yMod, 900 + xDef, 40 + yDef);
    }
    fill(255);
  }

  void move() {
    if (urTurret.shotRunner == false && ulTurret.shotRunner == false && brTurret.shotRunner == false && blTurret.shotRunner == false) {
      switch(interval) {

      case 1:
        turretBarrelX = 900;
        turretBarrelY = 40;
        xRate = -20;
        yRate = 8;
        break;

      case 2:
        turretBarrelX = 935;
        turretBarrelY = 85;
        xRate = -12;
        yRate = 16;
        break;

      case 3:
        turretBarrelX = 917;
        turretBarrelY = 63;
        xRate = -16;
        yRate = 12;
        break;
      }

      if (interval == 3)
        interval = 1;
      else
        interval++;

      this.makeOnlyShotRunner();

      if (corner == "ul") {
        xRate = -xRate;
        turretBarrelX = 1000 - turretBarrelX;
      }

      if (corner == "br") {
        yRate = -yRate;
        turretBarrelY = 700 - turretBarrelY;
      }

      if (corner == "bl") {
        xRate = -xRate;
        turretBarrelX = 1000 - turretBarrelX;
        yRate = -yRate;
        turretBarrelY = 700 - turretBarrelY;
      }

      turretBulletX = turretBarrelX;
      turretBulletY = turretBarrelY;
    }
  }

  void takeShot() {
    headX = 50 + personX;
    headY = 600 + personY;
    turretBulletX += xRate;
    turretBulletY += yRate;
    stroke(0, 255, 0);
    line(turretBarrelX, turretBarrelY, turretBulletX, turretBulletY);
    stroke(0);
    if (turretBulletX < headX + 15 && (turretBulletX > headX - 15)) 
      if (turretBulletY < headY + 17 && (turretBulletY > headY - 17)) 
        loseState = true;
  }
}

