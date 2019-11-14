void nyanFunction() { //NYAN MODE --> cursor is nyan cat and "etch" is nyan cat's rainbow
  if (mousePressed == true) { //only draw when mouse is pressed
    cursor(nyanCat); //cursor is nyan cat!
    strokeWeight(8);
    stroke(255, 0, 0); //creating the rainbow the nyan cat etches
    line(pmouseX, pmouseY - 16, mouseX, mouseY - 16);
    stroke(255, 140, 0);
    line(pmouseX, pmouseY - 8, mouseX, mouseY - 8);
    stroke(255, 215, 0);
    line(pmouseX, pmouseY, mouseX, mouseY);
    stroke(0, 255, 0);
    line(pmouseX, pmouseY +  8, mouseX, mouseY + 8);
    stroke(30,144,255);
    line(pmouseX, pmouseY + 16, mouseX, mouseY + 16);
    stroke(138, 43, 226);
    line(pmouseX, pmouseY + 24, mouseX, mouseY + 24);
  }
}
