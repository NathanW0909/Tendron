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
        // Use random color variations instead of fixed ones
        stroke(
          (int) random(50, 255),  // Random red value
          (int) random(50, 255),  // Random green value
          (int) random(50, 255)   // Random blue value
        );

        int startX = myX;
        int startY = myY;

        for (int i = 0; i < myNumSegments; i++) {
            myAngle += random(-0.2, 0.2); // Random angle change for wiggle effect
            int endX = startX + (int) (Math.cos(myAngle) * SEG_LENGTH);
            int endY = startY + (int) (Math.sin(myAngle) * SEG_LENGTH);
            
            line(startX, startY, endX, endY);
            
            startX = endX;
            startY = endY;
        }

        // Recursively generate a new cluster at the tip
        if (myNumSegments > 4) {  // Changed from `>=3` to `>4` for more branching
            new Cluster(myNumSegments / 3, startX, startY);
        }
    }
}
