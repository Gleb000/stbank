package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import by.pogoretskaya.stbank.service.PaymentService;
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
public class PaymentController {

    @Autowired
    UserInfoRepo userInfoRepo;

    @Autowired
    BankAccountRepo bankAccountRepo;

    @Autowired
    PaymentService paymentService;

    @GetMapping("paymentSystem")
    public String getPaymentSystem(Model model, UserInfo userInf, BankAccount bankAccount, @AuthenticationPrincipal User user) {
        if(userInfoRepo.existsById(user.getId())) {
            userInf = userInfoRepo.getOne(user.getId());
            model.addAttribute("userFirstName", userInf.getFirstName());
        } else {
            model.addAttribute("userFirstName", null);
        }

        if(bankAccountRepo.existsById(user.getId())) {
            bankAccount = bankAccountRepo.getOne(user.getId());
            model.addAttribute("bankAccount", bankAccount.getUserAccount());
            model.addAttribute("userAccMoney", bankAccount.getUserMoney());
        } else {
            model.addAttribute("bankAccount", null);
        }

        return "paymentSystem";
    }

    @GetMapping("refillAcc")
    public String getRefillInfo(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        model.addAttribute("username", user.getUsername());

        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("bankAccount", bankAccount.getUserAccount());
        model.addAttribute("userAccMoney", bankAccount.getUserMoney());

        return "refillAcc";
    }

    @PostMapping("refillAcc")
    public String updateRefillInfo(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            @RequestParam int money
    ) {
        paymentService.updRefillInfo(user, bankAccount, money);

        return "redirect:/user/paymentSystem";
    }

    @GetMapping("transferMoney")
    public String transfMoney(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());

        return "transferMoney";
    }

    @PostMapping("transferMoney")
    public String transferMoney(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            @RequestParam int money,
            @RequestParam String bankAcc
    ) {
        paymentService.transferMoneyToUser(user, bankAccount, money, bankAcc);

        return "redirect:/user/paymentSystem";
    }
}