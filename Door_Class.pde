class Door {
  private String side;

  public Door(String side) {
    this.side = side;
  }
  void show() {
    if(person.getState()) {
      fill(0);
      rect(980, 180, 20, 40);
      rect(980, 480, 20, 40);
      noFill();
  }
  }

  void checkDoor() {
    int headX = person.returnHeadLoc("x");
    int headY = person.returnHeadLoc("y");
      if (headX > 1050 && headY > 240 && headY < 392  && !blTurret.returnState() && !brTurret.returnState() && !ulTurret.returnState() && !urTurret.returnState())
        winState = true;
}
}