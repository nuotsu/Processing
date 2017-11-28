/*
    dots
*/

void setup() {
    size(400, 400);
    frameRate(10);
    //pixelDensity(2);
}

int gridSize = 10;
void draw() {
    background(0);

    noStroke();
    for (int x = 0; x < width; x += gridSize)
        for (int y = 0; y < height; y += gridSize) {
            if (random(1) < 0.35)
                fill(0, random(64, 196), random(255));
            else
                fill(0);
            ellipse(x + gridSize/2, y + gridSize/2, gridSize - 2, gridSize - 2);
        }
}

// Save image on click
    String picTitle = "dots";   // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
