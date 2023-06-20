/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dto;

/**
 *
 * @author kle
 */
public class OrderDetailDTO {
    private OrderDTO order;
    private BreadSizeDTO breadSize;
    private int quantity;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(OrderDTO order, BreadSizeDTO breadSize, int quantity) {
        this.order = order;
        this.breadSize = breadSize;
        this.quantity = quantity;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public BreadSizeDTO getBreadSize() {
        return breadSize;
    }

    public void setBreadSize(BreadSizeDTO breadSize) {
        this.breadSize = breadSize;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "order=" + getOrder() + ", breadSize=" + getBreadSize() + ", quantity=" + getQuantity() + '}';
    }
    
    
}