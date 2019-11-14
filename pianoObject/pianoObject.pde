class Whitekey {
  color c;
  float xpos;
  float ypos;

  Whitekey(float tempXpos, float tempYpos) {
    c = color(255);
    xpos = tempXpos;
    ypos = tempYpos;
  }
  void display() {
    fill(c);
    stroke(150);
    rect(xpos, ypos, 100, 600);
  }
  
  void shine() {
    c = color(255,255,224);
  }
  }

Whitekey wkey1 = new Whitekey(0,0);
Whitekey wkey2 = new Whitekey(100,0);
Whitekey wkey3 = new Whitekey(200,0);
Whitekey wkey4 = new Whitekey(300,0);
Whitekey wkey5 = new Whitekey(400,0);
Whitekey wkey6 = new Whitekey(500,0);
Whitekey wkey7 = new Whitekey(600,0);



  void setup() {
    size(700, 600);
    background(255);
  }

  void draw() {
    wkey1.display();
    wkey2.display();
    wkey3.display();
    wkey4.display();
    wkey5.display();
    wkey6.display();
    wkey7.display();
    
    int mousePos = int(mouseX/100);
    
  }
