class Tendril {
    public final static int SEG_LENGTH = 4; // Length of each segment in the tendril
    private int myNumSegments, myX, myY;
    private double myAngle;

    public Tendril(int len, double theta, int x, int y) {
        myNumSegments = len;
        myAngle = theta;
        myX = x;
        myY = y;
    }

    public void show() {
        int startX = myX, startY = myY;

        strokeWeight(map(myNumSegments, 3, 50, 1, 4)); // Vary stroke thickness
        for (int i = 0; i < myNumSegments; i++) {
            myAngle += random(-0.2, 0.2); // Random wiggling
            int endX = startX + (int) (Math.cos(myAngle) * SEG_LENGTH);
            int endY = startY + (int) (Math.sin(myAngle) * SEG_LENGTH);
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }

        if (myNumSegments >= 3) {
            new Cluster(myNumSegments / 2, startX, startY); // Recursively generate cluster
        }
    }
}
