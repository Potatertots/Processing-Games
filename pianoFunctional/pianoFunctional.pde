import processing.sound.*; //<>// //<>// //<>// //<>// //<>// //<>//

// starting an array that stores X values for keys. each position corresponds to an 
//"instance" (in OOP) which makes it possible to refer to specific keys
int[] xPos = new int[7]; 
int[] randomcolour = {255, 255, 224}; 
int[] savedNotes = new int[6];
{
  savedNotes[0] = 1; //setting a filler value as the first note
}

int num = 0; //some incrementors because for loops increment too quickly 
int counter = 1;

SoundFile A; //loading my notes
SoundFile B;
SoundFile C;
SoundFile D;
SoundFile E;
SoundFile F;
SoundFile G;


void setup() {
  size(700, 600);
  background(255);
  for (int i = 0; i<7; i++) { //populating the x coordinate array
    xPos[i] = i*100;
  }
  A = new SoundFile(this, "pianoA.wav"); //loading soundfiles, is there a more efficient way to do this?
  B = new SoundFile(this, "pianoB.wav");
  C = new SoundFile(this, "pianoC.wav");
  D = new SoundFile(this, "pianoD.wav");
  E = new SoundFile(this, "pianoE.wav");
  F = new SoundFile(this, "pianoF.wav");
  G = new SoundFile(this, "pianoG.wav");

  println("press h for hold petal"); //instructions for usage
  println("press s to record 5 notes, and p to play a remix");
  println("press t to play a tune");
}


void mouseClicked() {
  if ((key == 's') && (num < 6)) { //function that saves notes to an array if s is pressed
    savedNotes[num] = floor(mouseX/100);
    num++; //using num as my incrementer instead of for loop (loops too quickly)
  } else if (num == 6) {
    num = 1;
  }
} 

void draw() {

  SoundFile[] noteList = {A, B, C, D, E, F, G};
  SoundFile[] drummer = {A, C, C, D, E, D, E, E, F, E, F, E}; //notes for little drummer boy :)
  fill(255);
  stroke(150);
  for (int i = 0; i<7; i++) {
    rect(xPos[i], 0, 100, 600); //drawing keys at each x coordinate saved
  }


  if ((key == 'p') && (counter <6)) { //playing notes that were saved using s
    if ((noteList[savedNotes[counter]].isPlaying() == false) && (noteList[savedNotes[counter-1]].isPlaying() == false)) {
      noteList[savedNotes[counter]].play();
      counter++;
    }
  }
  
  if ((key == 't') && (counter <12)) { //play drummer if d is pressed 
  //using counter to iterate through notes in array
    if ((drummer[counter-1].isPlaying() == false) && (drummer[counter].isPlaying() == false)) {
      drummer[counter].play();
      counter++;
    }
  } else if (counter == 11) {
    counter = 1;
  }
  
  fill(randomcolour[0], randomcolour[1], randomcolour[2]);
  int toPlay = 7;
  if (mousePressed) { //extension to have keys correspond to notes too, also hold petal?
    toPlay = floor(mouseX/100); //mousePos determines which key lights up
    rect(xPos[toPlay], 0, 100, 600);
    if (noteList[toPlay].isPlaying() == false) { //can't hit same note twice quickly rn
      noteList[toPlay].play();
      for (int i = 0; i<3; i++) {
        randomcolour[i] = int(random(50, 255)); //randomizing the displayed colour of 
        //each new key
      }
    }
  } else if ((keyPressed) && (int(key) >=97) && (int(key) <= 103)) { //alternate option of playing with keyboard letters
    toPlay = int(key) - 97;
    if ((toPlay<7) && (key == 'h')) {
      noteList[toPlay].loop();
    }
    if ((toPlay <7)) { 
      rect(xPos[toPlay], 0, 100, 700);
      if (noteList[toPlay].isPlaying() == false) {
        noteList[toPlay].play();
        for (int i = 0; i<3; i++) {
          randomcolour[i] = int(random(50, 255));
        }
      }
    }
  }

  fill(0);
  for (int i=1; i<7; i++) { //drawing the black keys for a e s t h e t i c
    if ((i != 2) && (i !=5)) { //except between E and F/C&B because it's a sEmItOnE
      rect(i * 100 - 25, 0, 50, 350);
    }
  }
}
