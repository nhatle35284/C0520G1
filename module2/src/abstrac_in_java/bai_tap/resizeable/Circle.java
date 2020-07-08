package abstrac_in_java.bai_tap.resizeable;

import abstrac_in_java.edible.Edible;

public class Circle extends Shape implements Resizeable {
    private double radius = 1.0;
    public Circle() {
    }
    public Circle(double radius) {
        this.radius = radius;
    }
    public Circle(double radius, String color, boolean filled) {
        super(color, filled);
        this.radius = radius;
    }
    public double getRadius() {
        return radius;
    }
    public void setRadius(double radius) {
        this.radius = radius;
    }
    public double getArea() {
        return radius * radius * Math.PI;
    }
    public double getPerimeter() {
        return 2 * radius * Math.PI;
    }
    @Override
    public String toString() {
        return "A Circle with radius="
                + getRadius()
                + ", subclass of shape "
                + super.toString()
                + ", Area=" +
                + getArea();
    }
    @Override
    public void resize(double percent) {
        this.radius += (1+percent / 100);
    }
}
