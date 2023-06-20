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
public class BreadSizeDTO {
    private int breadSizeId;
    private BreadDTO bread;
    private BreadTypeDTO breadType;
    private String sizeName;
    private double price;
    private int quantity;

    public BreadSizeDTO() {
    }

    public BreadSizeDTO(int breadSizeId, BreadDTO bread, BreadTypeDTO breadType, String sizeName, double price, int quantity) {
        this.breadSizeId = breadSizeId;
        this.bread = bread;
        this.breadType = breadType;
        this.sizeName = sizeName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getBreadSizeId() {
        return breadSizeId;
    }

    public void setBreadSizeId(int breadSizeId) {
        this.breadSizeId = breadSizeId;
    }

    public BreadDTO getBread() {
        return bread;
    }

    public void setBread(BreadDTO bread) {
        this.bread = bread;
    }

    public BreadTypeDTO getBreadType() {
        return breadType;
    }

    public void setBreadType(BreadTypeDTO breadType) {
        this.breadType = breadType;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "BreadSizeDTO{" + "breadSizeId=" + getBreadSizeId() + ", bread=" + getBread() + ", breadType=" + getBreadType() + ", sizeName=" + getSizeName() + ", price=" + getPrice() + ", quantity=" + getQuantity() + '}';
    }
    
    
}