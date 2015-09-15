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
  textSize(15);
  textAlign(CENTER);
  fill(180, 0, 0);
  rect(330, 230, 340, 190);
  fill(0);
  text("How to Move", width/2, 380);
  text("Use wasd to move up, left, down, and right", width/2, 400);
  text("How to Shoot", width/2, 310);
  text("Point your cursor and right click to shoot", width/2, 330);
  text("How to Win", width/2, 250);
  text("Move your player through the door", width/2, 270);
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
  rightDoor.checkDoor();
  rightDoor.show();
}

void gameEnd(boolean win) {
  exitState = true;
  person.setState(false);
  urTurret.removeHealth(100);
  ulTurret.removeHealth(100);
  brTurret.removeHealth(100);
  blTurret.removeHealth(100);
  textFont(loadFont("Font.vlw"));
  if (!win) {
    background(0);
    textSize(100);
    fill(255, 0, 0);
    text("Wasted", 500, 400);
    fill(0);
  }
  if (win) {
    fill(0, 255, 0);
    background(0);
    textSize(100);
    text("You Win", 500, 400);
    fill(0);
  }
}