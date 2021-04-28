package by.pogoretskaya.stbank.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class BankCredit {

    @Id
    private Long id;

    private Double creditSum;
    private Double paidOut;

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getCreditSum() {
        return creditSum;
    }

    public void setCreditSum(Double creditSum) {
        this.creditSum = creditSum;
    }

    public Double getPaidOut() {
        return paidOut;
    }

    public void setPaidOut(Double paidOut) {
        this.paidOut = paidOut;
    }*/
}
