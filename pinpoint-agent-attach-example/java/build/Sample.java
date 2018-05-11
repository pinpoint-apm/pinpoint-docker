public class Sample {

    public static void main(String[] args) {
        System.out.println("Sample Java Start");
        try {
            while (true) {
                Thread.sleep(1000);
            }
        }
        catch (java.lang.InterruptedException e) {
            System.out.println("Test Finished");
        }
    }
}