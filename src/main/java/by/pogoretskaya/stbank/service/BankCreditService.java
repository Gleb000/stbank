package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.BankCredit;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.BankCreditRepo;
import by.pogoretskaya.stbank.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankCreditService {

    @Autowired
    private BankAccountRepo bankAccountRepo;

    @Autowired
    private BankCreditRepo bankCreditRepo;

    @Autowired
    private UserRepo userRepo;

    public void addCredit(User user, BankAccount bankAccount, BankCredit bankCredit, int money) {

        if(money > 0) {
            bankCredit.setId(user.getId());
            bankCredit.setCreditSum(money);
            bankCredit.setPaidOut(0);

            bankAccount = bankAccountRepo.getOne(user.getId());

            bankAccount.setUserMoney(money);

            bankCreditRepo.save(bankCredit);
            bankAccountRepo.save(bankAccount);
        }
    }

    public void payOffCredit(User user, BankAccount bankAccount, BankCredit bankCredit, int money) {

        bankAccount = bankAccountRepo.getOne(user.getId());
        bankCredit = bankCreditRepo.getOne(user.getId());

        if(money > 0 || money <= (bankCredit.getCreditSum() - bankCredit.getPaidOut())) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() - money);
            bankCredit.setPaidOut(bankCredit.getPaidOut() + money);
            if(bankCredit.getPaidOut() >= bankCredit.getCreditSum()) {
                bankCreditRepo.delete(bankCredit);
            } else {
                bankCreditRepo.save(bankCredit);
            }
            bankAccountRepo.save(bankAccount);
        }
    }
}
