package com.samuelproulx.scout.models;

public class Enums {
    enum AllianceEnum {
         BLUE(0),
         RED(1);

        private int value;
         private void Alliance (int value) {
            this.value = value;
        }
    }

}
