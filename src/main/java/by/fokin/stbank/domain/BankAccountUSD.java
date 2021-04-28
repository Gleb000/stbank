package by.fokin.stbank.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class BankAccountUSD {

    @Id
    public Long id;

    private String userAccountUSD;
    private Double userMoneyUSD;

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserAccountUSD() {
        return userAccountUSD;
    }

    public void setUserAccountUSD(String userAccountUSD) {
        this.userAccountUSD = userAccountUSD;
    }

    public Double getUserMoneyUSD() {
        return userMoneyUSD;
    }

    public void setUserMoneyUSD(Double userMoneyUSD) {
        this.userMoneyUSD = userMoneyUSD;
    }*/
}
