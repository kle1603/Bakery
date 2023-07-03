/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dto;

/**
 *
 * @author Kle
 */
public class CartItemDTO {
    private CartDTO cart;
    private BreadDTO breadId;
    private int quantity;

    public CartItemDTO() {
    }

    public CartItemDTO(CartDTO cart, BreadDTO breadId, int quantity) {
        this.cart = cart;
        this.breadId = breadId;
        this.quantity = quantity;
    }

    public CartDTO getCart() {
        return cart;
    }

    public void setCart(CartDTO cart) {
        this.cart = cart;
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
        return "CartItemDTO{" + "cart=" + cart + ", breadId=" + breadId + ", quantity=" + quantity + '}';
    }

    
    
    
}
