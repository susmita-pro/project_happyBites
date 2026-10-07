package com.HappyBites.util;

import org.mindrot.jbcrypt.BCrypt;

public class temp {

    public static void main(String[] args) {

        String password = "sushmita@123";

        String hash = BCrypt.hashpw(
                password,
                BCrypt.gensalt(12)
        );

        System.out.println(hash);
    }
}