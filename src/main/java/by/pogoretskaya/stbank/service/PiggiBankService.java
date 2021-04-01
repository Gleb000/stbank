package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.PiggiBank;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.PiggiBankRepo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PiggiBankService {
    private static final Logger logger = Logger.getLogger(PiggiBankService.class);

    @Autowired
    BankAccountRepo bankAccountRepo;

    @Autowired
    PiggiBankRepo piggiBankRepo;

    public void addPiggiBank(User user, PiggiBank piggiBank, String piggiName, String date, Double targetMoney) {
        piggiBank.setId(user.getId());
        piggiBank.setPiggiBankName(piggiName);
        piggiBank.setPiggiBankMoney(0.0);
        piggiBank.setTargetDate(date);
        piggiBank.setTargetMoney(targetMoney);

        piggiBankRepo.save(piggiBank);
    }

    public void topUpPiggiBank(User user, PiggiBank piggiBank, Double money) {
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

        bankAccount.setUserMoney(bankAccount.getUserMoney() - money);
        piggiBank.setPiggiBankMoney(piggiBank.getPiggiBankMoney() + money);

        bankAccountRepo.save(bankAccount);
        piggiBankRepo.save(piggiBank);

        logger.info("Списаны средства: " + money + " BYN, Со счета пользователя: " + user.getUsername());
    }

    public void crashPiggi(User user, BankAccount bankAccount, PiggiBank piggiBank) {
        bankAccount.setUserMoney(bankAccount.getUserMoney() + piggiBank.getPiggiBankMoney());

        piggiBankRepo.delete(piggiBank);

        logger.info("На счет пользователя: " + user.getUsername() + ", Зачислено: " + piggiBank.getPiggiBankMoney() + " BYN");
    }
}
