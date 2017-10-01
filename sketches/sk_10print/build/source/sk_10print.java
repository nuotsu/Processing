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

public class sk_10print extends PApplet {

/*
    sk_10print
*/

public void setup() {
    
    background(0);
    //frameRate(120);
    //pixelDensity(2);
}

int x = 0;
int y = 0;
int d = 20;

public void draw() {
    stroke(255);
    if (random(1) < 0.5f) {
        line(x + d*0.5f, y, x + d*0.5f, y + d);
    } else {
        line(x, y + d*0.5f, x + d, y + d*0.5f);
    }

    x += d;
    if (x > width) {
        x = 0;
        y += d;
    }
    if (y > height) {
        noLoop();
    }
}

// Save image on click
    String picTitle = "sk_10print";
    int picNum = 1;
    public void mouseClicked() {
        save("proc-" + picTitle + picNum + ".png");
        picNum++;
        //exit();
    }
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sk_10print" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
