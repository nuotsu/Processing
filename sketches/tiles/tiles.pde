/*
    tiles
*/

void setup() {
    size(500, 500);
    //pixelDensity(2);
    frameRate(1);
}

void draw() {
    background(255);

    noStroke();

    quadrant(0, 1);
    quadrant(width/4, 0.5);
}

float inc = width/2;

void quadrant(float transl, float scl) {
    // Complexity
        if (mouseX > width * 3/4 && mouseX < width) {
            inc = width/10;
        }
        if (mouseX > width/2 && mouseX < width * 3/4) {
            inc = width/5;
        }
        if (mouseX > width/4 && mouseX < width/2) {
            inc = width/4;
        }
        if (mouseX > 0 && mouseX < width/4) {
            inc = width/2;
        }

    pushMatrix();
        translate(transl, transl);
        scale(scl);
        for (int y = 0; y < height/2; y += inc) {
            for (int x = 0; x < width/2; x += inc) {
                int type = floor(random(6));
                drawTri(x, y, inc, type, 0, 0, 1, 1);
                drawTri(x, y, inc, type, 1, 0, -1, 1);
                drawTri(x, y, inc, type, 0, 1, 1, -1);
                drawTri(x, y, inc, type, 1, 1, -1, -1);
            }
        }
    popMatrix();
}

void drawTri(int x, int y, float inc, int type, int tX, int tY, int sX, int sY) {
    pushMatrix();
        translate(tX * width, tY * height);
        scale(sX, sY);
        if (type == 0) {
            fill(0);
            triangle(x, y, x, y + inc, x + inc, y + inc);   // ◣
        }
        if (type == 1) {
            fill(96);
            triangle(x + inc, y, x, y + inc, x + inc, y + inc);   // ◢
        }
        if (type == 2) {
            fill(192);
            triangle(x, y, x, y + inc, x + inc, y);   // ◤
        }
        if (type == 3) {
            fill(192);
            triangle(x + inc, y, x, y + inc, x + inc, y + inc);   // ◢
        }
        if (type == 4) {
            fill(96);
            triangle(x, y, x, y + inc, x + inc, y);   // ◤
        }
        if (type == 5) {
            fill(0);
            triangle(x, y, x + inc, y, x + inc, y + inc);   // ◥
        }
    popMatrix();
}

// Save image on click
    int picNum = 1;
    void mouseClicked() {
        String picTitle = "tiles";
        save("proc-" + picTitle + picNum + ".png");
        picNum++;
        //exit();
    }
