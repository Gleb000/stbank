package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.PiggiBank;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.PiggiBankRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PiggiBankService {

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
    }

    public void crashPiggi(User user, BankAccount bankAccount, PiggiBank piggiBank) {
        bankAccount.setUserMoney(bankAccount.getUserMoney() + piggiBank.getPiggiBankMoney());

        piggiBankRepo.delete(piggiBank);
    }
}
