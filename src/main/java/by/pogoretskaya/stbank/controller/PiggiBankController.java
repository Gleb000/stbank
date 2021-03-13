package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.BankAccount;
import by.pogoretskaya.stbank.domain.PiggiBank;
import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.BankAccountRepo;
import by.pogoretskaya.stbank.repos.PiggiBankRepo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import by.pogoretskaya.stbank.service.PiggiBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class PiggiBankController {

    @Autowired
    UserInfoRepo userInfoRepo;

    @Autowired
    BankAccountRepo bankAccountRepo;

    @Autowired
    PiggiBankRepo piggiBankRepo;

    @Autowired
    PiggiBankService piggiBankService;

    @GetMapping("piggiBank")
    public String getPiggiBank(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("userAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        if(piggiBankRepo.existsById(user.getId())) {
            PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

            model.addAttribute("piggiBank", piggiBank.getPiggiBankName());
            model.addAttribute("targetDate", piggiBank.getTargetDate());
            model.addAttribute("targetMoney", piggiBank.getTargetMoney());
        } else {
            model.addAttribute("piggiBank", null);
        }

        return "piggiBank";
    }

    @GetMapping("addPiggiBank")
    public String getPigBank(Model model, @AuthenticationPrincipal User user) {
        if(userInfoRepo.existsById(user.getId())) {
            UserInfo userInfo = userInfoRepo.getOne(user.getId());

            model.addAttribute("firstName", userInfo.getFirstName());
        } else {
            model.addAttribute("firstName", null);
        }

        if(bankAccountRepo.existsById(user.getId())) {
            BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

            model.addAttribute("userBankAcc", bankAccount.getUserAccount());

            UserInfo userInfo = userInfoRepo.getOne(user.getId());

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());
        } else {
            model.addAttribute("userBankAcc", null);
        }

        return "addPiggiBank";
    }

    @PostMapping("addPiggiBank")
    public String addPigBank(
            @AuthenticationPrincipal User user,
            @Valid PiggiBank piggiBank,
            BindingResult bindingResult,
            Model model,
            @RequestParam("piggiBankName") String piggiBankName,
            @RequestParam("targetDate") String targetDate,
            @RequestParam("money") String money
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

        if(!Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money) || bindingResult.hasErrors()) {
            if(!Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
                model.addAttribute("moneyError", "Некорректная сумма накопления");
            } else {
                Double userMoney = Double.parseDouble(money);

                if(userMoney < 0 || (userMoney > 0 && userMoney < 30) || userMoney > 10000) {
                    model.addAttribute("currentMoney", null);

                    if (userMoney < 0) {
                        model.addAttribute("moneyError", "Сумма накопления меньше нуля");
                    }

                    if (userMoney > 0 && userMoney < 30) {
                        model.addAttribute("moneyError", "Сумма накопления не может быть меньше 30 рублей");
                    }

                    if (userMoney > 10000) {
                        model.addAttribute("moneyError", "Сумма накопления не может быть больше 10 000 рублей");
                    }
                } else {
                    model.addAttribute("currentMoney", money);
                }
            }

            if(bindingResult.hasErrors()) {
                model.mergeAttributes(errors);
            }

            return "addPiggiBank";
        } else {
            Double userMoney = Double.parseDouble(money);

            if (bindingResult.hasErrors() || userMoney < 0 || (userMoney > 0 && userMoney < 30) || userMoney > 10000) {

                if(bindingResult.hasErrors()) {
                    model.mergeAttributes(errors);
                }

                if(userMoney < 0 || (userMoney > 0 && userMoney < 30) || userMoney > 10000) {
                    model.addAttribute("currentMoney", null);

                    if (userMoney < 0) {
                        model.addAttribute("moneyError", "Сумма накопления меньше нуля");
                    }

                    if (userMoney > 0 && userMoney < 30) {
                        model.addAttribute("moneyError", "Сумма накопления не может быть меньше 30 рублей");
                    }

                    if (userMoney > 10000) {
                        model.addAttribute("moneyError", "Сумма накопления не может быть больше 10 000 рублей");
                    }
                } else {
                    model.addAttribute("currentMoney", money);
                }

                return "addPiggiBank";
            }

            piggiBankService.addPiggiBank(user, piggiBank, piggiBankName, targetDate, userMoney);
        }

        return "redirect:/user/piggiBank";
    }

    @GetMapping("piggiBankInfo")
    public String getPiggiInfo(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        model.addAttribute("piggiName", piggiBank.getPiggiBankName());
        model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());
        model.addAttribute("date", piggiBank.getTargetDate());
        model.addAttribute("money", piggiBank.getTargetMoney());

        return "piggiBankInfo";
    }

    @GetMapping("topUpPiggiBank")
    public String getTopUpPiggi(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        model.addAttribute("piggiName", piggiBank.getPiggiBankName());
        model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());
        model.addAttribute("date", piggiBank.getTargetDate());
        model.addAttribute("money", piggiBank.getTargetMoney());

        return "topUpPiggiBank";
    }

    @PostMapping("topUpPiggiBank")
    public String topUpPiggi(
            @AuthenticationPrincipal User user,
            Model model,
            @RequestParam("money") String money
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAcc", bankAccount.getUserAccount());
        model.addAttribute("userMoney", bankAccount.getUserMoney());

        model.addAttribute("piggiName", piggiBank.getPiggiBankName());
        model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());
        model.addAttribute("date", piggiBank.getTargetDate());
        model.addAttribute("money", piggiBank.getTargetMoney());

        if(Pattern.matches("^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$", money)) {
            Double userMoney = Double.parseDouble(money);

            if(userMoney < 0 || (userMoney >= 0 && userMoney < 1) || userMoney > piggiBank.getTargetMoney() - piggiBank.getPiggiBankMoney() || bankAccount.getUserMoney() < userMoney) {
                if(userMoney < 0) {
                    model.addAttribute("moneyError", "Сумма пополнения меньше нуля");
                }

                if(userMoney >= 0 && userMoney < 1) {
                    model.addAttribute("moneyError", "Сумма пополнения должна превышать 1 рубль");
                }

                if(userMoney > piggiBank.getTargetMoney() - piggiBank.getPiggiBankMoney()) {
                    model.addAttribute("moneyError", "Нельзя накопить сумму, выше поставленной цели");
                }

                if(bankAccount.getUserMoney() < userMoney) {
                    model.addAttribute("moneyError", "Недостаточно средств");
                }

                return "topUpPiggiBank";
            } else {
                piggiBankService.topUpPiggiBank(user, piggiBank, userMoney);
            }
        } else {
            model.addAttribute("moneyError", "Сумма пополнения указана некорректно");

            return "topUpPiggiBank";
        }

        return "redirect:/user/internetBanking";
    }

    @GetMapping("crashPiggiBank")
    public String getCrashPiggiBank(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

        model.addAttribute("bankAcc", bankAccount.getUserAccount());

        model.addAttribute("piggiName", piggiBank.getPiggiBankName());
        model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());

        model.addAttribute("allMoney", piggiBank.getPiggiBankMoney() + bankAccount.getUserMoney());

        return "crashPiggiBank";
    }

    @PostMapping("crashPiggiBank")
    public String crashPiggiBank(@AuthenticationPrincipal User user) {
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());

        piggiBankService.crashPiggi(user,bankAccount, piggiBank);

        return "redirect:/user/internetBanking";
    }
}