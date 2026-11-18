package org.example.model;

public class DemoOrder {
    private final String orderNumber;
    private final String customer;
    private final String product;
    private final int amount;
    private final String status;

    public DemoOrder(String orderNumber, String customer, String product, int amount, String status) {
        this.orderNumber = orderNumber;
        this.customer = customer;
        this.product = product;
        this.amount = amount;
        this.status = status;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public String getCustomer() {
        return customer;
    }

    public String getProduct() {
        return product;
    }

    public int getAmount() {
        return amount;
    }

    public String getStatus() {
        return status;
    }
}
