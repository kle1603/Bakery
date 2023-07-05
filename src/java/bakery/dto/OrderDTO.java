/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dto;

import java.util.Date;

/**
 *
 * @author kle
 */
public class OrderDTO {
    private int orderId;
    private CustomerDTO customer;
    private PaymentMethodDTO paymentMethod;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private String address;
    private String phone;
    private String firstName;
    private String lastName;
    private int totalProducts;

    public OrderDTO() {
    }

    public OrderDTO(int orderId, CustomerDTO customer, PaymentMethodDTO paymentMethod, Date orderDate, double totalAmount, String status, String address, String phone, String firstName, String lastName, int totalProducts) {
        this.orderId = orderId;
        this.customer = customer;
        this.paymentMethod = paymentMethod;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.address = address;
        this.phone = phone;
        this.firstName = firstName;
        this.lastName = lastName;
        this.totalProducts = totalProducts;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public PaymentMethodDTO getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethodDTO paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", customer=" + customer + ", paymentMethod=" + paymentMethod + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", address=" + address + ", phone=" + phone + ", firstName=" + firstName + ", lastName=" + lastName + ", totalProducts=" + totalProducts + '}';
    }

    

    
    
    
}