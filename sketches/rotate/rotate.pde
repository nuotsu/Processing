/*
    rotate
*/

void setup() {
    size(400, 400);
    pixelDensity(2);
}

void draw() {
   background(255);

   shell();
}

void shell() {
    for (int r = 0; r < 4; r++) {
        pushMatrix();
            translate(width/2, height/2);
            rotate(r * PI/2);
            scale(0.5);
            for (float inc = 0; inc < TWO_PI; inc += PI/16) {
                float vtx_X = sin(inc) * width/2 + width/2;
                float vtx_Y = cos(inc) * height/2;

                if (inc > TWO_PI) {
                    noLoop();
                }

                pushMatrix();
                    line(0, 0, vtx_X, vtx_Y);
                popMatrix();
            }
        popMatrix();
    }
}
