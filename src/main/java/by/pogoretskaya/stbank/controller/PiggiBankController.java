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
            @RequestParam("piggiBankName") String piggiBankName
    ) {
        UserInfo userInfo = userInfoRepo.getOne(user.getId());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.addAttribute("firstName", userInfo.getFirstName());
            model.addAttribute("lastName", userInfo.getLastName());
            model.addAttribute("patronymic", userInfo.getPatronymic());

            model.mergeAttributes(errors);

            return "addPiggiBank";
        }

        piggiBankService.addPiggiBank(user, piggiBank, piggiBankName);

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

        return "piggiBankInfo";
    }
}
