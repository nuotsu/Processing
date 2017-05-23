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

public class drawTri extends PApplet {

public void setup() {
    
     
}

public void draw() {
    background(255);

    sphere_3D(width*2, 255);
    drawTri(15, 10);
}

public void drawTri(int fR, int gridSize) {
    frameRate(fR);
    noStroke();
    for (int x = 0; x < width; x += gridSize) {
        for (int y = 0; y < height; y += gridSize) {
            fill(random(255));
            triangle(x + random(gridSize), y + random(gridSize), x + random(gridSize), y, x, y + random(gridSize));
        }
    }
}

public void sphere_3D(int count, int clr) {
    for (int i = count; i > 0; i -= 2) {
        noStroke();
        fill(random(clr), 32);
        ellipse(width/2, height/2, i, i);
    }
}

public void mouseClicked() {
    saveFrame("sketch.png");
}
  public void settings() {  size(400, 400);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "drawTri" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
