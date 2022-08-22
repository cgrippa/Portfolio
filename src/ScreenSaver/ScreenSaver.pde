float x, y, strokeW, pointCount;


void setup() {
  fullScreen();
  x = random(width);
  y = random(height);
}


void draw() {
  strokeW = random(1, 5);
  pointCount = random(2, 3);
  if (x > width || x < 0 || y > height || y < 0) {
    x = random(width);
    y = random(height);
  } else {
    if (random(100) > 75) {
      moveUp(x, y, pointCount);
    } else if (random(100) > 50) {
      moveLeft(x, y, pointCount);
    } else if (random(100) > 25) {
      moveDown(x, y, pointCount);
    } else if (random(100) > 0) {
      moveRight(x, y, pointCount);
    }
  }
}


void moveRight(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX+i, startY);
    x = startX+i;
    //y = startY;
  }
}


void moveLeft(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX-i, startY);
    x = startX-i;
    //y = startY;
  }
}


void moveUp(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY-i);
    y = startY-i;
  }
}


void moveDown(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY+i);
    y = startY+i;
  }
}
