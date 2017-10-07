import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class flow extends PApplet {

/*
    flow
*/

float movX = 0, movY;
int clr = color(random(32, 255), random(32, 255), random(32, 255));
int participants = 0,
    maxParticipants = 100;

public void setup() {
    
    background(0);
    frameRate(120);
    

    movY = height/2;
}

public void draw() {
    noStroke();
    fill(clr);

    movX += random(-3, 5) * 3;
    movY += random(-8, 8) * 1;
    ellipse(movX, movY, 1, 1);

    if (movY < 5) movY += 5;
    if (movY > height - 5) movY -= 5;

    if (movX > width * 6/10) {
        if (movY < height/2) movY += 1;
        else movY -= 1;
    }
    if (movX > width * 9/10) {
        if (movY < height/2) movY += 1.2f;
        else movY -= 1.2f;
    }
    if (movX > width * 9.7f/10) {
        if (movY < height/2) movY += 2;
        else movY -= 2;
    }
    if (movX > width) {
        movX = 0;
        movY = height/2;
        clr = color(random(32, 255), random(32, 255), random(32, 255));
        participants++;

        if (participants >= maxParticipants) noLoop();
    }
}

// Save image on click
    String picTitle = "flow";   // <-- change title
    int picNum = 1;
    public void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
  public void settings() {  size(500, 400);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "flow" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
