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
    @NotBlank(message = "Укажите дату, до которой хотите накопить сумму")
    private String targetDate;
    private Integer targetMoney;
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

    public String getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(String targetDate) {
        this.targetDate = targetDate;
    }

    public Integer getTargetMoney() {
        return targetMoney;
    }

    public void setTargetMoney(Integer targetMoney) {
        this.targetMoney = targetMoney;
    }

    public int getPiggiBankMoney() {
        return piggiBankMoney;
    }

    public void setPiggiBankMoney(int piggiBankMoney) {
        this.piggiBankMoney = piggiBankMoney;
    }
}
