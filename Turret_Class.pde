class Turret {
  private int turretHealth, turretBarrelX, turretBarrelY, turretBulletX, turretBulletY, bulletCounter, headX;
  private boolean turretState, shotRunner, firing;
  private String corner;
  private float  xRate, yRate;

  public Turret(String corner, boolean turretState, int turretHealth) {
    this.corner = corner;
    this.turretState = turretState;
    this.turretHealth = turretHealth;
    this.shotRunner = shotRunner;
    this.firing = firing;
  }

  void showAndShootAll() {
    urTurret.show();
    ulTurret.show();
    brTurret.show();
    blTurret.show();
    urTurret.shoot();
    ulTurret.shoot();
    brTurret.shoot();
    blTurret.shoot();
  }
  void setShotRunner(boolean trueFalse) {
    shotRunner = trueFalse;
  }
  void removeHealth(int numberToRemove) {
    turretHealth -= numberToRemove;
    this.checkHealth();
  }

  void checkHealth() {
    if (turretHealth > 0) 
      turretState = true;
    else {
      turretState = false;
      shotRunner = false;
    }
  }

  boolean returnState() {
    this.checkHealth();
    return turretState;
  }

  void makeOnlyShotRunner() {
    urTurret.setShotRunner(false);
    ulTurret.setShotRunner(false);
    brTurret.setShotRunner(false);
    blTurret.setShotRunner(false);
    shotRunner = true;
  }

  void shoot() {

    if (frameCounter == 60) 
      urTurret.move();

    if (frameCounter == 160) 
      ulTurret.move();

    if (frameCounter == 260) 
      brTurret.move();

    if (frameCounter == 360) {
      frameCounter = 0;
      blTurret.move();
    }

    frameCounter++; 
    if (bulletCounter >= 100) {
      urTurret.setShotRunner(false);
      ulTurret.setShotRunner(false);
      brTurret.setShotRunner(false);
      blTurret.setShotRunner(false);
      bulletCounter = 0;
    }

    if (turretState) {
      if (shotRunner) {
        this.move();
        this.takeShot();
        bulletCounter++;
      }
    }
  }

  void show() {
    fill(0);
    int xMod = 0;
    int yMod = 0;
    int xDef = 0;
    int yDef = 0;
    int hpBarX = 890;
    int hpBarY = 6;
    
    
    if (corner == "ul") {
      xMod = -1000;
      xDef = -800;
      hpBarX = 10;
      
    }
    if (corner == "br") {
      yMod = 700;
      yDef = 620;
      hpBarY = 690;
    }
    if (corner == "bl") {
      xMod = -1000;
      yMod = 700;
      xDef = -800;
      yDef = 620;
      hpBarX = 10;
      hpBarY = 690;
    }
    if (turretState) {
      if (shotRunner) {
        ellipse(1000 + xMod, 0 + yMod, 125, 125);
        line(1000 + xMod, 0 + yMod, turretBarrelX, turretBarrelY);
      } else {
        ellipse(1000 + xMod, 0 + yMod, 125, 125);
        line(1000 + xMod, 0 + yMod, 900 + xDef, 40 + yDef);
      }
      smooth();
      rect(hpBarX, hpBarY, 100, 7, 5);
      fill(255, 0, 0);
      rect(hpBarX, hpBarY, turretHealth/2, 7, 5);
      fill(0);
    }
  }

  void move() {
    int headX = person.returnHeadLoc("x");
    int headY = person.returnHeadLoc("y");
    if (turretState) {
      if (!urTurret.shotRunner && !ulTurret.shotRunner && !brTurret.shotRunner && !blTurret.shotRunner) {
        switch(interval) {

        case 1:
          turretBarrelX = 900;
          turretBarrelY = 40;
          break;

        case 2:
          turretBarrelX = 935;
          turretBarrelY = 85;
          break;

        case 3:
          turretBarrelX = 917;
          turretBarrelY = 63;
          break;
        }

        if (interval == 3)
          interval = 1;
        else
          interval++;

        this.makeOnlyShotRunner();
       
        if (corner == "ul") {
          turretBarrelX = 1000 - turretBarrelX;
        }
        

        if (corner == "br") {
          
          turretBarrelY = 700 - turretBarrelY;
        }

        if (corner == "bl") {
          turretBarrelX = 1000 - turretBarrelX;
          turretBarrelY = 700 - turretBarrelY;
        }
        yRate = (bulletMult * (turretBarrelY - headY))/50;
        xRate = (bulletMult * (turretBarrelX - headX))/50;
        yRate = -yRate;
        xRate = -xRate;
        println(xRate);
        println(yRate);

        turretBulletX = turretBarrelX;
        turretBulletY = turretBarrelY;
      }
    }
  }

  void takeShot() {
    int headX = person.returnHeadLoc("x");
    int headY = person.returnHeadLoc("y");
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

