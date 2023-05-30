package com.example.simple_calcualtor;

public class Calculator {

    public double calculate(String math, double numberA, double numberB) {
        switch (math) {
            case "+":
                return numberA + numberB;
            case "-":
                return numberA - numberB;
            case "*":
                return numberA * numberB;
            case "/":

                if (numberB == 0) {
                    throw new RuntimeException("Lỗi");
                } else {
                    return numberA / numberB;
                }

            default:
                throw new RuntimeException();
        }
    }
}