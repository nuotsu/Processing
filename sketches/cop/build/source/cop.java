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

public class cop extends PApplet {

/*
    Circle of Peace
*/

PShape cop;
int cop_size = 250;

public void setup() {
    
    

    cop = loadShape("cop.svg");
    cop.translate(-width/2, -height/2);
}

public void draw() {
    background(0);

    cop.disableStyle();
    shape(cop, width/2, height/2, cop_size, cop_size);
    cop.rotate(0.001f);
}
  public void settings() {  size(500, 500, P2D);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "cop" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
