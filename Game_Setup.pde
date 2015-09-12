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
    if(!rules) {
    fill(180, 0, 0);
  }
    else
    noFill();
    rect(bx, by, 100, 25, 4);
    fill(0);
    pushMatrix();
    translate(bx + 50, by + 18);
    textAlign(CENTER);
    text(text, 0, 0);
    popMatrix();
    this.checkHitBox();
  }

  boolean checkHitBox() {
    boolean tf = false;
    if (mousePressed) 
      if (mouseX < bx + 100 && mouseX > bx && mouseY < by + 25 && mouseY > by)
        tf = true;
        return tf;
  }
}

void showRules() {
  textSize(15);
  textAlign(CENTER);
  text("How to Move", width/2, 280);
  text("Use wasd to move up, left, down, and right", width/2, 300);
  text("How to Shoot", width/2, 210);
  text("Point your cursor and right click to shoot", width/2, 230);
  text("How to Win", width/2, 150);
  text("Move your player through the door", width/2, 170);
}

void gameRunner(){
   bulletMult+=.001;
  if (loseState)
    gameEnd(false);

  if (winState) 
    gameEnd(true);

  if (loseState == false && winState == false)
    background(255);


  if (exitState == true) 
    exitCounter++;
  if (exitCounter == 200)
    exit();

  person.move();
  person.showAndShoot();
  
  urTurret.showAndShootAll();
  door.checkDoors();
  rightDoor.show();
}

void gameEnd(int win) {
  exitState = true;
  person.setState(false);
  urTurret.removeHealth(100);
  ulTurret.removeHealth(100);
  brTurret.removeHealth(100);
  blTurret.removeHealth(100);
  if (!win) {
    fill(255, 0, 0);
    background(0);
    textSize(100);
    text("You Lose", 275, 400);
    fill(0);
  }
  if (winLose) {
    fill(0, 255, 0);
    background(0);
    textSize(100);
    text("You Win", 275, 400);
    fill(0);
  }
}

