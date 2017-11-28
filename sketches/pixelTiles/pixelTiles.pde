/*
    pixelTiles
*/

float count = 8;    // # x #

void setup() {
    size(600, 600);
    //pixelDensity(displayDensity());
    frameRate(1);
}

void draw() {
    background(255);

    noStroke();

    for (int y = 0; y < count; y++)
        for (int x = 0; x < count; x++) {
            pixelate(x, y, 1/count);
        }
}

int inc = 60;

void pixelate(int tX, int tY, float scl) {
    pushMatrix();
        translate(tX * width/count, tY * width/count);
        scale(scl);
        pushMatrix();
            float shrink = 0.8;
            translate(width * (1 - shrink)/2, height * (1 - shrink)/2);
            scale(shrink);
            // Complexity
                if (mouseX > width * 3/4 && mouseX < width) inc = 15;
                if (mouseX > width/2 && mouseX < width * 3/4) inc = 30;
                if (mouseX > width/4 && mouseX < width/2) inc = 60;
                if (mouseX > 0 && mouseX < width/4) inc = 120;

            for (int y = 0; y < height/2; y += inc) {
                for (int x = 0; x < width/2; x += inc) {
                    int pixel = floor(random(2));
                    drawPixel(pixel, x, y, inc, 0, 0, 1, 1);
                    drawPixel(pixel, x, y, inc, 1, 0, -1, 1);
                    drawPixel(pixel, x, y, inc, 0, 1, 1, -1);
                    drawPixel(pixel, x, y, inc, 1, 1, -1, -1);
                }
            }
        popMatrix();
    popMatrix();
}

void drawPixel(int pixel, int x, int y, int inc, int tX, int tY, int sX, int sY) {
    pushMatrix();
        translate(tX * width, tY * height);
        scale(sX, sY);
        //if (pixel == 2) fill(196);
        if (pixel == 1) fill(0);
        else fill(255);
        rect(x, y, inc, inc);
    popMatrix();
}

// Save image on click
    String picTitle = "pixelTiles";
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + picNum + ".png");
        picNum++;
        //exit();
    }
