package geneue_stack_queue.bai_tap.reverse_element;

import sun.net.www.content.text.Generic;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class ReverseElement {
    public static void main(String[] args) {
        Stack<String> mStack = new Stack<>();
        Stack<String> Stack = new Stack<>();
        mStack.push("1");
        mStack.push("2");
        mStack.push("3");
        mStack.push("4");
        mStack.push("5");
        System.out.println(mStack);
        while (!mStack.isEmpty()){
            Stack.push(mStack.peek());
            mStack.pop();
        }
        System.out.println(Stack);
    }
}
