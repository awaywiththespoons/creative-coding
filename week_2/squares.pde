/*
* Becca Rose, August 2015
* made during the Creative Coding course
* Week 2, 03 - n squares
* based on code by Indae Hwang and Jon McCormack
*
* This is an iteration of the square drawing sketch
*/

int num = 5; // number of squares each frame
int gap; // how bit the gap between each square
PImage img; //adding and image for texture
int count = 0;

void setup() {
size(600, 600);
noStroke();
frameRate(1); // set the frame rate to 1 draw() call per second
gap =(int) random(1, 5); //the gap between is random
String url = "http://processing.beccarose.co.uk/wp-content/uploads/2015/08/ohp_texture2.jpg";
img = loadImage(url, "png");
}

void draw() {

background(190); // clear the screen to grey

// calculate the size of each square for the given number of squares and gap between them
int cellsize = (width - (num + 1) * gap) / num;
img.resize(cellsize, 0);

for (int i=0; i<num; i++) {
for (int j=0; j<num; j++) {

//make some random numbers for each round of squares
int randX = (int) random(-9, 12);
int randY = (int) random(-10, 12);
int colour = (int) random (0, 10); //deciding the colour of each square -it's gonna be between 1 and 10
int randTint = (int) random (100, 180);

// if the colour number is lower than 8 it will be pink
if (colour <=8) {
fill(247, 0, 100, 130);
}
//otherwise it will be blue
else {
fill (20, 200, 200, 130);
}
tint(255, randTint); //opacity of texture image
//add texture image
image(img, gap * (i+1) + (cellsize * i) + randX, gap * (j+1) + (cellsize * j)+ randY); //draw image
noTint();
//draw a square
rect(gap * (i+1) + (cellsize * i) + randX, gap * (j+1) + (cellsize * j)+ randY, cellsize, cellsize); //draw square

// print out the size of each square
print("colour = " + colour);
print(" X = " + randX);
println(" Y = " + randY);
}
}

// save your drawing when you press keyboard 's'
if ((keyPressed == true) && (key=='s')) {
saveFrame(count + "yourName.jpg");
println("s");
}

count++;
}
