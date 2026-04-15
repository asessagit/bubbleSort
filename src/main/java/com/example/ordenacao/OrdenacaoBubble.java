package com.example.ordenacao;

import java.util.Scanner;

public class OrdenacaoBubble {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] v1 = new int[10];
        int aux;
        boolean troca;

        for (int i = 0; i < v1.length; i++) {
            System.out.print("Entre com o número " + (i + 1) + ": ");
            v1[i] = sc.nextInt();
        }

        troca = true;
        while (troca) {
            troca = false;
            for (int i = 0; i < v1.length - 1; i++) {
                if (v1[i] > v1[i + 1]) {
                    aux = v1[i];
                    v1[i] = v1[i + 1];
                    v1[i + 1] = aux;
                    troca = true;
                }
            }
        }

        System.out.println("\nVetor em ordem crescente:");
        for (int i = 0; i < v1.length; i++) {
            System.out.print(v1[i] + (i < v1.length - 1 ? " " : ""));
        }
        System.out.println();
        sc.close();
    }
}
