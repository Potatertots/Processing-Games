PFont courier;
Boolean isMulti = false;

void setup() {
  size(800, 600);
  background(0);
  courier = createFont("courier", 24, true);
}

int yPaddle = 0;
int xBall = 800;
int yBall = 300;
int angle = 2;
int score1 = 0;
int direction = -1;
int speed = 5;

int score2 = 0;
int yPaddle2 = 0;

int ballcolour[] = {255, 255, 255};

void draw() {

  if ((keyPressed) && (key == 'w')) {
    yPaddle = yPaddle - 5;
  } else if ((keyPressed) && (key == 's')) {
    yPaddle = yPaddle +5;
  }

  if (yPaddle >600) {
    yPaddle = 0;
  } else if (yPaddle<0) {
    yPaddle = 600;
  }

  if ((yBall < 25) || (yBall >575)) {
    angle = -1 * angle;
  }

  if (xBall < 25) {
    xBall = 775;
  } else if ((xBall > 775) & (isMulti == false)) {
    direction = -1;
  } else if ((xBall > 775) & (isMulti)) {
    xBall = 25;
  }

  if (xBall == 125) { 
    if ((yBall > yPaddle) && (yBall < yPaddle + 100)) {
      direction = 1;
      score1++;
      for (int i = 0; i<3; i++) {
        ballcolour[i] = int(random(100, 255));
      }
    } else if (direction == -1) {  
      score1= 0;
    }
  }

  if (isMulti == false) {
    speed = 5 + ceil(score1/5) * 3;
  }

  yBall = yBall + angle;
  xBall = xBall + (direction * speed);

  stroke(0);
  fill(0);
  rect(0, 0, 800, 600);

  fill(0, 255, 0);
  stroke(0, 255, 0);
  ellipse(750, 575, 25, 25);

  textFont(courier, 12);
  text("Multiplayer", 700, 550);

  if ((mousePressed) && (mouseX >725) && (mouseY>550)) {
    isMulti = true;
    score1 = 0;
  }

  if (isMulti) {
    multiplayer();
  }
  textFont(courier);
  fill(255);
  stroke(255);
  text(score1, 25, 25);

  stroke(ballcolour[0], ballcolour[1], ballcolour[2]);
  fill(ballcolour[0], ballcolour[1], ballcolour[2]);
  ellipse(xBall, yBall, 25, 25);

  fill(255);
  stroke(255);
  rect(100, yPaddle, 25, 100);
}

//add multiplayer mode later
