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
public class BreadDTO extends ImageDTO {
    private int breadId;
    private BreadTypeDTO breadType;
    private String breadName;
    private String description;
    private double price;
    private int quantity;

    public BreadDTO() {
    }

    public BreadDTO(int breadId, BreadTypeDTO breadType, String breadName, int unitsInStock, String description, double price, int quantity) {
        this.breadId = breadId;
        this.breadType = breadType;
        this.breadName = breadName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public int getBreadId() {
        return breadId;
    }

    public void setBreadId(int breadId) {
        this.breadId = breadId;
    }

    public BreadTypeDTO getBreadType() {
        return breadType;
    }

    public void setBreadType(BreadTypeDTO breadType) {
        this.breadType = breadType;
    }

    public String getBreadName() {
        return breadName;
    }

    public void setBreadName(String breadName) {
        this.breadName = breadName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        return "BreadDTO{" + "breadId=" + breadId + ", breadType=" + breadType + ", breadName=" + breadName + ", description=" + description + ", price=" + price + ", quantity=" + quantity + '}';
    }



    
    
}
