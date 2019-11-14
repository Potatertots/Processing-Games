int frogX=300;
int frogY=600;
int frogNum = 5;
int gridSize = 100;
int obsSpeed = 3;
Boolean isSafe[][];
Boolean frogHome = false;
int points = 0;
int timer = 0;
int tlimit = 1800;
PFont courier;
IntList carX2 = new IntList(); //intlist to store x coord. of a bunch of cars
IntList carX1 = new IntList();
IntList boatX1 = new IntList();
IntList boatX2 = new IntList();
IntList highestY = new IntList();
IntList homeNum = new IntList();
IntList highScore = new IntList();
Boolean charSelect = true; //allowing character selection
PImage pepe;
PImage pix;
PImage datboi;
PImage gudetama;
PImage squidward;
PImage frog;
PImage wednesday;
PImage instructions;
PImage car;
PImage pineapple;

void setup() {
  noStroke();
  size(1000, 700);
  frameRate(60);
  courier = createFont("courier", 24, true);

  //making the first cars/boats
  carX1.append(1000);
  carX2.append(0);

  boatX1.append(1000);
  boatX2.append(0);

  //creating a grid of the map and assigning "safeness" to each coordinate
  isSafe = new Boolean[height/gridSize+1][width/gridSize+3];
  for (int y = 0; y < height/gridSize+1; y+=1) {
    for (int x = 0; x < width/gridSize+2; x+=1) {
      isSafe[y][x] = true;
    }
  }
  
  // populating array with coordinates for homes
  for (int i = 0; i < 5; i++) {
    homeNum.append(i*2*gridSize + gridSize);
  }

  pepe = loadImage("pepe.png"); //loading possible characters
  pepe.resize(100, 90);
  pix = loadImage("frog.png");
  pix.resize(100, 100);
  datboi = loadImage("dat boi.png");
  datboi.resize(100, 100);
  squidward = loadImage("squidward.png");
  squidward.resize(100, 100);
  gudetama = loadImage("gudetama.png");
  gudetama.resize(100, 100);
  wednesday = loadImage("wednesday.png"); //lives
  wednesday.resize(50, 50);
  instructions = loadImage("instructions.png");
  instructions.resize(900,550);
  car = loadImage("car.png");
  car.resize(100,90);
  pineapple = loadImage("pineapple.png");
  pineapple.resize(90,100);
}


void keyTyped() {
  //moving the frog
  char letterPressed = key;
  switch(letterPressed) {
  case 'w':
    frogY-=gridSize;
    break;
  case 's':
    frogY+=gridSize;
    break;
  case'a':
    frogX-=gridSize;
    break;
  case 'd':
    frogX+=gridSize;
    break;
  }

  //add points if frog moves into home
  for (int i = 0; i < homeNum.size(); i++) { 
    if ((floor(frogX/100) * 100 == homeNum.get(i)) && (frogY<gridSize)) {
      frogHome = true;
      homeNum.remove(i);
    }
  }

  //record the furthest up the frog has gotten, give points if frog goes higher
  highestY.append(frogY/gridSize);
  if (highestY.size()>10) {
    highestY.remove(0);
  }
  if ((frogY/gridSize <= highestY.min()) && (key == 'w')) {
    points += 10;
  }
}

//what do when frog dies
void killFrog() { 
  timer = 0;
  frogNum -=1;
  frogX = 300;
  frogY = 600;
  highestY.clear();
}


void draw() {
  chooseChar(); //start screen
  if (charSelect == false) {
    timer++;

    background(0);
  
  //drawing background
    //green spaces
    fill(0, 255, 0);
    rect(0, 6*gridSize, width, gridSize);
    rect(0, 3*gridSize, width, gridSize);
    rect(0, 0*gridSize, width, gridSize);

    //river
    fill(0, 0, 255);
    rect(0, 1 * gridSize, width, 2 * gridSize);

    //road
    fill(255, 255, 0);
    for (int i = 0; i < 10; i++){
      rect(i*100, 495,50,10);
    }

    //frog homes
    fill(255, 0, 255);
    for (int i = 0; i < homeNum.size(); i++) {
      image(pineapple, homeNum.get(i), 0);
    }


    //guide lines
    /*stroke(200);
     for (int i = 0; i<10; i++) {
     line(0, i*gridSize, width, i*gridSize);
     line(i*gridSize, 0, i*gridSize, height);
     }*/

    startBoats(); //boats

    if ((frogX>=width+99) || (frogX < 0) || frogY>=height) {
      killFrog();
    }

    for (int i = 0; i < width/gridSize; i++) { //river is unsafe
      isSafe[2][i] = false;
      isSafe[1][i] = false;
    }

    for (int i = 0; i < boatX1.size(); i++) { //squares where boats are are safe
      isSafe[2][int(boatX1.get(i)/100)] = true;
      isSafe[2][int(boatX1.get(i)/100) + 1] = true;
      isSafe[2][int(boatX1.get(i)/100) + 2] = true;
    }
    for (int i = 0; i < boatX2.size(); i++) {
      isSafe[1][int(boatX2.get(i)/100)] = true;
      isSafe[1][int(boatX2.get(i)/100)+1] = true;
      isSafe[1][int(boatX2.get(i)/100)+2] = true;
    }

    if ((isSafe[2][frogX/100] == false) && (frogY == 200)) { //kill frog if in unsafe space
      killFrog();
    } else if ((frogY == 200) && (isSafe[2][frogX/100] == true)) { //frog moves on logs
      frogX -= obsSpeed;
    }


    if ((isSafe[1][frogX/100] == false) && (frogY == 100)) {
      killFrog();
    } else if ((isSafe[1][frogX/100] == true) && (frogY == 100)) {
      frogX += obsSpeed;
    }

    for (int i = 0; i < boatX1.size(); i++) {
      isSafe[2][int(boatX1.get(i)/100)] = false;
    }
    for (int i = 0; i < boatX2.size(); i++) {
      isSafe[1][int(boatX2.get(i)/100)] = false;
    }

    //frog
    fill(255, 0, 0);
    image(frog, frogX, frogY);

    //show lives
    for (int i = 0; i < frogNum; i++) {
      image(wednesday, i*50 + 15, 650);
    }


    //show points
    fill(0);
    textFont(courier);
    text(str(points), 950, 15);

    if (frogHome) {
      frogNum -=1;
      frogX = 300;
      frogY = 600;
      points += 50;
      points += (tlimit/6 - timer/3);
      timer = 0;
      frogHome = false;
      highestY.clear();
    }

    startCar();
    //unsafe where cars are driving
    for (int i = 0; i < carX1.size(); i++) {
      isSafe[5][int(carX1.get(i)/100)] = false;
    }
    for (int i = 0; i < carX2.size(); i++) {
      isSafe[4][int(carX2.get(i)/100)] = false;
    }
    //kill if frog is on unsafe square
    if ((isSafe[5][frogX/100] == false) && (frogY == 500)) {
      killFrog();
    }
    if ((isSafe[4][frogX/100] == false) && (frogY == 400)) {
      killFrog();
    }
    
    //reset to true after car passes
    for (int i = 0; i < carX1.size(); i++) {
      isSafe[5][int(carX1.get(i)/100)] = true;
    }
    for (int i = 0; i < carX2.size(); i++) {
      isSafe[4][int(carX2.get(i)/100)] = true;
    }

    //show timer
    fill(0);
    text(str((tlimit-timer)/60), 850, 690);
    rect(900, 675, tlimit/30 - timer/30, 25);

    if (timer > tlimit) {
      killFrog();
    }

//what happens when all frogs are home/dead
    if (frogNum == 0) {
      fill(0);
      rect(0, 0, 1000, 700);
      fill(255);
      frogNum = 5;
      if (frog == pepe) {
        frogNum = 6;
      }
      timer = 0;
      noLoop();
      textFont(courier, 36);
      if (homeNum.size() == 0) {
        text("YOU WON!", 400, 200);
        points += 1000;
      }
      text("Click anywhere to continue", 200, 400);
      textFont(courier, 14);
      text("Press any key and click at the same time to change character", 250, 500);
      if (frog == squidward) {
        points = int(points * 1.5);
      }
      highScore.append(points);
      textFont(courier, 36);
      text("High score:" + str(highScore.max()), 350, 300);
    }

    if (highScore.size() > 10) {
      highScore.remove(0);
    }
  }
}

void mouseClicked() { //restarts game
  loop();
  points = 0;
  timer = 0;
  frogNum = 5;
  if (frog == pepe) {
    frogNum = 6;
  }
  frogX = 300;
  frogY = 600;
  highestY.clear();
  if (homeNum.size() == 0) {
    for (int i = 0; i < 5; i++) {
      homeNum.append(i*2*gridSize + gridSize);
    }
  }
  if (keyPressed) {
    charSelect = true;
  }
}
