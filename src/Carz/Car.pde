class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean randDirection, randColor;

  Car() {
    c = #E1CF35;
    xpos = random(width);
    ypos = random(height);
    xspeed = random(3,6);
    if (random(100)>50) {
      randDirection = true;
      randColor = true;
    } else {
      randDirection = false;
      randColor = true;
    }
    if (randColor) {
      c = color(random(255), random(255), random(255));
    }
  }

  void display() {
    rectMode(CENTER);
    fill(0);
    //wheels
    rect(xpos-12, ypos+8, 6, 4,1);
    rect(xpos-12, ypos-8, 6, 4,1);
    rect(xpos+12, ypos+8, 6, 4,1);
    rect(xpos+12, ypos-8, 6, 4,1);
    
    //body
    fill(c);
    rect(xpos, ypos, 30, 15,4);
  }

  void drive() {
    if (randDirection) {
      xpos += xspeed;
      if (xpos > width) {
        xpos = 0;
        ypos = random(height);
        xspeed = random(3, 6);
      }
    } else {
      xpos -= xspeed;
      if (xpos < 0) {
        xpos = width;
        ypos = random(height);
        xspeed = random(3, 6);
      }
    }
  }
}
