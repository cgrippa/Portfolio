Button[] numButtons = new Button[11];
Button[] opButtons = new Button[10]; //7
String dVal = "0";


void setup() {
  size(260, 340);

  //dimensional variables

  int qt = width/4;
  int hlf = width/2;
  int tqt = width/2 + width/4;

  numButtons[0] = new Button(qt, 280, qt, 60, "0", true);
  numButtons[1] = new Button(0, 220, qt, 60, "1", true);
  numButtons[2] = new Button(qt, 220, qt, 60, "2", true);
  numButtons[3] = new Button(hlf, 220, qt, 60, "3", true);
  numButtons[4] = new Button(0, 160, qt, 60, "4", true);
  numButtons[5] = new Button(qt, 160, qt, 60, "5", true);
  numButtons[6] = new Button(hlf, 160, qt, 60, "6", true);
  numButtons[7] = new Button(0, 100, qt, 60, "7", true);
  numButtons[8] = new Button(qt, 100, qt, 60, "8", true);
  numButtons[9] = new Button(hlf, 100, qt, 60, "9", true);
  numButtons[10] = new Button(0, 280, qt, 60, ".", true);

  opButtons[0] = new Button(0, 0, qt, 60, "C", false);

  opButtons[1] = new Button(tqt, 100, qt, 60, "+", false);
  opButtons[2] = new Button(tqt, 160, qt, 60, "-", false);
  opButtons[3] = new Button(tqt, 220, qt, 60, "*", false);
  opButtons[4] = new Button(tqt, 280, qt, 60, "/", false);
  opButtons[5] = new Button(hlf, 280, qt, 60, "=", false);
  opButtons[6] = new Button(0, 60, qt, 40, "?", false);
  opButtons[7] = new Button(qt, 60, qt, 40, "?", false);
  opButtons[8] = new Button(hlf, 60, qt, 40, "?", false);
  opButtons[9] = new Button(tqt, 60, qt, 40, "?", false);
}

void draw() {
  background(230);
 
  updateDisplay();

  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
}

void mousePressed() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      dVal += numButtons[i].val;
    }
  } for (int i = 0; i < opButtons.length; i++) {
     if (opButtons[0].hover) {
       dVal = "0";
     } else if (opButtons[i].hover) {
       dVal += opButtons[i].val;
     }

  }
}
void updateDisplay() {
  fill(80);
  rect(65, 0, 195, 60);
  fill(255);
  textAlign(RIGHT);

  if (dVal.length()<19) {
    textSize(14);
    text(dVal, 235, 35);
  } else if (dVal.length()<22) {
    textSize(12);
    text(dVal, 235, 35);
  } else if (dVal.length()<27) {
    textSize(10);
    text(dVal, 235, 35);
  } else if (dVal.length()<33) {
    textSize(8);
    text(dVal, 235, 35);
  } else if (dVal.length()<42) {
    textSize(6);
    text(dVal, 235, 35);
  } else if (dVal.length()<999) {
    textSize(14);
    text("Number too long!", 235, 35);
  }


  textSize(14);
  textAlign(CENTER);
}

void keyPressed() {
  for (int i = 0; i < numButtons.length; i++) {
    if(dVal == "010") {
      dVal += numButtons[i].val;
    }
  }
}

void performCalculation() {
}
// 50+35
