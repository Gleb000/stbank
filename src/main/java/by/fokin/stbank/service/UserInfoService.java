package by.fokin.stbank.service;

import by.fokin.stbank.domain.User;
import by.fokin.stbank.domain.UserInfo;
import by.fokin.stbank.repos.UserInfoRepo;
import lombok.RequiredArgsConstructor;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserInfoService {
    private static final Logger logger = Logger.getLogger(UserInfoService.class);

    private final UserInfoRepo userInfoRepo;

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
        userInf.setSex(sex);
        userInf.setPassportSeries(passportSeries);
        userInf.setPassportNumber(passportNumber);
        userInf.setIssuedBy(issuedBy);
        userInf.setDateOfIssue(dateOfIssue);
        userInf.setIdentificationNumber(identificationNumber);
        userInf.setPlaceOfBirth(placeOfBirth);
        userInf.setCityOfResidence(cityOfResidence);
        userInf.setAddress(address);
        userInf.setHomeNumber(homeNumber);

        if (phoneNumber.equals("")) {
            userInf.setPhoneNumber(phoneNumber);
        } else {
            userInf.setPhoneNumber("+375 " + phoneNumber);
        }

        userInf.setWorkPlace(workPlace);
        userInf.setPosition(position);
        userInf.setRegistrationCity(registrationCity);
        userInf.setRegistrationAddress(registrationAddress);
        userInf.setMaritalStatus(maritalStatus);
        userInf.setNationality(nationality);
        userInf.setDisability(disability);
        userInf.setMonthlyEarnings(monthlyEarnings);


        userInfoRepo.save(userInf);

        logger.info("Записаны личные данные о пользователе " + user.getUsername());
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
        userInf.setHomeNumber(homeNumber);

        if (phoneNumber.equals("")) {
            userInf.setPhoneNumber(phoneNumber);
        } else {
            userInf.setPhoneNumber("+375 " + phoneNumber);
        }

        userInf.setWorkPlace(workPlace);
        userInf.setPosition(position);
        userInf.setRegistrationCity(registrationCity);
        userInf.setRegistrationAddress(registrationAddress);
        userInf.setMaritalStatus(maritalStatus);
        userInf.setMonthlyEarnings(monthlyEarnings);

        userInfoRepo.save(userInf);

        logger.info("Обновлены личные данные пользователя " + user.getUsername());
    }
}