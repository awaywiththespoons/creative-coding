/*
 * Creative Coding MOOC
 * Week 1, 02 - Draw your name! (part 2)
 * by Becca Rose, base on code by Indae Hwang and Jon McCormack
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */

// variables for the angle (in radians) and increment 
float angle;
float inc;

void setup() {
  size(600, 300);
  background(0);

  rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;
}


void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  // map the mouse x position to the range (0.01, 0.08)
  // 
  inc = map(mouseX, 0, width, 0.01, 0.08);

  // incremment the current angle
  angle = angle + inc;

  if (mousePressed) {

    //strokeWeight(5);
    strokeWeight(1);
    stroke(0, 0, 255); 
    fill(0,0,255);

    rect(mouseX, mouseY, 4, 4);

    line(mouseX, mouseY, pmouseX, pmouseY); // pmouse is the mouse position at the previous frame

    // oscillate the radius over time
    float radius = 30 * abs( sin(frameCount) );

    float first_tempX  = mouseX + radius * cos( angle); // radius * cos (angle) make a circle
    float first_tempY  = mouseY + radius * sin( angle);
    float second_tempX = mouseX + radius * cos(-angle);
    float second_tempY = mouseY + radius * sin(-angle);

    // draw some lines and circles using transparency
    strokeWeight(2);
    fill(255, 20);
    stroke(155, 10, 100, 200);
    line(mouseX, mouseY, first_tempX+10, first_tempY+10);
    stroke(10, 100, 200, 50);
    line(mouseX, mouseY, second_tempX+10, second_tempY+10);

    float temp_w = random(5,25);
    strokeWeight(1);
    stroke(155, 55, 155, 100);
    ellipse(first_tempX, first_tempY, temp_w, temp_w);
    stroke(0, 100, 155, 50);
    ellipse(second_tempX, second_tempY, temp_w, temp_w);
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}
