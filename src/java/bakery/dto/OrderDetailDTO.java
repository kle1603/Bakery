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
    private BreadDTO breadId;
    private int quantity;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(OrderDTO order, BreadDTO breadId, int quantity) {
        this.order = order;
        this.breadId = breadId;
        this.quantity = quantity;
    }

    public OrderDTO getOrder() {
        return order;
    }

    public void setOrder(OrderDTO order) {
        this.order = order;
    }

    public BreadDTO getBreadId() {
        return breadId;
    }

    public void setBreadId(BreadDTO breadId) {
        this.breadId = breadId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "order=" + order + ", breadId=" + breadId + ", quantity=" + quantity + '}';
    }

    
    
    
}