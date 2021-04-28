package by.fokin.stbank.controller;

import by.fokin.stbank.domain.*;
import by.fokin.stbank.repos.*;
import by.fokin.stbank.service.BankAccountService;
import by.fokin.stbank.util.NationalBankCourceApi;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.regex.Pattern;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class BankAccountController {

    private final BankAccountService bankAccountService;
    private final UserInfoRepo userInfoRepo;
    private final BankAccountRepo bankAccountRepo;
    private final BankAccountUSDRepo bankAccountUSDRepo;
    private final BankAccountEURRepo bankAccountEURRepo;
    private final BankCreditRepo bankCreditRepo;
    private final PiggiBankRepo piggiBankRepo;
    private final NationalBankCourceApi nationalBankCourceApi;

    @GetMapping("internetBanking")
    public String getAccInfo(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        if (bankCreditRepo.existsById(user.getId())) {
            BankCredit bankCredit = bankCreditRepo.getOne(user.getId());

            model.addAttribute("creditSum", bankCredit.getCreditSum());
            model.addAttribute("paidOut", bankCredit.getPaidOut());
        } else {
            model.addAttribute("creditSum", null);
        }

        if (piggiBankRepo.existsById(user.getId())) {
            PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

            model.addAttribute("piggiName", piggiBank.getPiggiBankName());
            model.addAttribute("piggiMoney", piggiBank.getPiggiBankMoney());
        } else {
            model.addAttribute("piggiName", null);
        }

        if (userInfoRepo.existsById(user.getId())) {
            UserInfo userInfo = userInfoRepo.getOne(user.getId());

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());
        } else {
            model.addAttribute("firstName", null);
        }

        if (bankAccountRepo.existsById(user.getId())) {
            BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

            model.addAttribute("userBankAcc", bankAccount.getUserAccount());
            model.addAttribute("userAccMoney", bankAccount.getUserMoney());
        } else {
            model.addAttribute("userBankAcc", null);
        }

        if (bankAccountUSDRepo.existsById(user.getId())) {
            BankAccountUSD bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());
            model.addAttribute("bankAccountUSD", bankAccountUSD.getUserAccountUSD());
            model.addAttribute("userAccMoneyUSD", bankAccountUSD.getUserMoneyUSD());
        } else {
            model.addAttribute("bankAccountUSD", null);
        }

        if (bankAccountEURRepo.existsById(user.getId())) {
            BankAccountEUR bankAccountEUR = bankAccountEURRepo.getOne(user.getId());
            model.addAttribute("bankAccountEUR", bankAccountEUR.getUserAccountEUR());
            model.addAttribute("userAccMoneyEUR", bankAccountEUR.getUserMoneyEUR());
        } else {
            model.addAttribute("bankAccountEUR", null);
        }
        return "internetBanking";
    }

    @GetMapping("addAccInfo")
    public String getUserAccName(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        return "addAccInfo";
    }

    @PostMapping("addAccInfo")
    public String addAccInfo(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount
    ) {
        bankAccountService.addUserAcc(user, bankAccount);
        return "redirect:/user/internetBanking";
    }

    @GetMapping("addAccInfoUSD")
    public String getUserAccNameUSD(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        return "addAccInfoUSD";
    }

    @PostMapping("addAccInfoUSD")
    public String addAccInfoUSD(
            @AuthenticationPrincipal User user,
            BankAccountUSD bankAccountUSD
    ) {
        bankAccountService.addUserAccUSD(user, bankAccountUSD);
        return "redirect:/user/internetBanking";
    }

    @GetMapping("addAccInfoEUR")
    public String getUserAccNameEUR(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        return "addAccInfoEUR";
    }

    @PostMapping("addAccInfoEUR")
    public String addAccInfoEUR(
            @AuthenticationPrincipal User user,
            BankAccountEUR bankAccountEUR
    ) {
        bankAccountService.addUserAccEUR(user, bankAccountEUR);
        return "redirect:/user/internetBanking";
    }

    @GetMapping("BYNtoUSD")
    public String getBYNtoUSD(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());
        model.addAttribute("USDRate", nationalBankCourceApi.getUSDOfficialRate());

        return "BYNtoUSD";
    }

    @PostMapping("BYNtoUSD")
    public String convBYNtoUSD(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountUSD bankAccountUSD,
            Model model,
            @RequestParam String money
    ) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());
        model.addAttribute("USDRate", nationalBankCourceApi.getUSDOfficialRate());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney <= 0 || bankAccount.getUserMoney() < userMoney) {
                if (userMoney <= 0) {
                    model.addAttribute("moneyError", "Сумма пополнения меньше нуля");
                }

                if (bankAccount.getUserMoney() < userMoney) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "BYNtoUSD";
            }

            bankAccountService.convertBYNtoUSD(user, bankAccount, bankAccountUSD, userMoney);
        } else {
            model.addAttribute("moneyError", "Некорректная сумма пополнения");

            return "BYNtoUSD";
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("BYNtoEUR")
    public String getBYNtoEUR(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());
        model.addAttribute("EURRate", nationalBankCourceApi.getEUROfficialRate());

        return "BYNtoEUR";
    }

    @PostMapping("BYNtoEUR")
    public String convBYNtoEUR(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountEUR bankAccountEUR,
            Model model,
            @RequestParam String money
    ) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());
        model.addAttribute("EURRate", nationalBankCourceApi.getEUROfficialRate());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney <= 0 || bankAccount.getUserMoney() < userMoney) {
                if (userMoney <= 0) {
                    model.addAttribute("moneyError", "Сумма пополнения меньше нуля");
                }

                if (bankAccount.getUserMoney() < userMoney) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "BYNtoEUR";
            }

            bankAccountService.convertBYNtoEUR(user, bankAccount, bankAccountEUR, userMoney);
        } else {
            model.addAttribute("moneyError", "Некорректная сумма пополнения");

            return "BYNtoEUR";
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("USDtoBYN")
    public String getUSDtoBYN(Model model, @AuthenticationPrincipal User user, BankAccountUSD bankAccountUSD) {
        bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());

        model.addAttribute("USD", bankAccountUSD.getUserAccountUSD());
        model.addAttribute("moneyUSD", bankAccountUSD.getUserMoneyUSD());
        model.addAttribute("USDRate", nationalBankCourceApi.getUSDOfficialRate());

        return "USDtoBYN";
    }

    @PostMapping("USDtoBYN")
    public String convUSDtoBYN(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountUSD bankAccountUSD,
            Model model,
            @RequestParam String money
    ) {
        bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());

        model.addAttribute("USD", bankAccountUSD.getUserAccountUSD());
        model.addAttribute("moneyUSD", bankAccountUSD.getUserMoneyUSD());
        model.addAttribute("USDRate", nationalBankCourceApi.getUSDOfficialRate());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney <= 0 || bankAccountUSD.getUserMoneyUSD() < userMoney) {
                if (userMoney <= 0) {
                    model.addAttribute("moneyError", "Сумма пополнения меньше нуля");
                }

                if (bankAccountUSD.getUserMoneyUSD() < userMoney) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "USDtoBYN";
            }

            bankAccountService.convertUSDtoBYN(user, bankAccount, bankAccountUSD, userMoney);
        } else {
            model.addAttribute("moneyError", "Некорректная сумма пополнения");

            return "USDtoBYN";
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("EURtoBYN")
    public String getEURtoBYN(Model model, @AuthenticationPrincipal User user, BankAccountEUR bankAccountEUR) {
        bankAccountEUR = bankAccountEURRepo.getOne(user.getId());

        model.addAttribute("EUR", bankAccountEUR.getUserAccountEUR());
        model.addAttribute("moneyEUR", bankAccountEUR.getUserMoneyEUR());
        model.addAttribute("EURRate", nationalBankCourceApi.getEUROfficialRate());

        return "EURtoBYN";
    }

    @PostMapping("EURtoBYN")
    public String convEURtoBYN(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountEUR bankAccountEUR,
            Model model,
            @RequestParam String money
    ) {
        bankAccountEUR = bankAccountEURRepo.getOne(user.getId());

        model.addAttribute("EUR", bankAccountEUR.getUserAccountEUR());
        model.addAttribute("moneyEUR", bankAccountEUR.getUserMoneyEUR());
        model.addAttribute("EURRate", nationalBankCourceApi.getEUROfficialRate());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney <= 0 || bankAccountEUR.getUserMoneyEUR() < userMoney) {
                if (userMoney <= 0) {
                    model.addAttribute("moneyError", "Некорректная сумма пополнения");
                }

                if (bankAccountEUR.getUserMoneyEUR() < userMoney) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "EURtoBYN";
            }

            bankAccountService.convertEURtoBYN(user, bankAccount, bankAccountEUR, userMoney);
        } else {
            model.addAttribute("moneyError", "Некорректная сумма пополнения");

            return "EURtoBYN";
        }

        return "redirect:/user/internetBanking";
    }
}