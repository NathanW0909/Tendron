class Tendril {
    public final static int SEG_LENGTH = 4; // Length of each segment in the tendril
    private int myNumSegments, myX, myY;
    private double myAngle;
    private int tendrilColor;

    public Tendril(int len, double theta, int x, int y) {
        myNumSegments = len;
        myAngle = theta;
        myX = x;
        myY = y;

        // Assign colors based on length with some randomness
        if (myNumSegments > 10) {
            tendrilColor = color(random(0, 100), random(0, 50), random(200, 255)); // Blue shades
        } else if (myNumSegments >= 5) {
            tendrilColor = color(random(0, 50), random(150, 255), random(0, 100)); // Green shades
        } else {
            tendrilColor = color(random(150, 255), random(0, 100), random(0, 50)); // Red/orange shades
        }
    }

    public void show() {
        int startX = myX;
        int startY = myY;

        stroke(tendrilColor);
        strokeWeight(map(myNumSegments, 3, 50, 1, 4)); // Vary thickness

        for (int i = 0; i < myNumSegments; i++) {
            myAngle += random(-0.2, 0.2); // Random wiggling
            int endX = startX + (int) (Math.cos(myAngle) * SEG_LENGTH);
            int endY = startY + (int) (Math.sin(myAngle) * SEG_LENGTH);
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }

        if (myNumSegments >= 3) {
            new Cluster(myNumSegments / 3, startX, startY); // Recursively generate clusters
        }
    }
}
