class SpaceShip {
  /*____________________________________________________________
   Member Variables*/

  int x, y, health, ammo, maxAmmo, lives, rad, score;
  //float;
  //boolean;
  //String;
  char displayMode;
  color c1;

  /*____________________________________________________________
   Constructor*/

  SpaceShip(color c1) {
    score = 0;
    x = 0;
    y = 0;
    health = 100;
    maxAmmo = 20;
    ammo = 20;
    lives = 3;
    rad = 22;
    displayMode = '0';
    this.c1 = c1;
  }




  /*____________________________________________________________ 
   Member Methods*/

  //Collision w/ Rocks

  boolean rockIntersect(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);
    if (distance < rad + rock.rad) {

      return true;
    } else {
      return false;
    }
  }


  void display(int x, int y) {
    this.x = x;
    this.y = y;
    switch(displayMode) {
    case '0':
      rectMode(CENTER);
      stroke(150);

      //Engines
      fill(255, 68, 4);
      rect(x+17, y+11, 8, 8);
      rect(x-17, y+11, 8, 8);
      rect(x+28, y+11, 8, 8);
      rect(x-28, y+11, 8, 8);

      //Weapon Barrels
      fill(255);
      strokeWeight(4);
      line(x+11, y-20, x+11, y);
      line(x-12, y-20, x-12, y);

      //Wings
      strokeWeight(1);
      fill(244, 146, 64);
      triangle(x, y-20, x+40, y+10, x-40, y+10);

      //Body
      ellipse(x, y-15, 15, 80);
      fill(1, 138, 202);
      ellipse(x, y-30, 7, 20);
      break;
    }
  }
}
