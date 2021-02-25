package by.pogoretskaya.stbank.controller;

import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import by.pogoretskaya.stbank.service.UserInfoService;
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
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    UserInfoRepo userInfoRepo;

    @GetMapping("userInfo")
    public String getUserInfo(Model model, @AuthenticationPrincipal User user) {
        UserInfo userInf = userInfoRepo.getOne(user.getId());

        model.addAttribute("username", user.getUsername());
        model.addAttribute("firstName", userInf.getFirstName());
        model.addAttribute("lastName", userInf.getLastName());
        model.addAttribute("patronymic", userInf.getPatronymic());
        model.addAttribute("dateOfBirth", userInf.getDateOfBirth());
        model.addAttribute("sex", userInf.getSex());
        model.addAttribute("passportSeries", userInf.getPassportSeries());
        model.addAttribute("passportNumber", userInf.getPassportNumber());
        model.addAttribute("issuedBy", userInf.getIssuedBy());
        model.addAttribute("dateOfIssue", userInf.getDateOfIssue());
        model.addAttribute("identificationNumber", userInf.getIdentificationNumber());
        model.addAttribute("placeOfBirth", userInf.getPlaceOfBirth());
        model.addAttribute("cityOfResidence", userInf.getCityOfResidence());
        model.addAttribute("address", userInf.getAddress());
        model.addAttribute("homeNumber", userInf.getHomeNumber());
        model.addAttribute("phoneNumber", userInf.getPhoneNumber());
        model.addAttribute("workPlace", userInf.getWorkPlace());
        model.addAttribute("position", userInf.getPosition());
        model.addAttribute("registrationCity", userInf.getRegistrationCity());
        model.addAttribute("registrationAddress", userInf.getRegistrationAddress());
        model.addAttribute("maritalStatus", userInf.getMaritalStatus());
        model.addAttribute("nationality", userInf.getNationality());
        model.addAttribute("disability", userInf.getDisability());
        model.addAttribute("monthlyEarnings", userInf.getMonthlyEarnings());

        return "userInfo";
    }

    @GetMapping("addUserInfo")
    public String getName(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());

        return "addUserInfo";
    }

    @PostMapping("addUserInfo")
    public String addUserInfo(
            @AuthenticationPrincipal User user,
            @Valid UserInfo userInf,
            BindingResult bindingResult,
            Model model,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String patronymic,
            @RequestParam String dateOfBirth,
            @RequestParam String sex,
            @RequestParam String passportSeries,
            @RequestParam String passportNumber,
            @RequestParam String issuedBy,
            @RequestParam String dateOfIssue,
            @RequestParam String identificationNumber,
            @RequestParam String placeOfBirth,
            @RequestParam String cityOfResidence,
            @RequestParam String address,
            @RequestParam String homeNumber,
            @RequestParam String phoneNumber,
            @RequestParam String workPlace,
            @RequestParam String position,
            @RequestParam String registrationCity,
            @RequestParam String registrationAddress,
            @RequestParam String maritalStatus,
            @RequestParam String nationality,
            @RequestParam String disability,
            @RequestParam String monthlyEarnings
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.addAttribute("username", user.getUsername());
            model.mergeAttributes(errors);

            return "addUserInfo";
        }

        userInfoService.addUserInfo(user, userInf, firstName, lastName, patronymic, dateOfBirth, sex,
                passportSeries, passportNumber, issuedBy, dateOfIssue,
                identificationNumber, placeOfBirth, cityOfResidence, address,
                homeNumber, phoneNumber, workPlace, position, registrationCity,
                registrationAddress, maritalStatus, nationality, disability, monthlyEarnings);

        return "redirect:/user/userInfo";
    }

    @GetMapping("editUserInfo")
    public String editUserInfo(Model model, UserInfo userInf, @AuthenticationPrincipal User user) {
        userInf = userInfoRepo.getOne(user.getId());

        model.addAttribute("username", user.getUsername());

        model.addAttribute("passportSeries", userInf.getPassportSeries());
        model.addAttribute("passportNumber", userInf.getPassportNumber());
        model.addAttribute("issuedBy", userInf.getIssuedBy());
        model.addAttribute("dateOfIssue", userInf.getDateOfIssue());
        model.addAttribute("cityOfResidence", userInf.getCityOfResidence());
        model.addAttribute("address", userInf.getAddress());
        model.addAttribute("homeNumber", userInf.getHomeNumber());
        model.addAttribute("phoneNumber", userInf.getPhoneNumber());
        model.addAttribute("workPlace", userInf.getWorkPlace());
        model.addAttribute("position", userInf.getPosition());
        model.addAttribute("registrationCity", userInf.getRegistrationCity());
        model.addAttribute("registrationAddress", userInf.getRegistrationAddress());
        model.addAttribute("maritalStatus", userInf.getMaritalStatus());
        model.addAttribute("monthlyEarnings", userInf.getMonthlyEarnings());

        return "editUserInfo";
    }

    @PostMapping("editUserInfo")
    public String updateUserInformation(
            @AuthenticationPrincipal User user,
            @RequestParam String passportSeries,
            @RequestParam String passportNumber,
            @RequestParam String issuedBy,
            @RequestParam String dateOfIssue,
            @RequestParam String cityOfResidence,
            @RequestParam String address,
            @RequestParam String homeNumber,
            @RequestParam String phoneNumber,
            @RequestParam String workPlace,
            @RequestParam String position,
            @RequestParam String registrationCity,
            @RequestParam String registrationAddress,
            @RequestParam String maritalStatus,
            @RequestParam String monthlyEarnings,
            UserInfo userInfo
    ) {
        userInfoService.updateUserInfo(user, userInfo, passportSeries, passportNumber, issuedBy, dateOfIssue, cityOfResidence,
                address, homeNumber, phoneNumber, workPlace, position, registrationCity, registrationAddress,
                maritalStatus, monthlyEarnings);

        return "redirect:/user/userInfo";
    }

}