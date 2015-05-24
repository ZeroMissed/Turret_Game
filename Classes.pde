
class Turret {
  int corner, TurretHealth;
  boolean turretState = true;
  Turret(int corner) {
    this.corner = corner;
    this.turretState = turretState;
  }
  
  void checkHealth() {
    if (turretHealth1 > 0) 
      turretState = true;
    else 
      turretState = false;
  }

  boolean returnState() {
    this.checkHealth();
    return turretState;
  }
  
  void shoot() {
    headX = 50 + personX;
    headY = 600 + personY;
if(turretState == true){
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
        println("hi");
        shotRunnerLow = true;
        UpDefault = true;
        LowDefault = false;
      }
       else if(corner == 1){
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
 
  void drawTurret(){
    
    fill(0);
  if (LowDefault) {
    if (BrTurret.returnState()) {
      ellipse(1000, 0, 125, 125);
      line(1000, 0, turretBarrelX, turretBarrelY);
   }
    if (UrTurret.returnState()) {
      ellipse(1000, 700, 125, 125);
      line(1000, 700, 900, 660);
    }
  }
  if (UpDefault) {
    if (UrTurret.returnState()) {
      ellipse(1000, 700, 125, 125);
      line(1000, 700, turretBarrelX, turretBarrelY);
    }
    if (BrTurret.returnState()) {
      ellipse(1000, 0, 125, 125);
      line(1000, 0, 900, 40);
    }
  }
  fill(255);
  }
}

