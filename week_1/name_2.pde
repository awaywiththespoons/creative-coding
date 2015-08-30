/*
 * Creative Coding
 * Week 1, 03 - Draw your name! (part 3)
 * by Becca Rose, based on code by Indae Hwang and Jon McCormack
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase all your drawing and start with a blank screen
 * 
 */

// variables to store the delay and target counts
int delayCount;
int targetCount;

// setup function
void setup() {
  size(500, 500);
  background(0);

  delayCount = 0;
  targetCount = (int) random(5,50); // set target count to a random integer between 5 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  } else {
    style = 0;
  }


  if (mousePressed) {

    float randomR, randomG, randomB;
    randomR = random(255);
    randomG = random(255);
    randomB = random(255);
    
    stroke(randomR, randomG, randomB); 
    fill(randomR, randomG, randomB);

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      ellipse(mouseX, mouseY, 3, 3);
      break;

    case 1:
      // draw a circle with random radius
      float esize = random(1, 25);
      ellipse(mouseX, mouseY, esize, esize);
      break;

    case 2:
      // draw a random sized rectangle
      float qsize = random(1, 20);
      quad(mouseX-qsize, mouseY, mouseX, mouseY-qsize, mouseX+qsize, mouseY, mouseX, mouseY+qsize   );
      break;

    case 3:
      // draw a triangle with random size
      float tsize = random(1, 30);
      triangle(mouseX-tsize, mouseY+tsize, mouseX, mouseY-tsize, mouseX+tsize, mouseY+tsize); 
      break;
    } // end of switch statement
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}
