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
    private int unitsInStock;
    private String description;

    public BreadDTO() {
    }

    public BreadDTO(int breadId, BreadTypeDTO breadType, String breadName, int unitsInStock, String description) {
        this.breadId = breadId;
        this.breadType = breadType;
        this.breadName = breadName;
        this.unitsInStock = unitsInStock;
        this.description = description;
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

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "BreadDTO{" + "breadId=" + getBreadId() + ", breadType=" + getBreadType() + ", breadName=" + getBreadName() + ", unitsInStock=" + getUnitsInStock() + ", description=" + getDescription() + '}';
    }
    
    
}
