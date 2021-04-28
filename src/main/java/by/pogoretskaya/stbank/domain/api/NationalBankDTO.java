package by.pogoretskaya.stbank.domain.api;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class NationalBankDTO {
    @JsonProperty("Cur_Abbreviation")
    private String abbreviation;
    @JsonProperty("Cur_OfficialRate")
    private Double officialRate;
}
