package by.pogoretskaya.stbank.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BankCredit {

    @Id
    private Long id;

    private int creditSum;
    private int paidOut;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCreditSum() {
        return creditSum;
    }

    public void setCreditSum(int creditSum) {
        this.creditSum = creditSum;
    }

    public int getPaidOut() {
        return paidOut;
    }

    public void setPaidOut(int paidOut) {
        this.paidOut = paidOut;
    }
}
