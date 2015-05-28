

void intro() {
  personState = true;
  targetState = true;
  fill(0);
  textSize(20);
  text("Welcome to the Turret Game", 370, 250);
  text("You must destroy both turrets and walk through the door", 225, 300);
  fill(255);
}

void gameEnd(int winLose) {
  exitState = true;
  targetState = false;
  personState = false;
  urTurret.removeHealth(100);
  ulTurret.removeHealth(100);
  brTurret.removeHealth(100);
  blTurret.removeHealth(100);
  if (winLose == 0) {
    fill(255, 0, 0);
    background(0);
    textSize(100);
    text("You Lose", 275, 400);
    fill(0);
  }
  if (winLose == 1) {
    fill(0, 255, 0);
    background(0);
    textSize(100);
    text("You Win", 275, 400);
    fill(0);
  }
}

