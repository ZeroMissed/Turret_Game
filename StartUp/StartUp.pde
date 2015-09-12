Button play = new Button(200, 250, "Play Game");
Button rules = new Button(200, 285, "Rules");
void setup(){
size(500, 500);
frameRate(60);
}
void draw(){
  play.show();
  rules.show();
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

void checkHitBox(){
  if(mousePressed){
  if(mouseX < bx + 100 && mouseX > bx && mouseY < by + 25 && mouseY > by){
    if(text == "Play Game") 
  println("'play' button pressed");
    else
  println("'rules' button pressed");
  }
  }
}
}