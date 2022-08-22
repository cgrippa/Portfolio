/*This program, Computer_Timeline, was written by Caelan Grippa.
Mr. Kapptie, Computer programming teacher at Skyline Senior High. Co-developer, in the form by teaching how to do this.
Sept. 15. 2020
*/
boolean hover = false;
void setup(){
  size(900, 400);
  background(225);
  surface.setTitle("History of the Computer");
  
}


void draw(){
  background(225);
  drawRef();
  histEvent(12.2,100, 100, 125, 50, "Ancient & Mechanical Calculators", "The oldest known counting device dates from 35,000 BCE. It's a bone with notches carved into it. There were many other basic & mechanical calculators, the abacus being one of the main examples. There were also looms that used punch cards to see which pattern to make.", true, 14);
  histEvent(14,150, 250, 125, 50, "Charles Babbage 1791-1871", "Considered as the father of the computer, Charles Babbage conceived multiple designs for a the first mechanical computer. His design was never fullly built or tested in his lifetime, but other science associations thought of his work as a marvel of enginering. Models of his works hav been built and are in museums around the world.", false, 13);
  histEvent(14,250, 100, 125, 50, "Electromechanical Computers", "These machines were highly researched in the WW2 era. They used electricity to make mechanical relays complete the calculations. They were still large and had low operating speeds, but easier to operate. An example would be German engineer Konrad Zuse's Z2 computer, the first fully automatic electromechanical computer.", true, 13);
  histEvent(18, 300, 250, 125, 50, "ENIAC 1946-1955", "The ENIAC computer was one of the first historical digital computers, located in Philadelphia, Pennsylvania. It took up a 50 foot long basement, and weighed 30 tons. When it was powered on, all the lights in Philadelphia dimmed. This computer was crucial in the development of the hydrogen bomb. It cost about $500,000 to make ($7 million today).", false, 12);  
  histEvent(12,400, 100, 125, 50, "Manchester Baby September 1948-April 1948", "The Manchester Baby was the first stored-program computer. It did not require any wires or switches to be relocated to run multiple programs. The first program for the Baby ran for 52 minutes before displaying the correct answer. 3.5 million operations had been executed in that time. After the computer showed it's capability, the Manchester Mark 1 was developed and built.", true, 11);
  
  histEvent(18,450, 250, 125, 50, "Manchester Mark 1", " The Mark 1 was very significant because it introduced index registers. These registers allowed programs to run much easier. The development of this computer led to the creation of 34 patents, and some of the ideas of the computer went into later computers.", false, 14);
  histEvent(18,550, 100, 125, 50, "Magnetic Memory 1946-1980", "As computers advanced, so did their ability to store things. Magnetic-drum memory was a trype of storage system developed in the 1940s that used a rotating drum and magnets to store data. It could be considered as a precursor to current day hard disk drives, which also use magnets. Magnetic cores were also developed and used in computers until around 1980.", true, 12);
  histEvent(18,600, 250, 125, 50, "Transistors 1955-Present Day", "Transistors were first developed in 1947, but they replaced vacuum tubes in 1955. They were smaller, cheaper, and more efficient. Computers that used mainly transistors were considered to be 2nd generation computers. Later, transistors would be used to create integrated circuit processors and microprocessors, which we use today.", false, 13);
}


void drawRef(){
  //Title
  fill(0);
  textAlign(CENTER);
  textSize(31);
  text("History of the Computer System", width/2, 30);
  
  //Timeline
  stroke(0);
  strokeWeight(3);
  line(100 , 200, 800, 200);
  
  //Discrip. Text
  fill(200);
  strokeWeight(1);
  rect(50, 325, 735, 70, 4);
  strokeWeight(3);
  fill(0);
  textSize(9);
  text("Caelan Grippa | 2020", width-55, 395 );
}


void histEvent(float ttl, int x, int y, int w, int h, String title, String description, boolean top, int desText){
  //Mouse detection.
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  
  //Rectangle w/ round edges.
  strokeWeight(1);
  if(hover == true) {
     fill(200);
  } else {
    fill(175);
  }
  rect(x,y,w,h, 4);


  //Event Title
  fill(0);
  textAlign(TOP, LEFT);
  textSize(ttl);
  text(title, x+1, y, 125, 60);
  if(hover == true) {
    //Description
    textSize(desText);
    text(description, 55, 330, 725, 70);
  } 
  
  //Timeline branch
  strokeWeight(2);
  if(top == true) {
    line(x+20, y+50, x+50, y+100);
  } else {
    line(x+20, y, x+50, y-50);
  }
  
  
}
