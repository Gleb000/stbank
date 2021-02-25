package by.pogoretskaya.stbank.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BankAccountEUR {

    @Id
    public Long id;

    private String userAccountEUR;
    private int userMoneyEUR;

    public Long getId() {
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

    public int getUserMoneyEUR() {
        return userMoneyEUR;
    }

    public void setUserMoneyEUR(int userMoneyEUR) {
        this.userMoneyEUR = userMoneyEUR;
    }
}
