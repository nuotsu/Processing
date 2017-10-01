/*
    sk_10print
*/

void setup() {
    size(400, 400);
    background(0);
    frameRate(240);
    //pixelDensity(2);
}

int x = 0;
int y = 0;
int d = 10;

void draw() {
    stroke(255);
    if (random(1) < 0.5) {
        line(x + d*0.5, y, x + d*0.5, y + d);
    } else {
        line(x, y + d*0.5, x + d, y + d*0.5);
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
    void mouseClicked() {
        save("proc-" + picTitle + picNum + ".png");
        picNum++;
        //exit();
    }
