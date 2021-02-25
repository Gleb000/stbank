package by.pogoretskaya.stbank.domain;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="usr_info")
public class UserInfo {
    @Id
    private Long id;

    @NotBlank(message = "Необходимо ввести имя")
    private String firstName;
    @NotBlank(message = "Необходимо ввести фамилию")
    private String lastName;
    @NotBlank(message = "Необходимо ввести отчество")
    private String patronymic;
    @NotBlank(message = "Необходимо ввести дату рождения")
    private String dateOfBirth;
    private String sex;
    @NotBlank(message = "Необходимо ввести серию паспорта")
    private String passportSeries;
    @NotBlank(message = "Необходимо ввести номер паспорта")
    private String passportNumber;
    @NotBlank(message = "Необходимо ввести кем выдан ваш паспорт")
    private String issuedBy;
    @NotBlank(message = "Необходимо ввести дату выдачи паспорта")
    private String dateOfIssue;
    @NotBlank(message = "Необходимо ввести идентификационный номер")
    private String identificationNumber;
    @NotBlank(message = "Необходимо ввести место рождения")
    private String placeOfBirth;
    @NotBlank(message = "Необходимо выбрать город проживания")
    private String cityOfResidence;
    @NotBlank(message = "Необходимо ввести адрес проживания")
    private String address;
    private String homeNumber;
    private String phoneNumber;
    private String workPlace;
    private String position;
    @NotBlank(message = "Необходимо выбрать город прописки")
    private String registrationCity;
    @NotBlank(message = "Необходимо ввести адрес прописки")
    private String registrationAddress;
    @NotBlank(message = "Необходимо выбрать семейное положения")
    private String maritalStatus;
    @NotBlank(message = "Необходимо выбрать гражданство")
    private String nationality;
    @NotBlank(message = "Необходимо выбрать инвалидность")
    private String disability;
    private String monthlyEarnings;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPassportSeries() {
        return passportSeries;
    }

    public void setPassportSeries(String passportSeries) {
        this.passportSeries = passportSeries;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }

    public String getDateOfIssue() {
        return dateOfIssue;
    }

    public void setDateOfIssue(String dateOfIssue) {
        this.dateOfIssue = dateOfIssue;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getCityOfResidence() {
        return cityOfResidence;
    }

    public void setCityOfResidence(String cityOfResidence) {
        this.cityOfResidence = cityOfResidence;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHomeNumber() {
        return homeNumber;
    }

    public void setHomeNumber(String homeNumber) {
        this.homeNumber = homeNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getRegistrationCity() {
        return registrationCity;
    }

    public void setRegistrationCity(String registrationCity) {
        this.registrationCity = registrationCity;
    }

    public String getRegistrationAddress() {
        return registrationAddress;
    }

    public void setRegistrationAddress(String registrationAddress) {
        this.registrationAddress = registrationAddress;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getDisability() {
        return disability;
    }

    public void setDisability(String disability) {
        this.disability = disability;
    }

    public String getMonthlyEarnings() {
        return monthlyEarnings;
    }

    public void setMonthlyEarnings(String monthlyEarnings) {
        this.monthlyEarnings = monthlyEarnings;
    }
}
