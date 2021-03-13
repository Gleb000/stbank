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
        if(userInfoRepo.existsById(user.getId())) {
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
        } else {
            model.addAttribute("firstName", null);
        }

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
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("patronymic") String patronymic,
            @RequestParam("dateOfBirth") String dateOfBirth,
            @RequestParam("sex") String sex,
            @RequestParam("passportSeries") String passportSeries,
            @RequestParam("passportNumber") String passportNumber,
            @RequestParam("issuedBy") String issuedBy,
            @RequestParam("dateOfIssue") String dateOfIssue,
            @RequestParam("identificationNumber") String identificationNumber,
            @RequestParam("placeOfBirth") String placeOfBirth,
            @RequestParam("cityOfResidence") String cityOfResidence,
            @RequestParam("address") String address,
            @RequestParam("homeNumber") String homeNumber,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("workPlace") String workPlace,
            @RequestParam("position") String position,
            @RequestParam("registrationCity") String registrationCity,
            @RequestParam("registrationAddress") String registrationAddress,
            @RequestParam("maritalStatus") String maritalStatus,
            @RequestParam("nationality") String nationality,
            @RequestParam("disability") String disability,
            @RequestParam("monthlyEarnings") String monthlyEarnings
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
            @RequestParam("passportSeries") String passportSeries,
            @RequestParam("passportNumber") String passportNumber,
            @RequestParam("issuedBy") String issuedBy,
            @RequestParam("dateOfIssue") String dateOfIssue,
            @RequestParam("cityOfResidence") String cityOfResidence,
            @RequestParam("address") String address,
            @RequestParam("homeNumber") String homeNumber,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("workPlace") String workPlace,
            @RequestParam("position") String position,
            @RequestParam("registrationCity") String registrationCity,
            @RequestParam("registrationAddress") String registrationAddress,
            @RequestParam("maritalStatus") String maritalStatus,
            @RequestParam("monthlyEarnings") String monthlyEarnings,
            UserInfo userInfo
    ) {
        userInfoService.updateUserInfo(user, userInfo, passportSeries, passportNumber, issuedBy, dateOfIssue, cityOfResidence,
                address, homeNumber, phoneNumber, workPlace, position, registrationCity, registrationAddress,
                maritalStatus, monthlyEarnings);

        return "redirect:/user/userInfo";
    }

}