void multiplayer(){
  yPaddle2 = mouseY;
    
  
  if (xBall == 675) { 
    if ((yBall > yPaddle2) && (yBall < yPaddle2 + 100)) {
      direction = -1;
      score2++;
      for(int i = 0; i<3; i++){
        ballcolour[i] = int(random(100,255));
      }
    } else if (direction == 1) {  
      score2= 0;
    }
  }
  
  fill(0);
  stroke(0);
  rect(700,500,200,200);

  fill(0,255,0);
  stroke(0,255,0);
  textFont(courier,24);
  text(score2, 750,25);
  
  fill(255);
  stroke(255);
  ellipse(50, 575, 25, 25);

  textFont(courier, 12);
  text("Single player", 0, 550);
  
  if ((mousePressed) && (mouseX<75) && (mouseY>550)){
    isMulti = false;
  }
  fill(0,255,0);
  stroke(0,255,0);
  rect(700, yPaddle2, 25, 100);
  
  if (score1 >= 10) {
    score1 = 0;
    score2 = 0;
    textFont(courier,36);
    text("WINNER: PLAYER 1", 200,300);
    textFont(courier,12);
    text("Click anywhere to continue.", 200, 350);
    noLoop();
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

void mousePressed() {
  loop();
}
