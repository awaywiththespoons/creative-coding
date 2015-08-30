/*
 * Becca Rose, August 2015
 * Creative Coding, Week 2, 05 - Moving Patterns 1
 * based on code by Indae Hwang and Jon McCormack
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. I added cats and dogs to the scene.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

PImage catImg; //add images
PImage dogImg;
int count = 0; //count for jpeg file name

void setup() {
  size(700, 700);

  frame_rate_value = 3;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(100, 0, 155);

//load images
String url = 'http://processing.beccarose.co.uk/wp-content/uploads/2015/08/cat_face30.png';
String url1 = 'http://processing.beccarose.co.uk/wp-content/uploads/2015/08/dog_face_30.png';
  catImg = loadImage(url, "png");
  dogImg = loadImage(url1, "png");
}

void draw() {

  background(100, 0, 155); //purpleish

  int num = 20;
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

//save a picture
  count++; //for file number

  if (keyPressed == true && key == 's') {
    saveFrame("cat_dog_groove" + count + ".jpg");
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(255, 255, 0);
  image(catImg, tempX-40, tempY-40);
  ellipse(tempX, tempY, size/2, size/2);
  image(dogImg, tempX, tempY);
  strokeWeight(3);
  stroke(200, 0, 190);
  line(x, y, tempX, tempY);
}

/*
 * keyReleased function
 * called automatically by Processing when a keyboard key is released. 
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  //println("Current frame Rate is: " + frame_rate_value);
}
