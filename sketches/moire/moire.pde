/*
    moire
*/

void setup() {
    size(600, 600);
    // pixelDensity(2);
}

int inc = width/10;

void draw() {
    background(0);

    for (int i = 0; i <= width; i += inc) {
        stroke(255);
        line(i, 0, mouseX, height);
        line(i, height,mouseX, 0);
    }
}
