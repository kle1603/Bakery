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
public class BreadTypeDTO {
    private int breadTypeId;
    private String breadTypeName;

    public BreadTypeDTO() {
    }

    public BreadTypeDTO(int breadTypeId, String breadTypeName) {
        this.breadTypeId = breadTypeId;
        this.breadTypeName = breadTypeName;
    }

    public int getBreadTypeId() {
        return breadTypeId;
    }

    public void setBreadTypeId(int breadTypeId) {
        this.breadTypeId = breadTypeId;
    }

    public String getBreadTypeName() {
        return breadTypeName;
    }

    public void setBreadTypeName(String breadTypeName) {
        this.breadTypeName = breadTypeName;
    }

    @Override
    public String toString() {
        return "BreadTypeDTO{" + "breadTypeId=" + getBreadTypeId() + ", breadTypeName=" + getBreadTypeName() + '}';
    }
    
    
}
