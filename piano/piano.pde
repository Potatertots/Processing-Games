class Whitekey {
  color c;
  float xpos;
  float ypos;
  Whitekey() {
    c = color(255);
    xpos = 0;
    ypos = 0;
  }
  void display() {
    fill(c);
    rect(xpos, ypos, 100, 350);
  }
  
  void shine() {
    c = color(255,255,224);
  }
  }

  void setup() {
    size(700, 600);
    background(255);
  }

  void draw() {
  }
