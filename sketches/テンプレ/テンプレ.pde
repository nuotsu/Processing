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
    String picTitle = "template";   // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
