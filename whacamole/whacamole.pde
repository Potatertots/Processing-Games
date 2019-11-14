PFont courier;
PImage kipling;
PImage gingy;
PImage mallet;
int moleX[] = new int[5];
int moleY[] = {400, 200, 400, 200, 400};
Boolean mouseOver[] = new Boolean[5];
IntList highscore = new IntList();
int whichGopher;
int isGingy;
int score = 0;
int timer;
int tlimit = 1500;
int gtime = 0;

void setup() {
  size(600, 600);
  for (int i = 0; i < 5; i++) {
    moleX[i] = 100 + 100*i;
    mouseOver[i] = false;
  }
  whichGopher = int(random(5));
  courier = createFont("courier", 24, true);

  mallet = loadImage("mallet.png");
  mallet.resize(200, 150);
  kipling = loadImage("kipling.png");
  kipling.resize(100, 80);
  gingy = loadImage("gingy.png");
  gingy.resize(100, 80);
}

void showGopher(int x, int y) {
  image(kipling, x + 10, y);
  tint(255, (255-gtime/3));
  gtime++;
  if (gtime>random(300, 400)) {
    gtime = 0;
    score--;
    whichGopher = int(random(5));
    isGingy = int(random(15));
  }
}

void showGingy(int x, int y) {
  image(gingy, x+10, y);
  tint(255, (255-gtime/2));
  gtime++;
  if (gtime>random(300, 400)) {
    gtime = 0;
    score++;
    whichGopher = int(random(5));
    isGingy = int(random(15));
  }
}

void draw() {
  //background(250,128,114);
  background(255);
  cursor(mallet, 30, 30);
  imageMode(CENTER);

  timer++;

  stroke(255, 255, 0);
  noFill();
  strokeWeight(8);
  rect(25, 25, 550, 550);
  strokeWeight(1);


  for (int i = 0; i < 12; i ++) {
    noStroke();
    fill(mouseY/3, mouseX/3, 128);
    ellipse(i * 50 + 25, 12, 12, 12);
    ellipse(12, i * 50 + 15, 12, 12);
    fill(128, mouseY/3, mouseX/3);
    ellipse(i * 50 + 15, 588, 12, 12);
    ellipse(588, i * 50 + 25, 12, 12);
  }

  for (int i = 0; i < 5; i++) {
    stroke(0);
    fill(0);
    ellipse(moleX[i], moleY[i], 100, 100);

    if ((mouseX < moleX[i] + 50) && (mouseX > moleX[i] - 50) && (mouseY < moleY[i] + 50) && (mouseY > moleY[i] - 50)) {
      mouseOver[i] = true;
    } else {
      mouseOver[i] = false;
    }
    if (isGingy<10) {
      showGopher(moleX[whichGopher], moleY[whichGopher]);
    } else {
      showGingy(moleX[isGingy-10], moleY[isGingy-10]);
    }
  }

  textFont(courier);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  text(int(score), 25, 50);
  text(int((tlimit - timer)/50), 575, 50);

  if (timer > tlimit) {
    highscore.append(score);
    textFont(courier, 30);
    text("Total score: " + int(score), 100, 300);
    text("High score: " + int(highscore.max()), 100, 350);
    text("Press any key to continue.", 100, 400);
    noLoop();
  }

  if (score<0) {
    score = 0;
  }
}

void mouseClicked() {
  if ((mouseOver[whichGopher]) && (isGingy < 10)) {
    whichGopher = int(random(5));
    isGingy = int(random(15));
    score++;
    gtime = 0;
  } else if ((isGingy >= 10 ) && (mouseOver[isGingy - 10])) {
    fill(0);
    text("Don't hit Gingy!", 300, 50);
    whichGopher = int(random(5));
    isGingy = int(random(15));
    score--;
    gtime = 0;
  }
}

void keyPressed() {
  score = 0;
  timer = 0;
  loop();
}
