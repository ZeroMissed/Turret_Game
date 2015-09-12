class Person {
  private int personX, personY, speed, headX, headY, gunBarrelX, gunBarrelY, legCounter;
  private boolean personState;
  private int frontLegX = 60; 
  private int backLegX = 40; 
  public Person(int personX, int personY, int speed, boolean personState) {
    this.personX = personX;
    this.personY = personY;
    this.personState = personState;
    this.speed = speed;
  } 
  
  int returnHeadLoc(String xy) {
    if (xy == "x")
      return headX;
    else
      return headY;
  }
  
  void setState(boolean trueFalse){
    personState = trueFalse;
  }
  boolean getState(){
    return personState;
  }
  void showAndShoot() {
    if (personState) {
      headY = 600 + personY;
      headX = 50 + personX;
      gunBarrelX = 77 + personX;
      gunBarrelY = 630 + personY;
      
      //creates man
      ellipse(headX, headY, 34, 40);
      line(50 + personX, 620 + personY, 50 + personX, 655 + personY);
      line(50 + personX, 655 + personY, backLegX + personX, 690 + personY);
      line(50 + personX, 655 + personY, frontLegX + personX, 690 + personY);

      //creates gun and moves gun
      int distX = personX + 50 - mouseX;
      int distY = personY + 639 - mouseY;

      //pushes current xy plain
      pushMatrix();

      translate(personX + 50, personY + 635);

      float angle = atan((distY + .01) / (distX +.01));

      if (distX < 0) {
        angle += PI;
      }
      angle += PI;
      //rotates the xyplain to point gun towards the mouse
      rotate(angle);

      translate(-(personX + 50), -(personY + 635));

      //draw arm and gunss
      line(50 + personX, 635 + personY, 65 + personX, 635 + personY); //arm of man
      strokeWeight(3);
      line(65 + personX, 639 + personY, 65 + personX, 630 + personY); // gun handle
      line(65 + personX, 630 + personY, gunBarrelX, gunBarrelY); // gun barrel
      noFill();
      rect(65 + personX, 630 + personY, 4, 3); //trigger box
      
      this.shoot();

      //reverts to pushed xy plain
      popMatrix();


      //creates target
      fill(255);
      ellipse(mouseX, mouseY - 10, 30, 30);
      fill(0);
      line(mouseX, mouseY - 25, mouseX, mouseY + 5);
      line(mouseX - 15, mouseY - 10, mouseX + 15, mouseY - 10);
    }
  }

  void move() {
    if (keyPressed) {
      if (key == 'w') 
        personY -= speed;
      if (key == 'a') 
        personX -= speed;
      if (key == 's') 
        personY += speed;
      if (key == 'd') 
        personX += speed;
        
        if (key == 'w' || key == 'a' || key == 's' || key == 'd'){
       this.moveLegs(); 
        }
    }
  }
  
  void moveLegs(){
    if(legCounter == 0){
      frontLegX = 70;
      backLegX = 30;
    }
    if(legCounter == 1){
      frontLegX = 60;
      backLegX = 40;
    }
    if(legCounter == 2){
      frontLegX = 50;
      backLegX = 50;
      legCounter = 0;
    }
    legCounter++;
  }
  void shoot() {
    //makes sure the line gets to the mouse bc line y has to be equal to barrel y
    float mouseS = personX + 50 + sqrt(sq(mouseX - (personX + 50)) + sq(mouseY - (personY + 635)));

    if (mousePressed == true && (mouseButton == LEFT)) {
      // Draw the red laser line
      stroke(255, 0, 0);
      line(gunBarrelX, gunBarrelY, mouseS, gunBarrelY);
      stroke(0, 0, 0); 

      //check if turrets are hit
      if (mouseX < 1000 && mouseX > 950) 
        if (mouseY < 40 && mouseY > 0) 
          urTurret.removeHealth(1);
      if (mouseX < 1000 && mouseX > 950) 
        if (mouseY < 700 && mouseY > 660) 
          brTurret.removeHealth(1);
      if (mouseX < 50 && mouseX > 0) 
        if (mouseY < 700 && mouseY > 650) 
          blTurret.removeHealth(1);
      if (mouseX < 50 && mouseX > 0) 
        if (mouseY < 50 && mouseY > 0) 
          ulTurret.removeHealth(1);
    }
  }
}