package com.laptrinhjavaweb.entity;
public enum Category {
    DANH_MUC_1("Danh mục 1"),
    DANH_MUC_2("Danh mục 2"),
    DANH_MUC_3("Danh mục 3");

    private final String value;

    Category(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static Category fromValue(String value) {
        for (Category category : Category.values()) {
            if (category.value.equals(value)) {
                return category;
            }
        }
        throw new IllegalArgumentException("No enum constant with value " + value);
    }
}
