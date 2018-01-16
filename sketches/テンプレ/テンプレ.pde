/*
    テンプレ
*/

void setup() {
    pixelDensity(displayDensity());
    size(400, 400);
}

void draw() {
    background(255);
}

// Save image on click
    String picTitle = "テンプレ";   // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
