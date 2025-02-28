public class Cluster {
    public final static int NUM_STEMS = 7;

    public Cluster(int len, int x, int y) {
        for (int i = 0; i < NUM_STEMS; i++) {
            double angle = i * (2 * Math.PI / NUM_STEMS); 
            Tendril t = new Tendril(len, angle, x, y);
            t.show();
        }
    }
}
