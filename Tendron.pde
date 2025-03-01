Cluster c;
int bg1 = 255, bg2 = 255, bg3 = 255;

public void setup() {
    size(500, 500);
    background(bg1, bg2, bg3);
    noLoop();
}

public void draw() {
    background(bg1, bg2, bg3);
    c = new Cluster(50, width / 2, height / 2);
}

public void mousePressed() {
    // Random background color on click
    bg1 = (int) (random(100, 256)); // Avoid colors too close to black
    bg2 = (int) (random(100, 256));
    bg3 = (int) (random(100, 256));
    redraw();
}
