class BadGuy {
  /*____________________________________________________________
   Member Variables*/

  int x, y, health;
  //float;
  //boolean;
  //String;
  char displayMode;
  color c1;

  /*____________________________________________________________
   Constructor*/

  BadGuy(color c1, int x, int y) {
    this.x = x;
    this.y = y;
    health = 100;
    displayMode = '0';
    this.c1 = c1;
  }

  /*____________________________________________________________ 
   Member Methods*/

  void display() {
    switch(displayMode) {
    case '1':
      //TODO: Create enemy graphic.
      break;
    }
  }
}
