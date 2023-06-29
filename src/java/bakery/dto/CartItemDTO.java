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
    private CartDTO cartId;
    private BreadDTO breadId;
    private int quantity;

    public CartItemDTO() {
    }

    public CartItemDTO(CartDTO cartId, BreadDTO breadId, int quantity) {
        this.cartId = cartId;
        this.breadId = breadId;
        this.quantity = quantity;
    }

    public CartDTO getCartId() {
        return cartId;
    }

    public void setCartId(CartDTO cartId) {
        this.cartId = cartId;
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
        return "CartItemDTO{" + "cartId=" + cartId + ", breadId=" + breadId + ", quantity=" + quantity + '}';
    }
    
    
}
