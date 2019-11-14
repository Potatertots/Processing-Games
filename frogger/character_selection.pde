void chooseChar() {
  if (charSelect) {
    //listing all character options
    fill(0);
    rect(0, 0, 1000, 700);
    fill(255);
    textFont(courier,48);
    text("CHOOSE YOUR CHARACTER:",200,125);
    
    image(pepe,50,200);
    textFont(courier,24);
    text("PEPE:",50,325);
    text("+1 LIFE",50,350);
    textFont(courier,14);
    text("because memes live forever.",50,375);
    
    image(datboi,50,475);
    textFont(courier,24);
    text("DAT BOI:", 50, 600);
    text("+5SEC TIME", 50, 625);
    textFont(courier,14);
    text("because dat boi is a speedy boi.", 50, 650);
    
    image(pix,725,200);
    textFont(courier,24);
    text("CLASSIC FROG:", 725, 325);
    text("NOTHING",725,350);
    textFont(courier,14);
    text("seriously this guy's boring.",725,375);
    
    image(gudetama,725,475);
    textFont(courier,24);
    text("GUDETAMA:",725,600);
    text("SLOWER OBSTACLES", 725,625);
    textFont(courier, 14);
    text("thiccc is inversely",725,650);
    text("proportional to speed.",725,665);
    
    image(squidward,350,300);
    textFont(courier,24);
    text("(HOT) SQUIDWARD:",350,425);
    text("1.5x POINTS",350,450);
    textFont(courier,14);
    text("a d o n i s", 350,475);
    
    if (mousePressed){ //selecting a character
      if ((mouseX>50) && (mouseX<150)) {
        if((mouseY>200) && (mouseY<300)){
          frog = pepe;
          frogNum = 6;
          charSelect = false;
        } else if ((mouseY>475) && (mouseY<575)){
          frog = datboi;
          tlimit = 2100;
          charSelect = false;
        }
      } else if ((mouseX > 725) && (mouseX<825)){
        if((mouseY>200) && (mouseY<300)){
          frog = pix;
          charSelect = false;
        } else if ((mouseY>475) && (mouseY<575)){
          frog = gudetama;
          obsSpeed = 2;
          charSelect = false;
        }
      } else if ((mouseX>350) && (mouseX<450) && (mouseY > 300) && (mouseY<400)){
        frog = squidward;
        charSelect = false;
      }
    }
    
    text("INSTRUCTIONS",400,675); //show instructions to game
    if ((mouseX>400) && (mouseX<450) && (mouseY>650)){
      fill(0,255,0);
      text("INSTRUCTIONS",400,675);
      if (mousePressed){
         fill(0);
         rect(0,0,1000,700);
         image(instructions,0,50);
      }
    }
  }
}
