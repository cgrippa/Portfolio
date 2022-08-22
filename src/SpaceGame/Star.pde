class Star {
  //Member Variables

  int x, y;
  float speed;
  color c;

  //Constructor

  Star(int x, int y) {
    this.x = x;
    this.y = y;
    speed = random(2, 6);
    c = 255;
  }

  boolean reachedBottom() {
    if (y > height) {
      return true;
    } else {
      return false;
    }
  }

  //Member Methods


  void move() {
    y += speed;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, 3, 2);
  }
}
