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

    public void addPiggiBank(User user, PiggiBank piggiBank, String piggiName, String date, int targetMoney) {
        piggiBank.setId(user.getId());
        piggiBank.setPiggiBankName(piggiName);
        piggiBank.setPiggiBankMoney(0);
        piggiBank.setTargetDate(date);
        piggiBank.setTargetMoney(targetMoney);

        piggiBankRepo.save(piggiBank);
    }

    public void topUpPiggiBank(User user, PiggiBank piggiBank, int money) {

        if(!(money < 0) && money < piggiBank.getTargetMoney() - piggiBank.getPiggiBankMoney()) {
            piggiBank.setPiggiBankMoney(piggiBank.getPiggiBankMoney() + money);
        }

        piggiBankRepo.save(piggiBank);
    }

    public void crashPiggi(User user, PiggiBank piggiBank) {
        piggiBankRepo.delete(piggiBank);
    }
}
