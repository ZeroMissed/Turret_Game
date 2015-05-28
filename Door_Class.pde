class Door {
  private String side;
  
  Door(String side) {
    this.side = side;
  }

  void show() {
    headX = 50 + personX;
    headY = 600 + personY;
    int doorX;
    int doorY;
    fill(0);
    if (side == "top" || side == "bottom") {
      if (side == "top")
        doorY = 0;
      else
        doorY = 680;
      rect(350, doorY, 40, 20);
      rect(650, doorY, 40, 20);
    }

    if (side == "right" || side == "left") {
      if (side == "right")
        doorX = 980;
      else
        doorX = 0;
      rect(doorX, 180, 20, 40);
      rect(doorX, 480, 20, 40);
    }

    fill(255);
    if (headX > 1050 && headY > 240 && (headY < 392))
      winState = true;
  }
  void chooseDoor() {
    switch((int)random(4)) {
    case 0: 
      door = topDoor;
      break;
    case 1: 
      door = bottomDoor;
      break;
    case 2: 
      door = leftDoor;
      break;
    case 3: 
      door = rightDoor;
      break;
    }
  }

    void checkDoors() {
      if (door == topDoor)
        if (headY < -70 && headX > 360 && headX < 640)
          winState = true;

      if (door == bottomDoor)
        if (headY > 770 && headX > 360 && headX < 640)
          winState = true;

      if (door == leftDoor)
        if (headX < -50 && headY > 240 && headY < 392)
          winState = true;

      if (door == rightDoor)
        if (headX > 1050 && headY > 240 && headY < 392)
          winState = true;
    }
  }

