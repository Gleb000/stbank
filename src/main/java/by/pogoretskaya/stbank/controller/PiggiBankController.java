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
            model.addAttribute("piggiMoney", piggiBank.getPiggiBankMoney());
        } else {
            model.addAttribute("piggiBank", null);
        }

        return "piggiBank";
    }

    @GetMapping("addPiggiBank")
    public String getPigBank(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        model.addAttribute("firstName", userInfo.getFirstName());
        model.addAttribute("lastName", userInfo.getLastName());
        model.addAttribute("patronymic", userInfo.getPatronymic());

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
            @RequestParam("money") Integer money
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

        if(money == null || bindingResult.hasErrors()) {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            if(money == null) {
                model.addAttribute("moneyError", "Некорректная сумма накопления");
            }

            if(bindingResult.hasErrors()) {
                model.mergeAttributes(errors);
            }

            return "addPiggiBank";
        }

        if (bindingResult.hasErrors() || money < 0 || (money > 0 && money < 30) || money > 10000) {

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            if(bindingResult.hasErrors()) {
                model.mergeAttributes(errors);
            }

            if(money < 0) {
                model.addAttribute("moneyError", "Некорректная сумма накопления");
            }

            if((money > 0 && money < 30)) {
                model.addAttribute("moneyError", "Сумма накопления не может быть меньше 30 рублей");
            }

            if(money > 10000) {
                model.addAttribute("moneyError", "Сумма накопления не может быть больше 10 000 рублей");
            }

            return "addPiggiBank";
        }

        piggiBankService.addPiggiBank(user, piggiBank, piggiBankName, targetDate, money);

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
            @RequestParam("money") Integer money
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());
        BankAccount bankAccount = bankAccountRepo.getOne(user.getId());
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        if(money == null) {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("bankAcc", bankAccount.getUserAccount());
            model.addAttribute("userMoney", bankAccount.getUserMoney());

            model.addAttribute("piggiName", piggiBank.getPiggiBankName());
            model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());
            model.addAttribute("date", piggiBank.getTargetDate());
            model.addAttribute("money", piggiBank.getTargetMoney());

            model.addAttribute("moneyError", "Сумма пополнения не указана");

            return "topUpPiggiBank";
        }

        if(money < 0 || (money > 0 && money < 1) || money > piggiBank.getTargetMoney() - piggiBank.getPiggiBankMoney()) {
            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.addAttribute("bankAcc", bankAccount.getUserAccount());
            model.addAttribute("userMoney", bankAccount.getUserMoney());

            model.addAttribute("piggiName", piggiBank.getPiggiBankName());
            model.addAttribute("piggiBankMoney", piggiBank.getPiggiBankMoney());
            model.addAttribute("date", piggiBank.getTargetDate());
            model.addAttribute("money", piggiBank.getTargetMoney());

            if(money < 0) {
                model.addAttribute("moneyError", "Сумма пополнения указана некорректно");
            }

            if(money > 0 && money < 1) {
                model.addAttribute("moneyError", "Сумма пополнения должна превышать 1 рубль");
            }

            if(money > piggiBank.getTargetMoney() - piggiBank.getPiggiBankMoney()) {
                model.addAttribute("moneyError", "Нельзя накопить сумму, выше поставленной цели");
            }

            piggiBankService.topUpPiggiBank(user, piggiBank, money);

            return "topUpPiggiBank";
        }

        return "redirect:/user/piggiBankInfo";
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

        return "crashPiggiBank";
    }

    @PostMapping("crashPiggiBank")
    public String crashPiggiBank(@AuthenticationPrincipal User user) {
        PiggiBank piggiBank = piggiBankRepo.getOne(user.getId());

        piggiBankService.crashPiggi(user, piggiBank);

        return "redirect:/user/internetBanking";
    }
}
