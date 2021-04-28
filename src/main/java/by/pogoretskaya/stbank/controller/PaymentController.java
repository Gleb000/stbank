package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import by.pogoretskaya.stbank.service.PaymentService;
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
public class PaymentController {

    private final UserInfoRepo userInfoRepo;
    private final BankAccountRepo bankAccountRepo;
    private final PaymentService paymentService;

    Double water;
    Double electr;
    Double gas;
    Double sum;

    @GetMapping("paymentSystem")
    public String getPaymentSystem(Model model, UserInfo userInf, BankAccount bankAccount, @AuthenticationPrincipal User user) {
        if (userInfoRepo.existsById(user.getId())) {
            userInf = userInfoRepo.getOne(user.getId());
            model.addAttribute("userFirstName", userInf.getFirstName());
        } else {
            model.addAttribute("userFirstName", null);
        }

        if (bankAccountRepo.existsById(user.getId())) {
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
        bankAccount = bankAccountRepo.getOne(user.getId());
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAccount", bankAccount.getUserAccount());
        model.addAttribute("userAccMoney", bankAccount.getUserMoney());

        return "refillAcc";
    }

    @PostMapping("refillAcc")
    public String updateRefillInfo(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            Model model,
            @RequestParam String money
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        if (Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if (userMoney < 0 || (userMoney >= 0 && userMoney < 1) || userMoney > 10000) {
                model.addAttribute("firstName", userInfo.getFirstName());
                model.addAttribute("lastName", userInfo.getLastName());
                model.addAttribute("patronymic", userInfo.getPatronymic());

                if (userMoney < 0) {
                    model.addAttribute("moneyError", "Сумма пополнения меньше нуля");
                }

                if (userMoney >= 0 && userMoney < 1) {
                    model.addAttribute("moneyError", "Сумма пополнения должна превышать 1 рубль");
                }

                if (userMoney > 10000) {
                    model.addAttribute("moneyError", "Сумма пополнения не может превышать 10 000 рублей");
                }

                return "refillAcc";
            }

            paymentService.updRefillInfo(user, bankAccount, userMoney);
        } else {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("moneyError", "Введена некорректная сумма");

            return "refillAcc";
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("transferMoney")
    public String transfMoney(Model model, @AuthenticationPrincipal User user, BankAccount bankAccount) {
        bankAccount = bankAccountRepo.getOne(user.getId());
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("BYN", bankAccount.getUserAccount());
        model.addAttribute("moneyBYN", bankAccount.getUserMoney());

        return "transferMoney";
    }

    @PostMapping("transferMoney")
    public String transferMoney(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            Model model,
            @RequestParam String money,
            @RequestParam String bankAcc
    ) {
        bankAccount = bankAccountRepo.getOne(user.getId());

        if (!Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money) || bankAccountRepo.findByUserAccount(bankAcc) == null) {
            bankAccount = bankAccountRepo.getOne(user.getId());
            UserInfo userInfo = userInfoRepo.getOne(user.getId());

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("BYN", bankAccount.getUserAccount());
            model.addAttribute("moneyBYN", bankAccount.getUserMoney());

            if (bankAccountRepo.findByUserAccount(bankAcc) == null) {
                model.addAttribute("userError", "Пользователь не найден");
                model.addAttribute("recipient", null);
            } else {
                model.addAttribute("recipient", bankAcc);
            }

            if (!Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
                model.addAttribute("moneyError", "Сумма перевода указана некорректно");
                model.addAttribute("userMoney", null);
            } else {
                Double userMoney = Double.parseDouble(money);

                if (userMoney > bankAccount.getUserMoney() || (userMoney >= 0 && userMoney < 1) || userMoney < 0) {
                    if (userMoney > bankAccount.getUserMoney()) {
                        model.addAttribute("moneyError", "На счету недостаточно средств");
                        model.addAttribute("userMoney", null);
                    } if(userMoney < 0) {
                        model.addAttribute("moneyError", "Сумма пополнения не может быть отрицательной");
                        model.addAttribute("userMoney", null);
                    } if(userMoney >= 0 && userMoney < 1) {
                        model.addAttribute("moneyError", "Сумма перевода должна превышать 1 рубль");
                        model.addAttribute("userMoney", null);
                    }
                } else {
                    model.addAttribute("userMoney", Double.toString(userMoney));
                }
            }
            return "transferMoney";
        } else {
            Double userMoney = Double.parseDouble(money);

            if (userMoney > bankAccount.getUserMoney() || (userMoney >= 0 && userMoney < 1) || userMoney < 0) {
                if (userMoney > bankAccount.getUserMoney()) {
                    model.addAttribute("moneyError", "На счету недостаточно средств");
                    model.addAttribute("userMoney", null);
                }

                if (userMoney < 0) {
                    model.addAttribute("moneyError", "Сумма пополнения не может быть отрицательной");
                    model.addAttribute("userMoney", null);
                }

                if (userMoney >= 0 && userMoney < 1) {
                    model.addAttribute("moneyError", "Сумма перевода должна превышать 1 рубль");
                    model.addAttribute("userMoney", null);
                }

                bankAccount = bankAccountRepo.getOne(user.getId());
                UserInfo userInfo = userInfoRepo.getOne(user.getId());

                model.addAttribute("firstName", userInfo.getFirstName());
                model.addAttribute("lastName", userInfo.getLastName());
                model.addAttribute("patronymic", userInfo.getPatronymic());

                model.addAttribute("BYN", bankAccount.getUserAccount());
                model.addAttribute("moneyBYN", bankAccount.getUserMoney());

                return "transferMoney";
            } else {
                paymentService.transferMoneyToUser(user, bankAccount, userMoney, bankAcc);
            }
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("utilities")
    public String getUtilities(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());
        model.addAttribute("bankAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        water = (Math.random() * (120 - 50) + 50);
        electr = (Math.random() * (150 - 70) + 70);
        gas = (Math.random() * (110 - 30) + 30);
        sum = water + electr + gas;

        model.addAttribute("water", water);
        model.addAttribute("electr", electr);
        model.addAttribute("gas", gas);
        model.addAttribute("sum", sum);

        if (bankAccount.getUserMoney() < sum) {
            model.addAttribute("moneyError", "На счету недостаточно средств");
        } else {
            model.addAttribute("moneyError", null);
        }

        return "utilities";
    }

    @PostMapping("utilities")
    public String payUtils(
            @AuthenticationPrincipal User user,
            BankAccount bankAccount
    ) {
        paymentService.payUtilities(user, bankAccount, sum);

        return "redirect:/user/internetBanking";
    }

    @GetMapping("payMobile")
    public String getPayMobile(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAcc", bankAccount.getUserAccount());
        model.addAttribute("bankMoney", bankAccount.getUserMoney());

        return "payMobile";
    }

    @PostMapping("payMobile")
    public String addPayMobile(
            Model model,
            @AuthenticationPrincipal User user,
            BankAccount bankAccount,
            @RequestParam("money") Double money,
            @RequestParam("phoneNumber") String phone
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        bankAccount = bankAccountRepo.getOne(user.getId());

        if (money == null || phone.equals("")) {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("bankAcc", bankAccount.getUserAccount());
            model.addAttribute("bankMoney", bankAccount.getUserMoney());

            if (money == null) {
                model.addAttribute("moneyError", "Не указана сумма пополнения");
            }

            if (phone.equals("")) {
                model.addAttribute("phoneError", "Не указан номер телефона");
            }

            return "payMobile";
        }

        if (money < 0 || (money > 0 && money < 1) || money > 100 || bankAccount.getUserMoney() < money || phone.equals("")) {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("bankAcc", bankAccount.getUserAccount());
            model.addAttribute("bankMoney", bankAccount.getUserMoney());

            if (money < 0) {
                model.addAttribute("moneyError", "Сумма пополнения указана некорректно");
            }

            if (money > 0 && money < 1) {
                model.addAttribute("moneyError", "Сумма пополнения должна превышать 1 рубль");
            }

            if (money > 100) {
                model.addAttribute("moneyError", "Сумма пополнения не может превышать 100 рублей");
            }

            if (bankAccount.getUserMoney() < money) {
                model.addAttribute("moneyError", "Недостаточно средств");
            }

            if (phone.equals("")) {
                model.addAttribute("phoneError", "Не указан номер телефона");
            }

            return "payMobile";
        }

        paymentService.payMobile(user, bankAccount, money);

        return "redirect:/user/internetBanking";
    }
}