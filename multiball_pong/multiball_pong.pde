PFont courier; //introducing courier font //<>// //<>// //<>//
Boolean isMulti = false; //turning multiplayer mode on/off
int ballNum = 1; //number of balls

int yPaddle = 0;
IntList xBall = new IntList(); //x position of ball. 
//Intlist so # of positions (balls) can change itself (don't have to manually add values into arrays)
IntList yBall = new IntList(); //y position of ball
IntList angle = new IntList(); // slope basically
float score1 = 7;
IntList direction = new IntList(); // positive or negative
int speed = 5; 

int score2 = 0;
int yPaddle2 = 0;

int ballcolour[] = {255, 255, 255}; //array containing RGB values of balls

void setup() {
  size(800, 600);
  background(0);
  courier = createFont("courier", 24, true);
  xBall.append(800); //adding values for first balls into respective intlists
  yBall.append(200);
  angle.append(2);
  direction.append(-1);
}


void draw() {

  stroke(0); //drawing in the background rectangle to cover up what was drawn last loop
  fill(0); 
  rect(0, 0, 800, 600); 

  for (int i = 0; i< ballNum; i++) { //for statement will iterate through all the code 
    //for each ball that exists
    if ((keyPressed) && (key == 'w')) { //keys move paddle position
      yPaddle = yPaddle - 5;
    } else if ((keyPressed) && (key == 's')) {
      yPaddle = yPaddle +5;
    }

    if (yPaddle >600) { //if paddle moves beyond screen, wrap around like you know what i mean
      yPaddle = 0;
    } else if (yPaddle<0) {
      yPaddle = 600;
    }

    if ((yBall.get(i) < 25) || (yBall.get(i) >575)) { //bounce off sides
      angle.set(i, -1 * angle.get(i));
    }

    if (xBall.get(i) < 25) { //wrap around
      xBall.set(i, 775);
    } else if ((xBall.get(i) > 775) & (isMulti == false)) { //bounce if not multiplayer
      direction.set(i, -1);
    } else if ((xBall.get(i) > 775) & (isMulti)) { //otherwise go to other end (wrap around)
      xBall.set(i, 25);
    }

    if ((xBall.get(i) == 125) && (direction.get(0) == -1)) { //hit ball back if paddle touches ball
      if ((yBall.get(i) > yPaddle) && (yBall.get(i) < yPaddle + 100)) { 
        direction.set(i, 1);
        score1++; //increase score
        for (int j = 0; j<3; j++) { //change ball colour
          ballcolour[j] = int(random(100, 255));
        }
      } else if  (direction.get(i) == -1) {  //score is 0 IF it isn't ball passing through in multi
        score1= 0;
        for (int h = ballNum-1; h>0; h--) { //remove multiple balls
          xBall.remove(h);
          yBall.remove(h);
          direction.remove(h);
          angle.remove(h);
        } 

        ballNum = 1;
        i = 0;
      }
    }


    yBall.add(i, angle.get(i));  //move ball(s)
    xBall.add(i, (direction.get(i) * speed));



    fill(0, 255, 0); //multiplayer button
    stroke(0, 255, 0); 
    ellipse(750, 575, 25, 25); 

    textFont(courier, 12); 
    text("Multiplayer", 700, 550); 

    textFont(courier); //display score
    fill(255); 
    stroke(255); 
    text(int(score1), 25, 25); 

    stroke(ballcolour[0], ballcolour[1], ballcolour[2]); //change ball colour
    fill(ballcolour[0], ballcolour[1], ballcolour[2]); 
    ellipse(xBall.get(i), yBall.get(i), 25, 25); 

    fill(255); //draw paddle
    stroke(255); 
    rect(100, yPaddle, 25, 100);


    if ((mousePressed) && (mouseX >725) && (mouseY>550)) { //click to turn on multiplayer
      isMulti = true; 
      score1 = 0;
    }

    if (isMulti) {
      multiplayer();
    }


    //if score gets high enough another ball gets added. 
    if ((score1/10 > ballNum) && (isMulti == false)) { 
      ballNum++;
      xBall.append(0 + (1/(ballNum -1)*800)); //starts next ball at manageable place
      yBall.append(int(random(300, 600)));
      angle.append(2);
      direction.append(-1);
    }
  }
}
