/*
    drawTri
*/

void setup() {
    size(400, 400);
    // pixelDensity(2);
}

void draw() {
    background(255);

    // sphere_3D(width*2, 255);
    drawTri(15, 10);
}

void drawTri(int fR, int gridSize) {
    frameRate(fR);
    noStroke();
    for (int x = 0; x < width; x += gridSize) {
        for (int y = 0; y < height; y += gridSize) {
            fill(random(255));
            triangle(x + random(gridSize), y + random(gridSize), x + random(gridSize), y, x, y + random(gridSize));
        }
    }
}

void sphere_3D(int count, int clr) {
    for (int i = count; i > 0; i -= 2) {
        noStroke();
        fill(random(clr), 32);
        ellipse(width/2, height/2, i, i);
    }
}

void mouseClicked() {
    saveFrame("sketch.png");
}
