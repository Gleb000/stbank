package by.pogoretskaya.stbank.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class BankAccountEUR {

    @Id
    public Long id;

    private String userAccountEUR;
    private Double userMoneyEUR;

    /*public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserAccountEUR() {
        return userAccountEUR;
    }

    public void setUserAccountEUR(String userAccountEUR) {
        this.userAccountEUR = userAccountEUR;
    }

    public Double getUserMoneyEUR() {
        return userMoneyEUR;
    }

    public void setUserMoneyEUR(Double userMoneyEUR) {
        this.userMoneyEUR = userMoneyEUR;
    }*/
}
