Car[] cars = new Car[300];


void setup() {
  size(800, 800);
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car();
  }
}


void draw() {
  background(43, 47, 49);
  for (int i = 0; i < cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}
