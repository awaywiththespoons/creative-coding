/*
 * Becca Rose, August 2015 
 * made on the Creative Coding course, Week 2, 04 - The Clocks!
 * based on code by Indae Hwang and Jon McCormack
 *
 * This program is an adaptation of a very serious grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 *
 * Updated version: this updated version correctly sets margin and gutter distances
 * 
 */

PImage goodImg; //goodgove image
PImage badImg; //badgove image
int count = 0; //to save pdf

void setup() {
  size(600, 600);
  background(10, 10, 200);
  //make everything in the middle
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  noStroke();
  //load up the images from server


  String url = "http://processing.beccarose.co.uk/wp-content/uploads/2015/08/goodGove.png";
  String url1 = "http://processing.beccarose.co.uk/wp-content/uploads/2015/08/badGove.png";
  
  goodImg = loadImage(url, "png");
  badImg = loadImage(url1, "png")
}


void draw() {
  background(10, 10, 200);
  noStroke();

  int num = 5;  // the number of rows and columns
  int margin = 40; // margin between the edges of the screen and the circles

  int gutter = 10; //distance between each cell
  int cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num; // size of each circle
  goodImg.resize(cellsize, 0);
  badImg.resize(cellsize, 0);
  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) { // column in y
    for (int j=0; j<num; j++) { // row in x
      ++circleNumber;
      float tx = margin + cellsize/2  + (cellsize + gutter) * j;
      float ty = margin + cellsize/2  + (cellsize + gutter) * i;

      // if you divide the circle counter by 2 and the remainder is 0 it is and even number, so add a good gove.
      if (circleNumber%2 ==0) {
        goodGove(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      } 
      //if the reaminder =! to 0 it is odd, make a badgove
      else {
        badGove(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
      count++; // for saving jpg
      
      // save your drawing when you press keyboard 's'
      if (keyPressed == true && key == 's') {
        saveFrame("yourName" + count + ".jpg");
      }
    }
  }
}

///////////////////////
// G O O D   G O V E //
///////////////////////

void goodGove(float x, float y, float size, float angle) {

  // calculate endpoint of the line do some somes I still don't really understand
  float tempX = x + (size /8) * cos(angle);
  float tempY = y + (size /8) * sin(angle);
  float tempX2 = x + (size / 2) * -cos(angle);
  float tempY2 = y + (size / 4) * -sin(angle);

  stroke(0);
  strokeWeight(4);
  noFill();
  image(goodImg, x, y); // goodGove
  stroke(200, 0, 100);
  line(x-5, y+25, tempX, tempY); // pink line
  stroke(20, 200, 100);
  line(x-5, y+25, tempX2, tempY2); // green line
}

//////////////////////
// B A D   G O V E  //
//////////////////////

void badGove(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX3 = x + (size / 2) * 4*cos(angle);
  float tempY3 = y + (size / 4) * 4*sin(angle);
  float tempX4 = x + (size / 2) * (4+cos(-angle));
  float tempY4 = y + (size / 4) * (4+sin(-angle));

  stroke(0);
  strokeWeight(4);
  //fill(140, 180);

  image(badImg, x, y); // bad gove
  stroke(250, 100, 10);
  line(x, y, tempX3, tempY3); // pink line
  stroke(250, 255, 10);
  line(x, y, tempX4, tempY4); // green line
}
