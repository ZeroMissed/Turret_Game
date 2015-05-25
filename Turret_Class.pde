
class Turret {
  String corner;
  int turretHealth;
  boolean turretState;
  Turret(String corner, boolean turretState, int turretHealth) {
    this.corner = corner;
    this.turretState = turretState;
    this.turretHealth = turretHealth;
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

  void removeHealth(int numberToRemove) {
    turretHealth -= numberToRemove;
  }

  void shoot() {
    headX = 50 + personX;
    headY = 600 + personY;
    if (turretState == true) {
      if (shotRunnerUr == false && shotRunnerBr == false) {
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

        if (corner == "br") {
          if (yRate > 0) {
            yRate = -yRate;
            turretBarrelY = 700 - turretBarrelY;
          }
          shotRunnerBr = true;
          urFiring = true;
          brFiring = false;
        } 
        if (corner == "ur") {
          if (turretBarrelY > 100) {
            yRate = -yRate;
            turretBarrelY = 700 - turretBarrelY;
          }
          shotRunnerUr = true;
          brFiring = true;
          urFiring = false;
        }
        turretBulletX = turretBarrelX;
        turretBulletY = turretBarrelY;

        if (interval < 4)
          interval++;
        else
          interval = 1;
      }


      turretBulletX += xRate;
      turretBulletY += yRate;
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
  void show() {
    fill(0);
  if (urFiring) {
    if (corner == "ur") {
      if (urTurret.returnState()) {
        ellipse(1000, 0, 125, 125);
        line(1000, 0, 900, 40);
      }
      if (brTurret.returnState()) {
        ellipse(1000, 700, 125, 125);
        line(1000, 700, turretBarrelX, turretBarrelY);
      }
    }
  }
  if (brFiring){ 
    if (corner == "br") {
      if (brTurret.returnState()) {
        ellipse(1000, 700, 125, 125);
        line(1000, 700, 900, 660);
      }
      if (urTurret.returnState()) {
        ellipse(1000, 0, 125, 125);
        line(1000, 0, turretBarrelX, turretBarrelY);
      }
    }
  }
    fill(255);
  }
}

