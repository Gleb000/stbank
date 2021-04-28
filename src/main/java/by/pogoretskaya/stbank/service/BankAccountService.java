package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.BankAccountEUR;
import by.pogoretskaya.stbank.domain.BankAccountUSD;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.repos.BankAccountEURRepo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.BankAccountUSDRepo;
import by.pogoretskaya.stbank.util.NationalBankCourceApi;
import lombok.RequiredArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BankAccountService {
    private static final Logger logger = Logger.getLogger(BankAccountService.class);

    private final NationalBankCourceApi nationalBankCourceApi;
    private final BankAccountRepo bankAccountRepo;
    private final BankAccountUSDRepo bankAccountUSDRepo;
    private final BankAccountEURRepo bankAccountEURRepo;

    public void addUserAcc(User user, BankAccount bankAccount) {
        bankAccount.setId(user.getId());

        StringBuilder account = new StringBuilder("BY22BYN");
        String randString;
        int randNumbers;

        for (int i = 0; i < 5; i++) {
            randNumbers = (int)(Math.random()*(9999-1000) + 1000);
            randString = Integer.toString(randNumbers);

            account.append(randString);
        }

        bankAccount.setUserAccount(account.toString());
        bankAccount.setUserMoney(0.0);

        bankAccountRepo.save(bankAccount);

        logger.info("Открыт счет в валюте BYN на пользователя: " + user.getUsername());
    }

    public void addUserAccUSD(User user, BankAccountUSD bankAccountUSD) {
        bankAccountUSD.setId(user.getId());

        StringBuilder account = new StringBuilder("BY33USD");
        String randString;
        int randNumbers;

        for (int i = 0; i < 5; i++) {
            randNumbers = (int)(Math.random()*(9999-1000) + 1000);
            randString = Integer.toString(randNumbers);

            account.append(randString);
        }

        bankAccountUSD.setUserAccountUSD(account.toString());
        bankAccountUSD.setUserMoneyUSD(0.0);

        bankAccountUSDRepo.save(bankAccountUSD);

        logger.info("Открыт счет в валюте USD на пользователя: " + user.getUsername());
    }

    public void addUserAccEUR(User user, BankAccountEUR bankAccountEUR) {
        bankAccountEUR.setId(user.getId());

        StringBuilder account = new StringBuilder("BY44EUR");
        String randString;
        int randNumbers;

        for (int i = 0; i < 5; i++) {
            randNumbers = (int)(Math.random()*(9999-1000) + 1000);
            randString = Integer.toString(randNumbers);

            account.append(randString);
        }

        bankAccountEUR.setUserAccountEUR(account.toString());
        bankAccountEUR.setUserMoneyEUR(0.0);

        bankAccountEURRepo.save(bankAccountEUR);

        logger.info("Открыт счет в валюте EUR на пользователя: " + user.getUsername());
    }

    public void convertBYNtoUSD(User user, BankAccount bankAccount, BankAccountUSD bankAccountUSD, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());

        if (money > 0 && (bankAccount.getUserMoney() - money) >= 0) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() - money);
            bankAccountUSD.setUserMoneyUSD(bankAccountUSD.getUserMoneyUSD() + money/nationalBankCourceApi.getUSDOfficialRate());

            logger.info("Конвертация пользователем: " + user.getUsername() + ", " + money + " BYN в USD");
        }

        bankAccountRepo.save(bankAccount);
        bankAccountUSDRepo.save(bankAccountUSD);
    }

    public void convertBYNtoEUR(User user, BankAccount bankAccount, BankAccountEUR bankAccountEUR, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        bankAccountEUR = bankAccountEURRepo.getOne(user.getId());

        if (money > 0 && (bankAccount.getUserMoney() - money) >= 0) {
            bankAccount.setUserMoney(bankAccount.getUserMoney() - money);
            bankAccountEUR.setUserMoneyEUR(bankAccountEUR.getUserMoneyEUR() + money/nationalBankCourceApi.getEUROfficialRate());

            logger.info("Конвертация пользователем: " + user.getUsername() + ", " + money + " BYN в EUR");
        }

        bankAccountRepo.save(bankAccount);
        bankAccountEURRepo.save(bankAccountEUR);
    }

    public void convertUSDtoBYN(User user, BankAccount bankAccount, BankAccountUSD bankAccountUSD, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());

        if (money > 0 && (bankAccountUSD.getUserMoneyUSD() - money) >= 0) {
            bankAccountUSD.setUserMoneyUSD(bankAccountUSD.getUserMoneyUSD() - money);
            bankAccount.setUserMoney(bankAccount.getUserMoney() + money * nationalBankCourceApi.getUSDOfficialRate());

            logger.info("Конвертация пользователем: " + user.getUsername() + ", " + money + " USD в BYN");
        }

        bankAccountUSDRepo.save(bankAccountUSD);
        bankAccountRepo.save(bankAccount);
    }

    public void convertEURtoBYN(User user, BankAccount bankAccount, BankAccountEUR bankAccountEUR, Double money) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        bankAccountEUR = bankAccountEURRepo.getOne(user.getId());

        if (money > 0 && (bankAccountEUR.getUserMoneyEUR() - money) >= 0) {
            bankAccountEUR.setUserMoneyEUR(bankAccountEUR.getUserMoneyEUR() - money);
            bankAccount.setUserMoney(bankAccount.getUserMoney() + money * nationalBankCourceApi.getEUROfficialRate());

            logger.info("Конвертация пользователем: " + user.getUsername() + ", " + money + " EUR в BYN");
        }

        bankAccountEURRepo.save(bankAccountEUR);
        bankAccountRepo.save(bankAccount);
    }
}