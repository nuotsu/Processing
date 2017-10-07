/*
    flow
*/

float movX = 0, movY;
color clr = color(random(32, 255), random(32, 255), random(32, 255));
int participants = 0,
    maxParticipants = 100;

void setup() {
    size(500, 400);
    background(0);
    frameRate(120);
    //pixelDensity(2);

    movY = height/2;
}

void draw() {
    noStroke();
    fill(clr);

    movX += random(-3, 5) * 3;
    movY += random(-8, 8) * 1;
    ellipse(movX, movY, 1, 1);

    if (movY < 5) movY += 5;
    if (movY > height - 5) movY -= 5;

    if (movX > width * 6/10) {
        if (movY < height/2) movY += 1;
        else movY -= 1;
    }
    if (movX > width * 9/10) {
        if (movY < height/2) movY += 1.2;
        else movY -= 1.2;
    }
    if (movX > width * 9.7/10) {
        if (movY < height/2) movY += 2;
        else movY -= 2;
    }
    if (movX > width) {
        movX = 0;
        movY = height/2;
        clr = color(random(32, 255), random(32, 255), random(32, 255));
        participants++;

        if (participants >= maxParticipants) noLoop();
    }
}

// Save image on click
    String picTitle = "flow";   // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
