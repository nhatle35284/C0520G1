package abstrac_in_java.thuc_hanh.comparable_circle;

import java.util.Arrays;

public class ComparableCircleTest {
    public static void main(String[] args) {
        ComparableCircle[] circles=new ComparableCircle[3];
        circles[0]=new ComparableCircle(3.6);
        circles[1]=new ComparableCircle();
        circles[2]=new ComparableCircle(3.5,"indigo",false);
        System.out.println("pre-sorted: " );
        for (ComparableCircle circle : circles) {
            System.out.println(circle);
        }
        Arrays.sort(circles);
        System.out.println("After-sorted: " );
        for (ComparableCircle circle:circles) {
            System.out.println(circle);
        }
    }
}
