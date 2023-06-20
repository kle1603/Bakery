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

    public OrderDTO() {
    }

    public OrderDTO(int orderId, CustomerDTO customer, PaymentMethodDTO paymentMethod, Date orderDate, double totalAmount, String status) {
        this.orderId = orderId;
        this.customer = customer;
        this.paymentMethod = paymentMethod;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
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

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + getOrderId() + ", customer=" + getCustomer() + ", paymentMethod=" + getPaymentMethod() + ", orderDate=" + getOrderDate() + ", totalAmount=" + getTotalAmount() + ", status=" + getStatus() + '}';
    }
    
    
}