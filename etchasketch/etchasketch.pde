import processing.sound.*; //import sound library

//declaring variables
SoundFile nyanSong; 
PImage nyanCat;
PFont didot;
PImage etcher;
PImage whiteEtcher;
int isNyan;
int curscolour;
Boolean playNyanSong;




void setup() {
  size(1000, 800); //set up frame size
  background(255); //set up background colour
  frameRate(100); //set frame rate to make drawing less choppy 
  //(draw function loops more often)

  //loading and resizing images to be used
  nyanCat = loadImage("nyan.png");
  nyanCat.resize(150, 100);
  didot = createFont("Didot", 12, true);
  etcher = loadImage("etcher.png");
  etcher.resize(15, 15);
  whiteEtcher = loadImage("wetcher.png");
  whiteEtcher.resize(15, 15);
  isNyan = 0; 
  curscolour = 0;
  playNyanSong = false;

  nyanSong = new SoundFile(this, "nyanSong.aiff"); //loading sound file


  //print background colour legend
  println("Press keys to change background colours.");
  println("Remember, changing a background colour will erase all of your work!");
  println("'b' = blue");
  println("'g' = green");
  println("'r' = red");
  println("'l' = black");
  println("space bar = white");
}

void draw() {

  if (playNyanSong == true) {
    nyanSong.play(); //plays nyan song in background
    playNyanSong = false;
  } 

  //creating a nyan cat button 
  strokeWeight(1);
  stroke(curscolour * 255);
  fill(255, 192, 203);
  ellipse(40, 40, 75, 75);
  textFont(didot, 18);
  fill(0);
  text("NYAN", 15, 45);

  //creating a back to normal button 
  fill(200);
  ellipse(960, 40, 75, 75);
  textFont(didot);
  fill(0);
  text("etchasketch", 930, 40);
  noStroke();


  //if nyan button is clicked then change isNyan to true (turns on nyan cat function)
  if ((mouseX<70) && (mouseY<70) && (mousePressed == true)) {
    isNyan = 1;
    playNyanSong = true;

    //if etchasketch button is clicked then change isNyan to false (turns off nyan mode)
  } else if ((mouseX > 930) && (mouseY < 70) && (mousePressed == true)) {
    isNyan = 0;
    playNyanSong = false;
    nyanSong.stop();

    // when no buttons have been pressed then isNyan is false
  }
  if (isNyan == 0) { //establishing conditions for normal mode
    if (curscolour == 0) {
      cursor(etcher); //set cursor to black dot
    } else {
      cursor(whiteEtcher); //cursor is white dot if bg is black (dtm'd by curscolour)
    }
    if (mousePressed == true) { //only etch when mouse is pressed
      //drawing colour changes with location of mouse MAKES RAINBOW COLOURS
      stroke(mouseX/4 + 50, mouseY/4 + 50, (mouseX + mouseY )/4 + 50); 
      //line is drawn - two points are previous and current x/y coordinates of mouse
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  } else { //if isNyan is true (button has been clicked) then ACTIVATE NYAN MODE
    nyanFunction();
  }

  //extensions: change background colour with keys pressed. Pressing key will "erase" screen

  char letterPressed = key;
  if (keyPressed == true) { 
    switch(letterPressed) {
      //cover everything up with a giant white rectangle (basically erase) if spacebar pressed
    case ' ':
      fill(255);
      curscolour = 0;
      break;
      //change bg colors with switch statement (depends on key pressed)
    case 'g': 
      fill(102, 255, 178); //green
      curscolour = 0;
      break;
    case 'b':
      fill(51, 153, 255); //blue
      curscolour = 0;
      break;
    case 'r':
      fill(255, 153, 153); //red
      curscolour = 0;
      break;
    case 'l':
      fill(0); //black
      curscolour = 1; //white cursor
      break;
    }
    rect(0, 0, 1000, 800); //draw "eraser" rectangle, fill colour dtm'd by key pressed
  }
}
