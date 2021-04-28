package by.fokin.stbank.controller;

import by.fokin.stbank.domain.BankAccount;
import by.fokin.stbank.domain.BankCredit;
import by.fokin.stbank.domain.User;
import by.fokin.stbank.domain.UserInfo;
import by.fokin.stbank.repos.BankAccountRepo;
import by.fokin.stbank.repos.BankCreditRepo;
import by.fokin.stbank.repos.UserInfoRepo;
import by.fokin.stbank.repos.UserRepo;
import by.fokin.stbank.service.BankCreditService;
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
public class BankCreditController {

    private final UserRepo userRepo;
    private final BankCreditRepo bankCreditRepo;
    private final UserInfoRepo userInfoRepo;
    private final BankAccountRepo bankAccountRepo;
    private final BankCreditService bankCreditService;

    @GetMapping("credit")
    public String getCredit(
            Model model,
            @AuthenticationPrincipal User user,
            BankCredit bankCredit,
            UserInfo userInfo,
            BankAccount bankAccount
    ) {
        if (userInfoRepo.existsById(user.getId())) {
            userInfo = userInfoRepo.getOne(user.getId());
            model.addAttribute("userFirstName", userInfo.getFirstName());
            model.addAttribute("userLastName", userInfo.getLastName());
            model.addAttribute("userPatronymic", userInfo.getPatronymic());
        } else {
            model.addAttribute("userFirstName", null);
        }

        if (bankAccountRepo.existsById(user.getId())) {
            bankAccount = bankAccountRepo.getOne(user.getId());
            model.addAttribute("bankAccount", bankAccount.getUserAccount());
        } else {
            model.addAttribute("bankAccount", null);
        }

        if (bankCreditRepo.existsById(user.getId())) {
            bankCredit = bankCreditRepo.getOne(user.getId());
            model.addAttribute("creditSum", bankCredit.getCreditSum());
        } else {
            model.addAttribute("creditSum", null);
        }

        return "credit";
    }

    @GetMapping("addCredit")
    public String getConditions(
            Model model,
            @AuthenticationPrincipal User user,
            UserInfo userInfo,
            BankAccount bankAccount
    ) {
        userInfo = userInfoRepo.getOne(user.getId());
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());
        model.addAttribute("bankAccount", bankAccount.getUserAccount());

        return "addCredit";
    }

    @PostMapping("addCredit")
    public String addCredit(
            @AuthenticationPrincipal User user,
            UserInfo userInfo,
            BankAccount bankAccount,
            BankCredit bankCredit,
            Model model,
            @RequestParam String money
    ) {
        userInfo = userInfoRepo.getOne(user.getId());
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());
        model.addAttribute("bankAccount", bankAccount.getUserAccount());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney < 0 || (userMoney > 0 && userMoney < 100) || userMoney > 5000) {

                if (userMoney < 0) {
                    model.addAttribute("moneyError", "Сумма кредита меньше нуля");
                }

                if (userMoney > 0 && userMoney < 100) {
                    model.addAttribute("moneyError", "Взятие кредита на сумму менее 100 рублей невозможно");
                }

                if (userMoney > 5000) {
                    model.addAttribute("moneyError", "Взятие кредита на сумму более 5000 рублей невозможно");
                }

                return "addCredit";
            }

            bankCreditService.addCredit(user, bankAccount, bankCredit, userMoney);
        } else {
            model.addAttribute("moneyError", "некорректная сумма пополнения");

            return "addCredit";
        }

        return "redirect:/user/creditInfo";
    }

    @GetMapping("creditInfo")
    public String getCreditInfo(
            Model model,
            @AuthenticationPrincipal User user,
            BankCredit bankCredit,
            UserInfo userInfo,
            BankAccount bankAccount
    ) {
        bankCredit = bankCreditRepo.getOne(user.getId());
        userInfo = userInfoRepo.getOne(user.getId());
        bankAccount = bankAccountRepo.getOne(user.getId());
        model.addAttribute("credit", bankCredit.getCreditSum());
        model.addAttribute("paidOut", bankCredit.getPaidOut());
        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());
        model.addAttribute("bankAccount", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        return "creditInfo";
    }

    @GetMapping("payCredit")
    public String getUserCredit(
            Model model,
            @AuthenticationPrincipal User user,
            BankCredit bankCredit
    ) {
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        bankCredit = bankCreditRepo.getOne(user.getId());
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("userAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        model.addAttribute("credit", bankCredit.getCreditSum());
        model.addAttribute("paidOut", bankCredit.getPaidOut());

        model.addAttribute("leftToPay", Double.toString(bankCredit.getCreditSum() - bankCredit.getPaidOut()));

        return "payCredit";
    }

    @PostMapping("payCredit")
    public String payUserCredit(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankCredit bankCredit,
            Model model,
            @RequestParam String money
    ) {
        bankCredit = bankCreditRepo.getOne(user.getId());
        bankAccount = bankAccountRepo.getOne(user.getId());
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("userAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        model.addAttribute("credit", bankCredit.getCreditSum());
        model.addAttribute("paidOut", bankCredit.getPaidOut());

        model.addAttribute("leftToPay", Double.toString(bankCredit.getCreditSum() - bankCredit.getPaidOut()));

        if(Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney < 0 || (userMoney > 0 && userMoney < 1) || userMoney > (bankCredit.getCreditSum() - bankCredit.getPaidOut()) || userMoney > bankAccount.getUserMoney()) {
                model.addAttribute("credit", bankCredit.getCreditSum());
                model.addAttribute("paidOut", bankCredit.getPaidOut());

                if (userMoney < 0) {
                    model.addAttribute("moneyError", "Сумма погашения меньше нуля");
                }

                if (userMoney > 0 && userMoney < 1) {
                    model.addAttribute("moneyError", "Сумма погашения должна превышать 1 рубль");
                }

                if (userMoney > (bankCredit.getCreditSum() - bankCredit.getPaidOut())) {
                    model.addAttribute("moneyError", "Сумма погашения меньше введенной вами суммы");
                }

                if (userMoney > bankAccount.getUserMoney()) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "payCredit";
            }

            bankCreditService.payOffCredit(user, bankAccount, bankCredit, userMoney);
        } else {
            model.addAttribute("moneyError", "Сумма погашения указана некорректно");

            return "payCredit";
        }

        return "redirect:/user/internetBanking";
    }
}