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

public class dots extends PApplet {

/*
    dots
*/

public void setup() {
    
    frameRate(2);
    
}

int gridSize = 10;
public void draw() {
    background(0);

    noStroke();
    for (int x = 0; x < width; x += gridSize)
        for (int y = 0; y < height; y += gridSize) {
            if (random(1) < 0.35f)
                fill(0, random(64, 196), random(255));
            else
                fill(0);
            ellipse(x + gridSize/2, y + gridSize/2, gridSize - 2, gridSize - 2);
        }
}

// Save image on click
    String picTitle = "dots";   // <-- change title
    int picNum = 1;
    public void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
  public void settings() {  size(400, 400);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dots" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
