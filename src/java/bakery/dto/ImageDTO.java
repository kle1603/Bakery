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
public class ImageDTO {
    private int imageId;
    private BreadDTO bread;
    private String imageUrl;

    public ImageDTO() {
    }

    public ImageDTO(int imageId, BreadDTO bread, String imageUrl) {
        this.imageId = imageId;
        this.bread = bread;
        this.imageUrl = imageUrl;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public BreadDTO getBread() {
        return bread;
    }

    public void setBread(BreadDTO bread) {
        this.bread = bread;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "ImageDTO{" + "imageId=" + getImageId() + ", bread=" + getBread() + ", imageUrl=" + getImageUrl() + '}';
    }
    
    
}
