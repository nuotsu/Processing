/*
    cop
*/

PShape cop;
int cop_size = 250;

void setup() {
    size(500, 500, P2D);
    pixelDensity(2);

    cop = loadShape("cop.svg");
    cop.translate(-width/2, -height/2);
}

void draw() {
    background(0);

    cop.disableStyle();
    shape(cop, width/2, height/2, cop_size, cop_size);
    cop.rotate(0.001);
}
