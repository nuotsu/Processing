/*
    テンプレ
*/

void setup() {
    size(400, 400);
    pixelDensity(2);
}

void draw() {
    background(255);
}

// Save image on click
    int picNum = 1;
    void mouseClicked() {
        String picTitle = "pixelTiles";
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
