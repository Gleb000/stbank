package by.fokin.stbank.controller;

import by.fokin.stbank.domain.BankAccount;
import by.fokin.stbank.domain.Role;
import by.fokin.stbank.domain.User;
import by.fokin.stbank.domain.UserInfo;
import by.fokin.stbank.repos.BankAccountRepo;
import by.fokin.stbank.repos.UserInfoRepo;
import by.fokin.stbank.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final BankAccountRepo bankAccountRepo;
    private final UserInfoRepo userInfoRepo;
    private final UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);

        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String email
    ) {
        userService.updateProfile(user, password, email);

        return "redirect:/user/profile";
    }

    @GetMapping("allUserInformation")
    public String getAllUserInformation(Model model, UserInfo userInf, BankAccount bankAccount, @AuthenticationPrincipal User user) {
        model.addAttribute("userName", user.getUsername());
        model.addAttribute("gmail", user.getEmail());

        if (userInfoRepo.existsById(user.getId())) {
            userInf = userInfoRepo.getOne(user.getId());
            model.addAttribute("userFirstName", userInf.getFirstName());
        } else {
            model.addAttribute("userFirstName", null);
        }

        if (bankAccountRepo.existsById(user.getId())) {
            bankAccount = bankAccountRepo.getOne(user.getId());
            model.addAttribute("bankAccount", bankAccount.getUserAccount());
        } else {
            model.addAttribute("bankAccount", null);
        }

        return "allUserInformation";
    }
}