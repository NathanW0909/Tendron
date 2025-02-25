class Tendril {
    public final static int SEG_LENGTH = 4; // Length of each segment
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
        stroke(0); // Black stroke

        for (int i = 0; i < myNumSegments; i++) {
            myAngle += random(-0.2, 0.2); // Random wiggle
            int endX = startX + (int) (cos((float) myAngle) * SEG_LENGTH);
            int endY = startY + (int) (sin((float) myAngle) * SEG_LENGTH);
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }

        // Recursively create a new cluster at the end if the tendril is long enough
        if (myNumSegments >= 3) {
            new Cluster(myNumSegments / 2, startX, startY);
        }
    }
}
