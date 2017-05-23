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

public class moire extends PApplet {

/*
    moire
*/

public void setup() {
    
    // pixelDensity(2);
}

int inc = width/10;

public void draw() {
    background(0);

    for (int i = 0; i <= width; i += inc) {
        stroke(255);
        line(i, 0, mouseX, height);
        line(i, height,mouseX, 0);
    }
}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "moire" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
