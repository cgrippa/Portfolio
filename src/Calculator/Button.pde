class Button {
  // Member Variables
  int x, y, w, h;
  String val;
  color c1, c2, c3, c4;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = #E6E6E6;
    c2 = #9A9A9A;
    c3 = #CC6500;
    c4 = #904708;
    hover = false;
    this.isNumber = isNumber;
  }

  // Method for Display
  void display() {
    if (isNumber) { // Number Buttons. (Grey Buttons)
      if (hover) {
        fill(c1);
      } else {
        fill(c2);
      }
      rect(x, y, w, h);
      fill(0);
      textAlign(CENTER);
      text(val, x+w/2, y+h/2);
    } else { //Non-number button.(Orange Buttons & Clear)
      if (hover) {
        fill(c3);
      } else {
        fill(c4);
      }
      rect(x, y, w, h);
      fill(0);
      textAlign(CENTER);
      text(val, x+w/2, y+h/2);
    }
  }

  // Method for mouse interaction
  void hover() {
    hover = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}
