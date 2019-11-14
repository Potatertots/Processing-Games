PFont courier;

void setup() {
  size(800, 800);
  background(255);
  courier = createFont("Courier", 14, true);
}

void draw() {
  strokeWeight(2);
  stroke(random(256), random(256), random(256));
  point(mouseX, mouseY);
  if (keyPressed) {
    fill(255);
    noStroke();
    rect(0, 0, 800, 800);
  }
  noStroke();
  fill(255);
  rect(0,0,100,25);
  fill(0);
  textFont(courier, 14);
  text(str(mouseX) + ", " +  str(mouseY), 10,10);
}
