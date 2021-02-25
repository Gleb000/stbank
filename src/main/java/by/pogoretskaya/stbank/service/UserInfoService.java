package by.pogoretskaya.stbank.service;

import by.pogoretskaya.stbank.domain.User;
import by.pogoretskaya.stbank.domain.UserInfo;
import by.pogoretskaya.stbank.repos.UserInfoRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {

    @Autowired
    UserInfoRepo userInfoRepo;

    public void addUserInfo(User user, UserInfo userInf, String firstName, String lastName, String patronymic,
                            String dateOfBirth, String sex, String passportSeries, String passportNumber,
                            String issuedBy, String dateOfIssue, String identificationNumber, String placeOfBirth,
                            String cityOfResidence, String address, String homeNumber, String phoneNumber,
                            String workPlace, String position, String registrationCity, String registrationAddress,
                            String maritalStatus, String nationality, String disability, String monthlyEarnings) {

        userInf.setId(user.getId());

        userInf.setFirstName(firstName);
        userInf.setLastName(lastName);
        userInf.setPatronymic(patronymic);
        userInf.setDateOfBirth(dateOfBirth);

        if(userInf.getSex().equals(null)) {
            userInf.setSex("Информация отсутствует");
        } else {
            userInf.setSex(sex);
        }

        userInf.setPassportSeries(passportSeries);
        userInf.setPassportNumber(passportNumber);
        userInf.setIssuedBy(issuedBy);
        userInf.setDateOfIssue(dateOfIssue);
        userInf.setIdentificationNumber(identificationNumber);
        userInf.setPlaceOfBirth(placeOfBirth);
        userInf.setCityOfResidence(cityOfResidence);
        userInf.setAddress(address);

        if(userInf.getHomeNumber().equals(null)) {
            userInf.setHomeNumber("информация отсутствует");
        } else {
            userInf.setHomeNumber(homeNumber);
        }

        if(userInf.getPhoneNumber().equals(null)) {
            userInf.setPhoneNumber("информация отсутствует");
        } else {
            userInf.setPhoneNumber(phoneNumber);
        }

        if(userInf.getWorkPlace().equals(null)) {
            userInf.setWorkPlace("информация отсутствует");
        } else {
            userInf.setWorkPlace(workPlace);
        }
        if(userInf.getPosition().equals(null)) {
            userInf.setPosition("информация отсутствует");
        } else {
            userInf.setPosition(position);
        }

        userInf.setRegistrationCity(registrationCity);
        userInf.setRegistrationAddress(registrationAddress);
        userInf.setMaritalStatus(maritalStatus);
        userInf.setNationality(nationality);
        userInf.setDisability(disability);

        if(userInf.getMonthlyEarnings().equals(null)) {
            userInf.setMonthlyEarnings("информация отсутствует");
        } else {
            userInf.setMonthlyEarnings(monthlyEarnings);
        }

        userInfoRepo.save(userInf);
    }

    public void updateUserInfo(User user, UserInfo userInf, String passportSeries, String passportNumber,
                               String issuedBy, String dateOfIssue, String cityOfResidence, String address,
                               String homeNumber, String phoneNumber, String workPlace, String position, String registrationCity,
                               String registrationAddress, String maritalStatus, String monthlyEarnings) {
        userInf = userInfoRepo.getOne(user.getId());

        userInf.setPassportSeries(passportSeries);
        userInf.setPassportNumber(passportNumber);
        userInf.setIssuedBy(issuedBy);
        userInf.setDateOfIssue(dateOfIssue);
        userInf.setCityOfResidence(cityOfResidence);
        userInf.setAddress(address);

        if(userInf.getHomeNumber().equals(null)) {
            userInf.setHomeNumber("информация отсутствует");
        } else {
            userInf.setHomeNumber(homeNumber);
        }

        if(userInf.getPhoneNumber().equals(null)) {
            userInf.setPhoneNumber("информация отсутствует");
        } else {
            userInf.setPhoneNumber(phoneNumber);
        }

        if(userInf.getWorkPlace().equals(null)) {
            userInf.setWorkPlace("информация отсутствует");
        } else {
            userInf.setWorkPlace(workPlace);
        }
        if(userInf.getPosition().equals(null)) {
            userInf.setPosition("информация отсутствует");
        } else {
            userInf.setPosition(position);
        }

        userInf.setRegistrationCity(registrationCity);
        userInf.setRegistrationAddress(registrationAddress);
        userInf.setMaritalStatus(maritalStatus);

        if(userInf.getMonthlyEarnings().equals(null)) {
            userInf.setMonthlyEarnings("информация отсутствует");
        } else {
            userInf.setMonthlyEarnings(monthlyEarnings);
        }

        userInfoRepo.save(userInf);
    }
}