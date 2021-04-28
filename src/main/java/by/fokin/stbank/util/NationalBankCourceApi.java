package by.fokin.stbank.util;

import by.fokin.stbank.domain.api.NationalBankDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Component
@RequiredArgsConstructor
public class NationalBankCourceApi {

    private final RestTemplate restTemplate;

    public Double getUSDOfficialRate() {
        List<NationalBankDTO> nationalBankDTOS = getAllOfficialRates();
        Double rate = 2.5;

        for (NationalBankDTO nationalBankDTO : nationalBankDTOS) {
            if (nationalBankDTO.getAbbreviation().equals("USD")) {
                rate = nationalBankDTO.getOfficialRate();

                break;
            }
        }

        return rate;
    }

    public Double getEUROfficialRate() {
        List<NationalBankDTO> nationalBankDTOS = getAllOfficialRates();
        Double rate = 3.1;

        for (NationalBankDTO nationalBankDTO : nationalBankDTOS) {
            if (nationalBankDTO.getAbbreviation().equals("EUR")) {
                rate = nationalBankDTO.getOfficialRate();

                break;
            }
        }

        return rate;
    }

    public Double getRUBOfficialRate() {
        List<NationalBankDTO> nationalBankDTOS = getAllOfficialRates();
        Double rate = 3.4;

        for (NationalBankDTO nationalBankDTO : nationalBankDTOS) {
            if (nationalBankDTO.getAbbreviation().equals("RUB")) {
                rate = nationalBankDTO.getOfficialRate();

                break;
            }
        }

        return rate;
    }

    public List<NationalBankDTO> getAllOfficialRates() {
        String url = "https://www.nbrb.by/api/exrates/rates?periodicity=0";

        return restTemplate.exchange(
                url,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<NationalBankDTO>>() {})
                .getBody();
    }
}
