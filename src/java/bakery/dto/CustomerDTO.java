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
public class CustomerDTO {
    private int customerId;
    private String firstName;
    private String lastName;
    private String fullName;
    private String avatar;

    public CustomerDTO() {
    }

    public CustomerDTO(int customerId, String firstName, String lastName, String fullName, String avatar) {
        this.customerId = customerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = fullName;
        this.avatar = avatar;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "CustomerDTO{" + "customerId=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName + ", fullName=" + fullName + ", avatar=" + avatar + '}';
    }

    
    
    
}
