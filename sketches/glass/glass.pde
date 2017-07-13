/*
    glass
*/

void setup() {
    size(400, 400);
    //pixelDensity(2);
    frameRate(10);
}

int inc = width/10; // 10 * 10
int rectSize = 10;

void draw() {
    background(255);

    noStroke();

    for (int y = 0; y < height; y += inc) {
        for (int x = 0; x < width; x += inc) {
            float shift_x1 = mouseX/rectSize * random(-1, 1);
            float shift_y1 = mouseY/rectSize * random(-1, 1);
            float shift_x2 = mouseX/rectSize * random(-1, 1);
            float shift_y2 = mouseY/rectSize * random(-1, 1);
            float shift_x3 = mouseX/rectSize * random(-1, 1);
            float shift_y3 = mouseY/rectSize * random(-1, 1);
            float shift_x4 = mouseX/rectSize * random(-1, 1);
            float shift_y4 = mouseY/rectSize * random(-1, 1);

            fill(random(64, 192), random(64, 192), random(64, 192), 64);

            beginShape();
                vertex(x + shift_x1, y + shift_y1);
                vertex(x + rectSize + shift_x2, y + rectSize + shift_y2);
                vertex(x + rectSize + shift_x3, y + rectSize + shift_y3);
                vertex(x + rectSize + shift_x4, y + rectSize + shift_y4);
            endShape();
        }
    }
}
