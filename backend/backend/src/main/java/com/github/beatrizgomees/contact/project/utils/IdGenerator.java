package com.github.beatrizgomees.contact.project.utils;

public class IdGenerator {
    int maxAlpha = 58;
    int min = 1;
    int indice;
    int range = maxAlpha - 1;
    char[] longId = new char[7];

    public String generatedLongId() {
        String digit = "123456789ABCDEFGJIJKLMNOPQRSTUWYZabcdefgjijklmnopqrstuwyz";
        long convertedToLong = 0;
        String convertedToString = null;

        for (int x = 0; x < longId.length; x++) {
            this.indice = (int) (Math.random() * range) - min; //gerar o indice
            char alpha = digit.charAt(indice);
            longId[x] = alpha;

            convertedToString = String.copyValueOf(longId);


        }
        return convertedToString;
    }
}