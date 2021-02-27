package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.*;
import by.pogoretskaya.stbank.repos.*;
import by.pogoretskaya.stbank.service.BankAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class BankAccountController {

    @Autowired
    BankAccountService bankAccountService;

    @Autowired
    UserInfoRepo userInfoRepo;

    @Autowired
    BankAccountRepo bankAccountRepo;

    @Autowired
    BankAccountUSDRepo bankAccountUSDRepo;

    @Autowired
    BankAccountEURRepo bankAccountEURRepo;

    @Autowired
    BankCreditRepo bankCreditRepo;

    @Autowired
    PiggiBankRepo piggiBankRepo;

    @GetMapping("internetBanking")
    public String getAccInfo(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        if(bankCreditRepo.existsById(user.getId())) {
            BankCredit bankCredit = bankCreditRepo.getOne(user.getId());

            model.addAttribute("creditSum", bankCredit.getCreditSum());
            model.addAttribute("paidOut", bankCredit.getPaidOut());
        } else {
            model.addAttribute("creditSum", null);
        }

        if(piggiBankRepo.existsById(user.getId())) {
            PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

            model.addAttribute("piggiName", piggiBank.getPiggiBankName());
            model.addAttribute("piggiMoney", piggiBank.getPiggiBankMoney());
        } else {
            model.addAttribute("piggiName", null);
        }

        if(userInfoRepo.existsById(user.getId())) {
            UserInfo userInfo = userInfoRepo.getOne(user.getId());

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());
        } else {
            model.addAttribute("firstName", null);
        }

        if(bankAccountRepo.existsById(user.getId())) {
            BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

            model.addAttribute("userBankAcc", bankAccount.getUserAccount());
            model.addAttribute("userAccMoney", bankAccount.getUserMoney());
        } else {
            model.addAttribute("userBankAcc", null);
        }

        if(bankAccountUSDRepo.existsById(user.getId())) {
            BankAccountUSD bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());
            model.addAttribute("bankAccountUSD", bankAccountUSD.getUserAccountUSD());
            model.addAttribute("userAccMoneyUSD", bankAccountUSD.getUserMoneyUSD());
        } else {
            model.addAttribute("bankAccountUSD", null);
        }

        if(bankAccountEURRepo.existsById(user.getId())) {
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

        return "BYNtoUSD";
    }

    @PostMapping("BYNtoUSD")
    public String convBYNtoUSD(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountUSD bankAccountUSD,
            @RequestParam int money
    ) {
        bankAccountService.convertBYNtoUSD(user, bankAccount, bankAccountUSD, money);

        return "redirect:/user/internetBanking";
    }

    @GetMapping("BYNtoEUR")
    public String getBYNtoEUR(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());

        return "BYNtoEUR";
    }

    @PostMapping("BYNtoEUR")
    public String convBYNtoEUR(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountEUR bankAccountEUR,
            @RequestParam int money
    ) {
        bankAccountService.convertBYNtoEUR(user, bankAccount, bankAccountEUR, money);

        return "redirect:/user/internetBanking";
    }

    @GetMapping("USDtoBYN")
    public String getUSDtoBYN(Model model, @AuthenticationPrincipal User user, BankAccountUSD bankAccountUSD) {
        bankAccountUSD = bankAccountUSDRepo.getOne(user.getId());

        model.addAttribute("USD", bankAccountUSD.getUserAccountUSD());
        model.addAttribute("moneyUSD", bankAccountUSD.getUserMoneyUSD());

        return "USDtoBYN";
    }

    @PostMapping("USDtoBYN")
    public String convUSDtoBYN(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountUSD bankAccountUSD,
            @RequestParam int money
    ) {
        bankAccountService.convertUSDtoBYN(user, bankAccount, bankAccountUSD, money);

        return "redirect:/user/internetBanking";
    }

    @GetMapping("EURtoBYN")
    public String getEURtoBYN(Model model, @AuthenticationPrincipal User user, BankAccountEUR bankAccountEUR) {
        bankAccountEUR = bankAccountEURRepo.getOne(user.getId());

        model.addAttribute("EUR", bankAccountEUR.getUserAccountEUR());
        model.addAttribute("moneyEUR", bankAccountEUR.getUserMoneyEUR());

        return "EURtoBYN";
    }

    @PostMapping("EURtoBYN")
    public String convEURtoBYN(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankAccountEUR bankAccountEUR,
            @RequestParam int money
    ) {
        bankAccountService.convertEURtoBYN(user, bankAccount, bankAccountEUR, money);

        return "redirect:/user/internetBanking";
    }
}