package by.pogoretskaya.stbank.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class BankAccount {

    @Id
    public Long id;

    private String userAccount;
    private Double userMoney;

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public Double getUserMoney() {
        return userMoney;
    }

    public void setUserMoney(Double userMoney) {
        this.userMoney = userMoney;
    }*/
}
