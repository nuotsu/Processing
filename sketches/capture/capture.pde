/*
    capture
*/

import processing.video.*;
Capture video;


int gridSize = 10;
int col, row;

void setup() {
    size(1280, 800);
    background(0);
    pixelDensity(2);

    col = width / gridSize;
    row = height / gridSize;

    video = new Capture(this, width, height, 30);
    video.start();
}

void captureEvent(Capture video) {
    video.read();
    video.loadPixels();
}

void draw() {
    //image(video, 0, 0, width, height);
    for (int i = 0; i < col; i++) {
        for (int j = 0; j < row; j++) {
            int x = i * gridSize;
            int y = j * gridSize;
            int pos = (video.width - x - 1) + y * video.width;

            float r = red(video.pixels[pos]);
            float g = green(video.pixels[pos]);
            float b = blue(video.pixels[pos]);
            color c = color(r,g,b, 128);

            pushMatrix();
                translate(x + gridSize/2, y + gridSize/2);
                rotate(TWO_PI * brightness(c) * random(0.98, 1.02) / 255);
                rectMode(CENTER);
                noStroke();
                fill(0);
                rect(0, 0, gridSize, gridSize);
                fill(510 - 3*brightness(c));
                rect(0, 0, gridSize * 3, 1);
                //text('+', 0, 0);
            popMatrix();
        }
    }
}

// Save image on click
    String picTitle = "capture";    // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
