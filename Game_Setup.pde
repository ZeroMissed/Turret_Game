public class Button {
  private int bx;
  private int by;
  private String text;

  public Button(int x, int y, String text) {
    this.bx = x;
    this.by = y;
    this.text = text;
  }


  void show() {
    fill(180, 0, 0);
    rect(bx, by, 100, 25, 4);
    fill(0);
    pushMatrix();
    translate(bx + 50, by + 18);
    textAlign(CENTER);
    textSize(12);
    text(text, 0, 0);
    popMatrix();
  }

  boolean checkHitBox() {
    boolean tf = false;
    if (mousePressed) {
      if (mouseX < bx + 100 && mouseX > bx && mouseY < by + 25 && mouseY > by)
        tf = true;
    }
    return tf;
  }
}

void showRules() {
  textAlign(CENTER);
  fill(180, 0, 0);
  rect(330, 230, 340, 190);
  fill(0);
  text("How to Move", width/2, 380);
  text("Use wasd to move up, left, down, and right", width/2, 400);
  text("How to Shoot", width/2, 310);
  text("Point your cursor and right click to shoot", width/2, 330);
  text("How to Win", width/2, 250);
  text("Destroy all the turrets and navigate through the gate", width/2, 270);
}

void gameRunner() {
  noCursor();
  if (loseState) {
    gameEnd(false);
    winState = false;
  }

  if (winState) 
    gameEnd(true); 

  if (loseState == false && winState == false)
    background(255);

  fill(255, 0, 0);
  textSize(15);
  textAlign(CENTER, CENTER);
  if (mouseRun) {
    text("Point your cursor at a target and click to shoot", width/2, 330);
    if (abs(mouseX - 450) > 150 && mousePressed) {
      keyRun = true;
      mouseRun = false;
    }
  } else if (keyRun) {
    text("Use wasd to move up, left, down, and right", width/2, 330);
    for (int i = 0; i < 4; i++) {
      if (keys[i]) 
        keyCnt += i;
      if (keyCnt >= 30) {
        keyRun = false;
        break;
      }
    }
  } else {
    if (startCount < 180) 
      text("Destroy all the turrets and navigate through the gate to win", width/2, 330);
    else if (startCount < 420) {
      countDown();
    } else
      startSequence = false;
    startCount++;
  }
  fill(255);

  if (restartState == true) 
    restartCounter++;
  if (restartCounter >= 60) {
    startSequence = true;
    startCount = 180;
    person.resetDef();
    gameStart = false;
    winState = false;
    loseState = false;
    bulletMult = 1;
    restartState = false;
    restartCounter = 0;
    urTurret.resetTurrets();
  }

  person.move();
  person.showAndShoot();
  urTurret.showAndShootAll();
  rightDoor.checkDoor();
  rightDoor.show();
}

void countDown() {
  fill(255, 0, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  pushStyle();

  if (startCount < 240) 
    text("3", width/2, height/2);
  else if (startCount < 300) 
    text("2", width/2, height/2);
  else if (startCount < 360) 
    text("1", width/2, height/2);
  else if (startCount < 420) 
    text("GO!", width/2, height/2);

  popStyle();
}


void gameEnd(boolean win) {
  cursor();
  noStroke();
  restartState = true;
  person.setState(false);
  urTurret.setHealth(0);
  ulTurret.setHealth(0);
  brTurret.setHealth(0);
  blTurret.setHealth(0);
  textAlign(CENTER, CENTER);
  if (!win) {
    background(0);
    textSize(100);
    fill(255, 0, 0);
    text("Wasted", 500, 350);
    fill(0);
  }
  if (win) {
    fill(0, 255, 0);
    background(0);
    textSize(100);
    text("You Win", 500, 350);
    fill(0);
  }
}