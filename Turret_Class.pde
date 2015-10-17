class Turret {
  private int turretHealth, bulletCounter;
  private boolean turretState, shotRunner, firing;
  private String corner;
  private float  xRate, yRate, turretBBulletX, turretBBulletY, turretBulletX, turretBulletY, turretBarrelX, turretBarrelY;

  public Turret(String corner, boolean turretState, int turretHealth) {
    this.corner = corner;
    this.turretState = turretState;
    this.turretHealth = turretHealth;
  }

  void showAndShootAll() {
    if(!startSequence) {
    urTurret.shoot();
    ulTurret.shoot();
    brTurret.shoot();
    blTurret.shoot();
    }
    urTurret.show();
    ulTurret.show();
    brTurret.show();
    blTurret.show();
  }
  void resetTurrets() {
    urTurret.setHealth(200);
    ulTurret.setHealth(200);
    brTurret.setHealth(200);
    blTurret.setHealth(200);
    urTurret.bulletCounter = 0;
    ulTurret.bulletCounter = 0;
    urTurret.bulletCounter = 0;
    urTurret.bulletCounter = 0;
    frameCounter = 0;
  }
  void setShotRunner(boolean trueFalse) {
    shotRunner = trueFalse;
  }
  void setHealth(int h){
    turretHealth = h;
    this.checkHealth();
  }
  void changeHealth(int n) {
    if(!startSequence)
    turretHealth += n;
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
    int headX = person.returnHeadLoc("x");
    int headY = person.returnHeadLoc("y");
    fill(0);
    int xLoc = 0;
    int yLoc = 0;
    int hpBarX = 890;
    int hpBarY = 6;

    if (corner == "ur") 
      xLoc = 1000;

    if (corner == "ul") 
      hpBarX = 10;

    if (corner == "br") {
      xLoc = 1000;
      yLoc = 700;
      hpBarY = 690;
    }
    if (corner == "bl") {
      yLoc = 700;
      hpBarX = 10;
      hpBarY = 690;
    }
    if (turretState) {
      ellipse(xLoc, yLoc, 125, 125);

      int distX = xLoc - headX;
      int distY = yLoc - headY;

      //pushes current xy plain
      pushMatrix();

      translate(xLoc, yLoc);

      float angle = atan((distY + .01) / (distX +.01));

      if (distX < 0) {
        angle += PI;
      }
      angle += PI;
      //rotates the xyplain to point gun towards the mouse
      rotate(angle);

      translate(-xLoc, -yLoc);
      line(xLoc, yLoc, xLoc + 100, yLoc);
      //reverts to pushed xy plain
      popMatrix();

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
        this.makeOnlyShotRunner();
        turretBarrelX = 0;
        turretBarrelY = 0;
        if (corner == "ur")
          turretBarrelX = 1000;

        if (corner == "br") {
          turretBarrelX = 1000;
          turretBarrelY = 700;
        }

        if (corner == "bl") 
          turretBarrelY = 700;

        yRate = -(bulletMult * (turretBarrelY - headY))/50;
        xRate = -(bulletMult * (turretBarrelX - headX))/50;

        turretBulletX = turretBarrelX;
        turretBulletY = turretBarrelY;
        turretBBulletX = turretBarrelX;
        turretBBulletY = turretBarrelY;
      }
    }
  }

  void takeShot() {
    int headX = person.returnHeadLoc("x");
    int headY = person.returnHeadLoc("y");
    turretBulletX += xRate;
    turretBulletY += yRate;
    if (bulletCounter > 5) {
      turretBBulletX += xRate;
      turretBBulletY += yRate;
    }

    if (colorChange == 20) {
      r = (int) random(255);
      g = (int) random(255);
      b = (int) random(255);
      colorChange = 0;
    }
    colorChange++;
    stroke(r, g, b);
    line(turretBBulletX, turretBBulletY, turretBulletX, turretBulletY);
    stroke(0);
    if (turretBulletX < headX + 15 && (turretBulletX > headX - 15)) 
      if (turretBulletY < headY + 17 && (turretBulletY > headY - 17)) 
        loseState = true;
  }
}