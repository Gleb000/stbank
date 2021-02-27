package by.pogoretskaya.stbank.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

@Entity
public class PiggiBank {

    @Id
    private long id;

    @NotBlank(message = "Необходимо назвать копилку")
    private String piggiBankName;
    private int piggiBankMoney;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPiggiBankName() {
        return piggiBankName;
    }

    public void setPiggiBankName(String piggiBankName) {
        this.piggiBankName = piggiBankName;
    }

    public int getPiggiBankMoney() {
        return piggiBankMoney;
    }

    public void setPiggiBankMoney(int piggiBankMoney) {
        this.piggiBankMoney = piggiBankMoney;
    }
}
