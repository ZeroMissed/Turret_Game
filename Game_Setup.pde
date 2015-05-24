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

void intro() {
  turretHealth1 = 100;
  turretHealth2 = 100;
  personState = true;
  targetState = true;
  fill(0);
  textSize(20);
  text("Welcome to the Turret Game", 370, 250);
  text("You must destroy both turrets and walk through the door", 225, 300);
  fill(255);
}

void gameEnd(String winLose) {
  exitState = true;
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

