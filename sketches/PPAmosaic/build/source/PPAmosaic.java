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

public class PPAmosaic extends PApplet {

/*
    PPAmosaic
*/

PImage pixelBG;
PImage[] ppa;
String ppaNum = "0026A";

PImage[] luxImg;
float[] lux;

int sclX, sclY;
int w, h;

public void setup() {
    
    //pixelDensity(2);

    //noSmooth();
    pixelBG = loadImage(ppaNum + "_PPA.png");

    w = pixelBG.width;
    h = pixelBG.height;
    sclX = width / w;
    sclY = height / h;

    File[] files = listFiles(sketchPath("data"));
    ppa = new PImage[files.length];
    lux = new float[ppa.length];
    luxImg = new PImage[ppa.length];

    for (int i = 0; i < ppa.length; i++) {
        String fileName = files[i].toString();
        PImage img = loadImage(fileName);

        ppa[i] = createImage(sclX, sclY, RGB);
        ppa[i].copy(img, 0, 0, img.width, img.height, 0, 0, sclX, sclY);
        ppa[i] = loadImage(fileName);

        float avg = 0;
        ppa[i].loadPixels();
        for (int j = 0; j < ppa[i].pixels.length; j++) {
            float l = brightness(ppa[i].pixels[j]);
            avg += l;
        }
        avg /= ppa[i].pixels.length;
        lux[i] = avg;
    }

    for (int i = 0; i < luxImg.length; i++) {
        float max = luxImg.length;
        for (int j = 0; j < lux.length; j++) {
            float delta = abs(i - brightness(j));
            if (delta < max) {
                max = delta;
                luxImg[i] = ppa[j];
            }
        }
    }
}

public void draw() {
    background(255);
    pixelBG.loadPixels();
    for (int x = 0; x < w; x++) {
        for (int y = 0; y < h; y++) {
            int indx = x + y * w;
            int c = pixelBG.pixels[indx];
            int indxImg = PApplet.parseInt(brightness(c));
            image(luxImg[indxImg], x * sclX, y * sclY, sclX, sclY);
        }
    }

    noLoop();
}

public File[] listFiles(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
        File[] files = file.listFiles();
        return files;
    } else return null;
}

// Save image on click
    String picTitle = "PPAmosaic";   // <-- change title
    int picNum = 1;
    public void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PPAmosaic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
