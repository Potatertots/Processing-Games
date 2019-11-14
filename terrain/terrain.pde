int w = 1200;
int h = 900;
int rows,cols;
int scl = 80;
float terrain[][];
float geocolours[][];

void setup() {
 size(600,600,P3D); 
 rows = h/scl;
 cols = w/scl;
 
 float xoff = 0;
 float yoff = 0;
 
 terrain = new float[cols][rows];
 for (int y = 0; y < rows; y++){
   for (int x = 0; x < cols; x++){
     terrain[x][y] = map(noise(xoff,yoff),0,1,-50,50);
     xoff += 0.3;
   }
   yoff += 0.3;
 }
 
 
 geocolours = new float[cols][rows];
 for (int y = 0; y < rows; y++){
   for (int x = 0; x < cols; x++){
     geocolours[x][y] = random(150,255);
   }
 }
}

void draw() {
 background(178, 232, 255);
 noStroke();
 //fill(25, 204, 94);

 translate(width/2,height/2);
 rotateX(PI/3);
 translate(-w/2,-h/2,-150);

 for (int y = 0; y < rows-1; y++){
   for (int x = 0; x< cols-1; x++){
     beginShape(TRIANGLE);
     fill(0,geocolours[x][y],0);
     vertex(x*scl, y*scl, terrain[x][y]);
     vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
     vertex((x+1)*scl, (y+1)*scl, terrain[x+1][y+1]);
     //vertex((x+1)*scl, (y+1)*scl,terrain[x][y+1]);
     endShape();
     fill(0,geocolours[x+1][y+1],0);
     beginShape(TRIANGLE);
     vertex(x*scl, y*scl, terrain[x][y]);
     vertex((x+1)*scl, (y+1)*scl, terrain[x+1][y+1]);
     vertex((x+1)*scl, (y)*scl, terrain[x+1][y]);
     endShape();
     fill(0,128,0);
     
   }
 }
 
 directionalLight(0,255,0,mouseX,mouseY,0.25);
}
