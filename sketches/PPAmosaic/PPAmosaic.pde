/*
    PPAmosaic
*/

PImage pixelBG;
PImage[] ppa;
String ppaNum = "0026A";

PImage[] luxImg;
float[] lux;

int sclX, sclY;
int w, h;

void setup() {
    size(600, 600);
    //pixelDensity(2);

    //noSmooth();
    pixelBG = loadImage(ppaNum + "_PPA.png");

    w = pixelBG.width;
    h = pixelBG.height;
    sclX = width / w;
    sclY = height / h;

    File[] files = listFiles(sketchPath("data"));
    ppa = new PImage[files.length];
    lux = new float[ppa.length];
    luxImg = new PImage[ppa.length];

    for (int i = 0; i < ppa.length; i++) {
        String fileName = files[i].toString();
        PImage img = loadImage(fileName);

        ppa[i] = createImage(sclX, sclY, RGB);
        ppa[i].copy(img, 0, 0, img.width, img.height, 0, 0, sclX, sclY);
        ppa[i] = loadImage(fileName);

        float avg = 0;
        ppa[i].loadPixels();
        for (int j = 0; j < ppa[i].pixels.length; j++) {
            float l = brightness(ppa[i].pixels[j]);
            avg += l;
        }
        avg /= ppa[i].pixels.length;
        lux[i] = avg;
    }

    for (int i = 0; i < luxImg.length; i++) {
        float max = luxImg.length;
        for (int j = 0; j < lux.length; j++) {
            float delta = abs(i - brightness(j));
            if (delta < max) {
                max = delta;
                luxImg[i] = ppa[j];
            }
        }
    }
}

void draw() {
    background(255);
    pixelBG.loadPixels();
    for (int x = 0; x < w; x++) {
        for (int y = 0; y < h; y++) {
            int indx = x + y * w;
            color c = pixelBG.pixels[indx];
            int indxImg = int(brightness(c));
            image(luxImg[indxImg], x * sclX, y * sclY, sclX, sclY);
        }
    }

    noLoop();
}

File[] listFiles(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
        File[] files = file.listFiles();
        return files;
    } else return null;
}

// Save image on click
    String picTitle = "PPAmosaic";   // <-- change title
    int picNum = 1;
    void mouseClicked() {
        save("proc-" + picTitle + "-" + picNum + ".png");
        picNum++;
        //exit();
    }
