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
public class AccountDTO {
    private int accountId;
    private CustomerDTO customer;
    private String username;
    private String password;
    private String email;
    private RoleDTO role;
    private String facebookId;
    private String googleId;

    public AccountDTO() {
    }

    public AccountDTO(int accountId, CustomerDTO customer, String username, String password, String email, RoleDTO role, String facebookId, String googleId) {
        this.accountId = accountId;
        this.customer = customer;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
        this.facebookId = facebookId;
        this.googleId = googleId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public RoleDTO getRole() {
        return role;
    }

    public void setRole(RoleDTO role) {
        this.role = role;
    }

    public String getFacebookId() {
        return facebookId;
    }

    public void setFacebookId(String facebookId) {
        this.facebookId = facebookId;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "accountId=" + getAccountId() + ", customer=" + getCustomer() + ", username=" + getUsername() + ", password=" + getPassword() + ", email=" + getEmail() + ", role=" + getRole() + ", facebookId=" + getFacebookId() + ", googleId=" + getGoogleId() + '}';
    }
    
    
}