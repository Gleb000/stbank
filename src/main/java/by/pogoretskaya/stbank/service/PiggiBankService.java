package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.PiggiBank;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.PiggiBankRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PiggiBankService {

    @Autowired
    PiggiBankRepo piggiBankRepo;

    public void addPiggiBank(User user, PiggiBank piggiBank, String piggiName) {
        piggiBank.setId(user.getId());
        piggiBank.setPiggiBankName(piggiName);
        piggiBank.setPiggiBankMoney(0);

        piggiBankRepo.save(piggiBank);
    }
}
