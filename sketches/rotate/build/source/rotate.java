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

public class rotate extends PApplet {

/*
    rotate
*/

public void setup() {
    
    
}

public void draw() {
   background(255);

   shell();
}

public void shell() {
    for (int r = 0; r < 4; r++) {
        pushMatrix();
            translate(width/2, height/2);
            rotate(r * PI/2);
            scale(0.5f);
            for (float inc = 0; inc < TWO_PI; inc += PI/16) {
                float vtx_X = sin(inc) * width/2 + width/2;
                float vtx_Y = cos(inc) * height/2;

                if (inc > TWO_PI) {
                    noLoop();
                }

                pushMatrix();
                    line(0, 0, vtx_X, vtx_Y);
                popMatrix();
            }
        popMatrix();
    }
}
  public void settings() {  size(400, 400);  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rotate" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
