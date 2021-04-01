package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.BankCredit;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.BankCreditRepo;
import by.pogoretskaya.stbank.repos.UserRepo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankCreditService {
    private static final Logger logger = Logger.getLogger(BankCreditService.class);

    @Autowired
    private BankAccountRepo bankAccountRepo;

    @Autowired
    private BankCreditRepo bankCreditRepo;

    @Autowired
    private UserRepo userRepo;

    public void addCredit(User user, BankAccount bankAccount, BankCredit bankCredit, Double money) {

        if (money > 0) {
            bankCredit.setId(user.getId());
            bankCredit.setCreditSum(money + (money*0.2));
            bankCredit.setPaidOut(0.0);

            bankAccount = bankAccountRepo.getOne(user.getId());

            bankAccount.setUserMoney(bankAccount.getUserMoney() + money);

            bankCreditRepo.save(bankCredit);
            bankAccountRepo.save(bankAccount);

            logger.info("Взят кредит на пользователя: " + user.getUsername() + ", На сумму: " + money + " BYN, Общая сумма выплаты: " + bankCredit.getCreditSum() + " BYN");
        }
    }

    public void payOffCredit(User user, BankAccount bankAccount, BankCredit bankCredit, Double money) {

        bankAccount = bankAccountRepo.getOne(user.getId());
        bankCredit = bankCreditRepo.getOne(user.getId());

        bankAccount.setUserMoney(bankAccount.getUserMoney() - money);
        bankCredit.setPaidOut(bankCredit.getPaidOut() + money);

        if (bankCredit.getPaidOut().equals(bankCredit.getCreditSum())) {
            bankCreditRepo.delete(bankCredit);

            logger.info("Выплачен кредит пользователем: " + user.getUsername() + " ,Списано: " + money + " BYN");
        } else {
            bankCreditRepo.save(bankCredit);

            logger.info("Выплачено пользователем: " + user.getUsername() + ", Сумма: " + money + " BYN, Оставшаяся сумма выплаты: " + (bankCredit.getCreditSum() - bankCredit.getPaidOut()) + " BYN");
        }

        bankAccountRepo.save(bankAccount);
    }
}