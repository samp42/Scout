package com.samuelproulx.scout.models;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;

public class Constants {
    ArrayList<Integer> day1Teams = new ArrayList<>(Arrays.asList(
            2626,
            3360,
            3533,
            3985,
            3990,
            4594,
            4955,
            5440,
            5528,
            5865,
            6872,
            6929,
            7605,
            8132,
            8152,
            8224
    ));

    ArrayList<Integer> day2Teams = new ArrayList<>(Arrays.asList(
            296,
            3379,
            3386,
            3550,
            3986,
            3990,
            4952,
            5439,
            5443,
            5528,
            5570,
            6622,
            6869,
            7590,
            7605,
            7700
    ));
    ArrayList<Integer> day3Teams = new ArrayList<>(Arrays.asList(
            296,
            3117,
            3360,
            3386,
            3544,
            3550,
            3975,
            3986,
            3990,
            3996,
            4947,
            4957,
            5439,
            5618,
            6540,
            7471,
            8067
    ));

    Hashtable<String, ArrayList<Integer>> competingTeams = new Hashtable() {{
        put("Day 1", new ArrayList<Integer>(day1Teams));
        put("Day 2", new ArrayList<Integer>(day2Teams));
        put("Day 3", new ArrayList<Integer>(day3Teams));
    }};

}
