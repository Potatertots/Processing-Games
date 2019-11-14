int triangleBase = 120; //setting the intial values for the height and base of triangle
int triangleHeight = 90;
PFont courier; //loading a pretty font to show text in


void setup() {
  size(800, 800); //creating background screen
  background(0);
  courier = createFont("Courier", 26, true); //creating font

  //print instructions for how to display different properties
  println("To display different properties of your triangle, press these keys:");
  println("'a' for area");
  println("'h' for hypotenuse");
  println("'p' for perimeter");
  println("'t' for both angles");
  println("'c' to display circumcircle");
}

void draw() {

  int adjTriangleBase = (120 + mouseX); //adjusting the base of triangle based on mouse position
  int adjTriangleHeight = (90 + mouseY); //adjusting height of triangle based on mouse position


  float hyp = sqrt(sq(adjTriangleBase) + sq(adjTriangleHeight)); //calculating hypotenuse
  float area = (adjTriangleBase * adjTriangleHeight)/2; //calculating area of triangle
  float perim = adjTriangleBase + adjTriangleHeight + hyp; //calculating perimeter of triangle
  float theta = degrees(asin(adjTriangleBase/hyp)); //calculating angles of triangle
  float ccarea = PI * sq(hyp/2); //calculating area of circumcircle



  float whatPrint = hyp; //determines what property will be displayed on screen
  String strWhatPrint = " hypotenuse "; //names property being displayed
  String unit = " units long."; //units to be used

  //draw this black rectangle each time so that whatever was display last loops is covered 
  //up, so that each loop doesn't overlap the last one
  fill(0); 
  rect(0, 0, 800, 800);

  //drawing the triangle
  fill(113, 238, 184);
  //coordinates are horrible so that the triangle will be centered on (400,400)
  triangle(400 - adjTriangleBase/2, 400 + adjTriangleHeight/2, 400- adjTriangleBase/2, 
    400- adjTriangleHeight/2, 400+adjTriangleBase/2, 400+adjTriangleHeight/2);

  char letterPressed = key;
  switch(letterPressed) {
    //change property of triangle printed depending on key pressed
  case 'a':
    whatPrint = area;
    strWhatPrint = " area ";
    unit = " units squared.";
    fill(255, 96, 137);
    triangle(400 - adjTriangleBase/2, 400 + adjTriangleHeight/2, 400- adjTriangleBase/2, 
      400- adjTriangleHeight/2, 400+adjTriangleBase/2, 400+adjTriangleHeight/2);
    break;
  case 'h': 
    whatPrint = hyp;
    strWhatPrint = " hypotenuse ";
    unit = " units long.";
    strokeWeight(5);
    stroke(255, 96, 137);
    line(400- adjTriangleBase/2, 
      400- adjTriangleHeight/2, 400+adjTriangleBase/2, 400+adjTriangleHeight/2);
    break;
  case 'p':
    whatPrint = perim;
    strWhatPrint = " perimeter ";
    unit = " units long.";
    strokeWeight(5);
    stroke(255, 96, 137);
    noFill();
    ;
    triangle(400 - adjTriangleBase/2, 400 + adjTriangleHeight/2, 400- adjTriangleBase/2, 
      400- adjTriangleHeight/2, 400+adjTriangleBase/2, 400+adjTriangleHeight/2);
    break;
  case 't': //printing out the values of both angles, and labelling on the triangle
    whatPrint = theta;
    strWhatPrint = " other angle ";
    unit = " degrees.";
    fill(255);
    textFont(courier, 20);
    text("One angle of the triangle is " + (90 - theta) + " degrees.", 100, 680);
    fill(255, 96, 137);
    textFont(courier, 20);
    text((90 - theta) + "°", 400- adjTriangleBase/2, 400 - adjTriangleHeight/2);
    text(theta + "°", 400 +adjTriangleBase/2, 400+adjTriangleHeight/2);
    break;
  case 'c': 
    stroke(255, 96, 137);
    noFill();
    ellipse(400, 400, hyp, hyp); //drawing circumcircle on screen too
    noStroke();
    fill(255, 96, 137);
    ellipse(400, 400, 10, 10); //displaying centre of circumcircle (circumcentre)
    fill(255);
    textFont(courier, 20);
    //displaying area of circumcircle
    text("The area of the circumcircle is " + ccarea + " units squared.", 100, 680);
    break;
  }

  //printing out the triangle property values
  noStroke();
  fill(255);
  textFont(courier, 20);
  text("The" + strWhatPrint + "of the triangle is " + whatPrint + unit, 100, 700);

  //labelling each side with its length as well
  textFont(courier);
  text(adjTriangleBase, 350, 400 + (adjTriangleHeight/2 + 25));
  text(adjTriangleHeight, 400 - (adjTriangleBase/2 + 50), 400);
}
