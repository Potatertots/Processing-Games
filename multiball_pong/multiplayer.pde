void multiplayer(){
  
  for (int y = ballNum-1; y>0; y--){ //remove multiple balls
    xBall.remove(y);
    yBall.remove(y);
    direction.remove(y);
    angle.remove(y);
  } 
  
  ballNum = 1;
  
  yPaddle2 = mouseY; //second paddle controlled by mouse
    
  
  if ((xBall.get(0) >= 687) && (direction.get(0) == 1)){ //same as everything in main program, just for second paddle
    if ((yBall.get(0) > yPaddle2) && (yBall.get(0) < yPaddle2 + 100)) {
      direction.set(0, -1);
      score2++;
      for(int i = 0; i<3; i++){
        ballcolour[i] = int(random(100,255));
      }
    } else if (direction.get(0) == 1){  
      score2= 0;
    }
  }
  
  fill(0); //covering up multiplayer button 
  stroke(0);
  rect(700,500,200,200);

  fill(0,255,0); //displaying second score but in GREEN this time!!
  stroke(0,255,0);
  textFont(courier,24);
  text(score2, 750,25);
  
  fill(255); //back to single player button
  stroke(255);
  ellipse(50, 575, 25, 25);

  textFont(courier, 12);
  text("Single player", 0, 550);
  
  if ((mousePressed) && (mouseX<75) && (mouseY>550)){ //turns off multiplayer mode
    isMulti = false;
  }
  fill(0,255,0); //drawing second paddle
  stroke(0,255,0);
  rect(700, yPaddle2, 25, 100);
  
  if (score1 >= 10) { //winner screen
    score1 = 0;
    score2 = 0;
    textFont(courier,36);
    fill(255);
    stroke(255);
    text("WINNER: PLAYER 1", 200,300);
    textFont(courier,12);
    text("Click anywhere to continue.", 200, 350);
    noLoop(); //pauses game basically
  } else if (score2 >= 10) {
    score1 = 0;
    score2 = 0;
    textFont(courier,36);
    text("WINNER: PLAYER 2", 200,300);
    textFont(courier,12);
    text("Click anywhere to continue.", 200, 350);
    noLoop();
    
  }
}

void mousePressed() { //restarts game!!
  loop();
}
