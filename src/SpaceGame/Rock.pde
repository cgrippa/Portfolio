class Rock {

  //Member Variables

  int x, y, dia, health, speed, rad;
  char displayMode;
  color c;

  //Constructor

  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    health = int(random(20, 40));
    dia = health;
    rad = dia;
    displayMode = '0';
    c = #9B6319;
    speed = int(random(2,3));
  }

  //Member Methods


  boolean reachedBottom() {
    if (y - dia > height) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y += speed;
  }

  void display() {
    dia = health;
    rad = dia;
    fill(c);
    noStroke();
    ellipse(x, y, dia, dia);
  }
}
