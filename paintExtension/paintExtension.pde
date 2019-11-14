PFont courier;
PImage maldaddy;
PImage GOT;
PImage arstotska;
Boolean trace;
PImage[] tracers = new PImage[3]; //loading array of images to randomly select one from

void setup() {
  size(900, 800);
  background(255);
  courier = createFont("Courier", 14, true);
  println("Press the following keys for stroke colour scales:"); //print instructions
  println("'b': blue");
  println("'r': red");
  println("'g': green");
  println("'f': greyscale");
  println("'q': random");
  println("press 't' for a picture to trace.");
  println("press space to erase.");
  maldaddy = loadImage("MALDADDY.png");
  maldaddy.resize(900, 600);
  GOT = loadImage("GOTsigils.png");
  arstotska = loadImage("arstotska.png");
  arstotska.resize(800, 700);
  tracers[0] = maldaddy; //saving images to an array to pick randomly from
  tracers[1] = GOT;
  tracers[2] = arstotska;
  trace = true; //boolean so that traced image will only draw once (won't cover dots)
}

void draw() {
  strokeWeight(3);
  char letterPressed = key; //switch statement for different keyboard commands
  stroke(random(256), random(256), random(256)); //initial color scheme is random
  switch(letterPressed) { //change settings based on key pressed
  case 't': 
    if (trace) { //will only draw if trace is true
      image(tracers[(int)random(3)], 0, 0); //selects a random image to display 
      trace = false; //keeps the image from being redrawn on top of dots 
    }  //<>//
    break; //<>//
  case 'q':
    stroke(random(256), random(256), random(256)); //hit q to go back to random colours
    break;
  case 'r': //dots are all in shades of red
    stroke(25 * random(8, 10), random(13) * random(10), random(13) * random(10));
    break;
  case 'b': //dots all in shades of blue
    stroke(random(13) * random(10), random(13) * random(8, 10), 25 * random(10));
    break;
  case 'g': //dots all in shades of green
    stroke(random(13) * random(10), random(25) * random(8, 10), random(13) * random(10));
    break;
  case 'f': //dots in greyscale
    stroke(random(256));
    break;
  }
  if (mousePressed) { //draws point where mouse is clicked
    point(mouseX, mouseY);
  }
  
  if ((keyPressed) && (key == ' ')) { //erase function
    fill(255);
    noStroke();
    rect(0, 0, 1000, 800); //<>//
    trace = true; //resets trace as true 
  }
  

  noStroke(); //write the coordinates of mouse on screen //<>//
  fill(255); //covering up old coordinates
  rect(0, 0, 100, 25); //<>//
  fill(0);
  textFont(courier, 14);
  text(str(mouseX) + ", " +  str(mouseY), 10, 10);
}
