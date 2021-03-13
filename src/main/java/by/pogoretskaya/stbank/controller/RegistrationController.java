package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.dto.CaptchaResponseDto;
import by.pogoretskaya.stbank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirm,
            @Valid User user,
            BindingResult bindingResult,
            @RequestParam("password") String password,
            Model model
    ) {
        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Необходимо ввести пароль повторно");
        }

        if(Pattern.matches("\\A(?=\\S*?[0-9])(?=\\S*?[a-z])(?=\\S*?[A-Z])(?=\\S*?[@#$%^&_+=])\\S{8,}\\z", password)) {
            model.addAttribute("errorPas", null);

        } else {
            if(!Pattern.matches("\\A(?=\\S*?[0-9])\\S+\\z", password)) {
                model.addAttribute("numberError", "Пароль должен содержать хотя-бы одну цифру");
            } if(!Pattern.matches("\\A(?=\\S*?[a-z])\\S+\\z", password)) {
                model.addAttribute("symbolError", "Пароль должен содержать хотя-бы одну строчную букву");
            } if(!Pattern.matches("\\A(?=\\S*?[A-Z])\\S+\\z", password)) {
                model.addAttribute("symbol2Error", "Пароль должен содержать хотя-бы одну букву в верхнем регистре");
            } if(!Pattern.matches("\\A(?=\\S*?[@#$%^&_+=])\\S+\\z", password)) {
                model.addAttribute("specSymbolError", "Пароль должен содержать хотя-бы один спец-символ");
            } if(!Pattern.matches("\\A\\S+\\z", password)) {
                model.addAttribute("spaceError", "Пароль не должен содержать пробел");
            } if(!Pattern.matches("\\A\\S{8,}\\z", password)) {
                model.addAttribute("toSmallError", "Пароль должен содержать не менее 8 символов");
            }

            return "registration";
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Пароли различаются");
        }

        if (isConfirmEmpty || bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "Пользователь существует");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}