package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.BankCredit;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.BankCreditRepo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import by.pogoretskaya.stbank.repos.UserRepo;
import by.pogoretskaya.stbank.service.BankCreditService;
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
public class BankCreditController {

    @Autowired
    UserRepo userRepo;

    @Autowired
    BankCreditRepo bankCreditRepo;

    @Autowired
    UserInfoRepo userInfoRepo;

    @Autowired
    BankAccountRepo bankAccountRepo;

    @Autowired
    BankCreditService bankCreditService;

    @GetMapping("credit")
    public String getCredit(
            Model model,
            @AuthenticationPrincipal User user,
            BankCredit bankCredit,
            UserInfo userInfo,
            BankAccount bankAccount
    ) {
        if(userInfoRepo.existsById(user.getId())) {
            userInfo = userInfoRepo.getOne(user.getId());
            model.addAttribute("userFirstName", userInfo.getFirstName());
            model.addAttribute("userLastName", userInfo.getLastName());
            model.addAttribute("userPatronymic", userInfo.getPatronymic());
        } else {
            model.addAttribute("userFirstName", null);
        }

        if(bankAccountRepo.existsById(user.getId())) {
            bankAccount = bankAccountRepo.getOne(user.getId());
            model.addAttribute("bankAccount", bankAccount.getUserAccount());
        } else {
            model.addAttribute("bankAccount", null);
        }

        if(bankCreditRepo.existsById(user.getId())) {
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
            BankAccount bankAccount,
            BankCredit bankCredit,
            @RequestParam int money
    ) {
        bankCreditService.addCredit(user, bankAccount, bankCredit, money);

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

        double percent = (double)((100/bankCredit.getCreditSum()) * bankCredit.getPaidOut());

        if(percent > 0 && percent <= 20) {
            model.addAttribute("percent20", percent);
        } else {
            model.addAttribute("percent20", null);
        }

        if(percent > 20 && percent <= 40) {
            model.addAttribute("percent40", percent);
        } else {
            model.addAttribute("percent40", null);
        }

        if(percent > 40 && percent <= 60) {
            model.addAttribute("percent60", percent);
        } else {
            model.addAttribute("percent60", null);
        }

        if(percent > 60 && percent <= 100) {
            model.addAttribute("percent80", percent);
        } else {
            model.addAttribute("percent80", null);
        }

        return "creditInfo";
    }

    @GetMapping("payCredit")
    public String getUserCredit(
            Model model,
            @AuthenticationPrincipal User user,
            BankCredit bankCredit
    ) {
        bankCredit = bankCreditRepo.getOne(user.getId());

        model.addAttribute("credit", bankCredit.getCreditSum());
        model.addAttribute("paidOut", bankCredit.getPaidOut());

        return "payCredit";
    }

    @PostMapping("payCredit")
    public String payUserCredit(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            BankCredit bankCredit,
            @RequestParam int money
    ) {
        bankCreditService.payOffCredit(user, bankAccount, bankCredit, money);

        return "redirect:/user/credit";
    }
}