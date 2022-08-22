/* SpaceGame | Dec 2020
 By Caelan Grippa
 TODO: */

SpaceShip s1;
ArrayList<PewPew> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
Timer timer;
Timer ammoTimer;
Timer laserTimer;

int pass, rockRate, level, rockCount, laserCount;
boolean play, ticker, gameWin, gameLose;
String ticText;


void setup() {

  surface.setTitle("Space!");
  surface.setResizable(true);
  size(600, 600);
  background(0);
  s1 = new SpaceShip(123);

  //Arrays
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();

  //Timers
  timer = new Timer(int(random(500, 1000)));

  ammoTimer = new Timer(500);

  laserTimer = new Timer(100);

  //Variables
  pass = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  play = true;
  gameWin = false;
  gameLose = false;
  ticker = false;
  ticText = "";

  timer.start();
  laserTimer.start();
}

void draw() {
  if (s1.health < 1) {
    play = false;
    gameLose = true;
    gameOver(false, true);
  } else if (pass > 100) {
    play = false;
    gameWin = true;
    gameOver(true, false);
  } 


    noCursor();
    background(0);
    fill(0);

    stars.add(new Star(int(random(width)), int(random(height/10))));

    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(600)), 0));
      timer.start();
    } 

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();

      //Check if defeated

      if (rock.dia < 6) {
        rocks.remove(rock);
        s1.score += 50;
      }

      //Collision w/ ship

      if (s1.rockIntersect(rock)) {
        rocks.remove(rock);
        s1.health -= rock.health;
        s1.score += 10;
      }


      if (rock.reachedBottom()) {
        rocks.remove(rock);
        pass++;
      }
    }



    for (int i = 0; i < lasers.size(); i++) {
      PewPew laser = lasers.get(i);
      laser.display();
      laser.fire();
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.rockIntersect(rock)) {
          lasers.remove(laser);
          rock.health -= laser.power;
          if (laser.reachedTop()) {
            lasers.remove(laser);
          }
        }
      }
    }

    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    /*if (ammoTimer.passedTime1 <= 300) {
     char ammoTime = '1';
     
     }
     switch(ammoTimer.passedTime1) {
     case 300:
     }*/


    if (ammoTimer.isFinished()) {

      if (s1.ammo < s1.maxAmmo) {
        s1.ammo += 1;
        ammoTimer.start();
      }
    }

    s1.display(mouseX, mouseY);
    infoPanel();

    //Game over
    if (s1.health < 1) {
      play = false;
      gameOver(false, true);
    } else if (pass > 100) {
      play = false;
      gameOver(true, false);
    }
  }


void startScreen() {
  rectMode(CORNER);
  background(12, 100, 55);
  textAlign(CENTER);
  textSize(40);
  text("SPACEGAME!", width/2, height/3);
  rectMode(CORNER);
  fill(0);
  rect(width/4 + width/6, height/2 + height/3.6, 100, 50);
  textSize(30);
  fill(255);
  text("Play!", width/2, height/2 + height/3);
  textSize(12.5);
  /*  if(mouseReleased == true) {
   if (!play && mouseX < width/4 + width/6 && mouseX < width/4 && mouseY > height/2 && mouseY < height/2 + 3.6) {
   play = true;
   }
   }*/
}

void gameOver(boolean gameWin, boolean gameLose) {
  this.gameWin = gameWin;
  this.gameLose = gameLose;

  if (gameWin) {
    background(0);
    textAlign(CENTER);
    textSize(40);
    text("Victory!", width/2, height/3);
    textSize(20);
    text("Score: " + s1.score, width/2, height/2);
    rectMode(CORNER);
    fill(0);
    rect(width/4 + width/6, height/2 + height/3.6, 100, 50);
    textSize(30);
    fill(255);
    textSize(30);
    text("Play Again!", width/2, height/2 + height/3);
    textSize(12.5);
  } else if (gameLose) {
    background(0);
    textAlign(CENTER);
    textSize(40);
    text("Game Over", width/2, height/3);
    textSize(20);
    text("Score: " + s1.score, width/2, height/2);
    rectMode(CORNER);
    fill(0);
    rect(width/4 + width/6, height/2 + height/3.6, 100, 50);
    textSize(30);
    fill(255);
    textSize(30);
    text("Try Again!", width/2, height/2 + height/3);
    textSize(12.5);
  } else {
    background(0, 0, 150);
    textAlign(CENTER);
    textSize(40);
    text("Error!", width/2, height/3);
    textSize(30);
    text("Please close & restart!", width/2, height/2 + height/3);
    textSize(12.5);
  }
}

void clearAll() {
}

void copyright () {
  background(0);
  // People
  text("Creator: Caelan Grippa", width/2, 10);


  // Sounds


  // Graphics
}


void mousePressed() {
  if (play && s1.ammo > 0 && laserTimer.isFinished()) {
    lasers.add(new PewPew(s1.x+12, s1.y-20, 255));
    lasers.add(new PewPew(s1.x-12, s1.y-20, 255));
    s1.ammo -= 1;
    laserTimer.start();
    if (s1.ammo != 10) {
      ammoTimer.start();
    }
  }
}

void infoPanel() {

  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-90, 100, 90);
  textAlign(TOP, LEFT);
  fill(255, 128);
  text("Health: " + s1.health, 5, 530);
  text("Lives: " + s1.lives, 5, 550);
  text("Ammo: " + s1.ammo, 5, 570);
  text("Score: " + s1.score, 5, 590);
  if (!ammoTimer.isFinished()) {
    fill(255, 0, 0, 128);
    text(int(ammoTimer.passedTime1), 70, 590);
  }
}
