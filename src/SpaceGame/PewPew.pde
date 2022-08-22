class PewPew {
  //Member Variables

  int x, y, speed, rad, power;
  color c;

  //Constructor

  PewPew(int x, int y, color c) {
    this.x = x;
    this.y = y;
    power = 5;
    rad = 1;
    speed = 4;
    this.c = c;
  }

  //Member Methods

  void fire() {
    y -= speed;
  }

  boolean rockIntersect(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);
    if (distance < rad + rock.rad) {
      rock.health -= power;
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    if (y < -3) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 2, 6);
  }
}
