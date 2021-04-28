package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import lombok.RequiredArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentService {
    private static final Logger logger = Logger.getLogger(PaymentService.class);

    private final BankAccountRepo bankAccountRepo;

    public void updRefillInfo(User user, BankAccount bankAccount, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        if (money > 0) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() + money);

            bankAccountRepo.save(bankAccount);

            logger.info("На счет пользователя: " + user.getUsername() + ", Зачислено: " + money + " BYN");
        }
    }

    public void transferMoneyToUser(User user, BankAccount bankAccount, Double money, String bankAcc) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        if (!bankAccountRepo.findByUserAccount(bankAcc).equals(null)) {
            BankAccount recipient = bankAccountRepo.findByUserAccount(bankAcc);
            if (bankAccount.getUserMoney() - money >= 0) {
                recipient.setUserMoney(recipient.getUserMoney() + money);
                bankAccount.setUserMoney(bankAccount.getUserMoney() - money);

                bankAccountRepo.save(bankAccount);
                bankAccountRepo.save(recipient);

                logger.info("Со счета: " + bankAccount + ", Переведено: " + money + " BYN" + ", На счет: " + recipient);
            }
        }
    }

    public void payUtilities(User user, BankAccount bankAccount, Double sum) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        if (bankAccount.getUserMoney() >= sum) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() - sum);

            bankAccountRepo.save(bankAccount);

            logger.info("Со счета пользователя: " + user.getUsername() + ", Списано: " + sum + " BYN для оплаты коммунальных услуг");
        }
    }

    public void payMobile(User user, BankAccount bankAccount, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        if (money > 0 && bankAccount.getUserMoney() >= money) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() - money);

            bankAccountRepo.save(bankAccount);

            logger.info("Со счета пользователя: " + user.getUsername() + ", Списано: " + money + " BYN для оплаты мобильной связи");
        }
    }
}