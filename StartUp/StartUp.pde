Button Bplay = new Button(200, 250, "Play Game");
Button Brules = new Button(200, 285, "How to Play");
boolean gameStart = false;
boolean rules = false;
void setup() {
  size(500, 500);
  frameRate(60);
}
void draw() {
  background(255);
  if (!gameStart && !rules) {
    Bplay.show();
    Brules.show();

    if (Brules.checkHitBox())
      rules = true;
    if (Bplay.checkHitBox())
      gameStart = true;
  } else if (rules) 
    showRules();
  else if (gameStart)
    gameRunner();
}

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
    noFill();
    rect(bx, by, 100, 25, 4);
    fill(0);
    text(text, bx + 10, by + 20);
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
  text("How to Move", 210, 300);
  text("Use wasd to move up, left, down, and right", 100, 320);
  text("How to Shoot", 210, 230);
  text("Point your cursor and right click to shoot", 105, 250);
  text("How to Win", 210, 170);
  text("Move your player through the door", 120, 190);
}
void gameRunner() {
  println("game");
}