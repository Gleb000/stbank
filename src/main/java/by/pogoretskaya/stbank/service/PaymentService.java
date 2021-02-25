package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

    @Autowired
    BankAccountRepo bankAccountRepo;

    public void updRefillInfo(User user, BankAccount bankAccount, int money) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        if(money > 0) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() + money);
        }

        bankAccountRepo.save(bankAccount);
    }

    public void transferMoneyToUser(User user, BankAccount bankAccount, int money, String bankAcc) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        if(!bankAccountRepo.findByUserAccount(bankAcc).equals(null)) {
            BankAccount recipient = bankAccountRepo.findByUserAccount(bankAcc);
            if(bankAccount.getUserMoney() - money >= 0) {
                recipient.setUserMoney(recipient.getUserMoney() + money);
                bankAccount.setUserMoney(bankAccount.getUserMoney() - money);

                bankAccountRepo.save(bankAccount);
                bankAccountRepo.save(recipient);
            }
        }
    }
}