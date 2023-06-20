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
public class PaymentMethodDTO {
    private int paymentMethodId;
    private String paymentMethodName;

    public PaymentMethodDTO() {
    }

    public PaymentMethodDTO(int paymentMethodId, String paymentMethodName) {
        this.paymentMethodId = paymentMethodId;
        this.paymentMethodName = paymentMethodName;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName;
    }

    @Override
    public String toString() {
        return "PaymentMethodDTO{" + "paymentMethodId=" + getPaymentMethodId() + ", paymentMethodName=" + getPaymentMethodName() + '}';
    }
    
    
}
