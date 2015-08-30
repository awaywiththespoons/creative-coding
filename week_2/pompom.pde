/*
 * Becca Rose, August 2015
 * Creative Coding, Week 2, 05 - Moving Patterns 1
 * based on code by Indae Hwang and Jon McCormack
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally. And the circles are now
 * actaully pom poms.
 */

// variable used to store the current frame rate value
int frame_rate_value;
PImage pomImg;


void setup() {
String url = 'http://processing.beccarose.co.uk/wp-content/uploads/2015/08/pompom100.png';
  size(500, 500);
  frame_rate_value = 12;
  background(0, 255, 120);
  pomImg = loadImage(url, "png");
}


void draw() {

  background(lerp(255, 0, 500), 255, 120);

  int num = 10;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
 
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }

    fill(0);
  rect(0, height-40, width, 40);

  
  //this is for drawing the frame rate
  noStroke();
  fill (200, 0, 200);
  ellipse(map(frame_rate_value, 2, 120, 0, width), height-20, 25, 25); //re-map the fraame rate back to the area
  fill (0, 200, 100);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(frame_rate_value, map(frame_rate_value, 2, 120, 0, width), height-20);
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * sin(circleAge * HALF_PI);

  image(pomImg, x-size/2, y-size/2, circleSize, circleSize);
}

void mouseClicked(){

    if (mouseY > width-38 && mouseY < width -10 && mouseX > 10 && mouseX < width -2) { //if mouse is in defined area
      frame_rate_value = (int)map(mouseX, 10, width-10, 2, 120); //map the frame rate to the area
      noStroke();
      fill (225, 0, 200);
      ellipse(mouseX, height-21, 25, 25); //draw a cirle
      fill (0, 225, 100);
      textSize(32);
      textAlign(CENTER, CENTER);
      text(frame_rate_value, mouseX, height-21); //print the frame rate
    }
  }
