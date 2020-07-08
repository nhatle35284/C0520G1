package abstrac_in_java.thuc_hanh.animal;

import abstrac_in_java.edible.Edible;

public class Chicken extends Animal implements Edible {
    @Override
    public String makeSound() {
        return "Chicken: cluck cluck";
    }

    @Override
    public String howToEat() {
        return "could be fried";
    }
}
