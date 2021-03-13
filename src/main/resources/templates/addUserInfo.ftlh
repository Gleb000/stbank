<#import "parts/login.ftlh" as l>
<#include "parts/security.ftlh">
<#import "parts/common.ftlh" as c>

<@c.page>

    <header class="site-header sticky-top py-1">
        <nav class="container d-flex flex-column flex-md-row">
            <a class="py-2 px-5 mx-3" href="/" aria-label="Product">
                <img width="26" height="26" src="/img/logo.png">
            </a>
            <#if user??>
                <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/user/internetBanking">Интернет банкинг</a>
                <a class="py-2 d-none d-md-inline-block" href="/user/userInfo">Профиль</a>
            <#else>
                <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/login">Интернет банкинг</a>
                <a class="py-2 d-none d-md-inline-block" href="/login">Профиль</a>
            </#if>
            <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/bankInfo">О Банке</a>
            <li class="nav-item dropdown d-none d-md-inline-block">
                <a class="px-5 mx-4 nav-link dropdown-toggle" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Профиль
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item" href="/user/allUserInformation">Информация об аккаунте</a></li>
                    <li><a class="dropdown-item" href="/user/profile">Редактировать аккаунт</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <div class="px-1">
                        <@l.logout />
                    </div>
                </ul>
            </li>
        </nav>
    </header>

    <main>
        <form method="post">
            <div class="container py-3">
                <div class="row">
                    <div class="col-sm">
                    </div>
                    <div class="col col-lg-4">
                        <div class="py-5 px-5 mx-5">
                            <img width="100" height="100" src="/img/logo2.png">
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                    </div>
                    <div class="col col-lg-4">
                        <div class="px-1">
                            <h3 class="text-success">Заполнение профиля</h3>
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
            <div class="container py-1">
                <div class="row">
                    <div class="col col-lg-11">
                        <div class="px-1">
                            <h5 class="text-muted">Обязательная для заполнения информация<label class="text-danger">*</label></h5>
                        </div>
                    </div>
                    <div class="col col-lg-1">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row">
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="firstName" value="<#if userInfo??>${userInfo.firstName}</#if>"
                                   class="form-control ${(firstNameError??)?string('is-invalid', '')}"
                                   id="floatingFirstName" placeholder="Имя"/>
                            <#if firstNameError??>
                                <div class="invalid-feedback">
                                    ${firstNameError}
                                </div>
                            </#if>
                            <label for="floatingFirstName">Имя</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="lastName" value="<#if userInfo??>${userInfo.lastName}</#if>"
                                   class="form-control ${(lastNameError??)?string('is-invalid', '')}"
                                   id="floatingLastName" placeholder="Фамилия"/>
                            <#if lastNameError??>
                                <div class="invalid-feedback">
                                    ${lastNameError}
                                </div>
                            </#if>
                            <label for="floatingLastName">Фамилия</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="patronymic" value="<#if userInfo??>${userInfo.patronymic}</#if>"
                                   class="form-control ${(patronymicError??)?string('is-invalid', '')}"
                                   id="floatingPatronymic" placeholder="Отчество"/>
                            <#if patronymicError??>
                                <div class="invalid-feedback">
                                    ${patronymicError}
                                </div>
                            </#if>
                            <label for="floatingPatronymic">Отчество</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="date" name="dateOfBirth" value="<#if userInfo??>${userInfo.dateOfBirth}</#if>"
                                   class="form-control ${(dateOfBirthError??)?string('is-invalid', '')}"
                                   id="floatingDateOfBirth" placeholder="Дата рождения"/>
                            <#if dateOfBirthError??>
                                <div class="invalid-feedback">
                                    ${dateOfBirthError}
                                </div>
                            </#if>
                            <label for="floatingDateOfBirth">Дата рождения</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Мужской" name="sex" id="flexRadioDefault1" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Мужской пол
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" value="Женский" name="sex" id="flexRadioDefault2">
                            <label class="form-check-label" for="flexRadioDefault2">
                                Женский пол
                            </label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="passportSeries" value="<#if userInfo??>${userInfo.passportSeries}</#if>"
                                   class="form-control ${(passportSeriesError??)?string('is-invalid', '')}"
                                   id="floatingPassportSeries" placeholder="Серия паспорта"/>
                            <#if passportSeriesError??>
                                <div class="invalid-feedback">
                                    ${passportSeriesError}
                                </div>
                            </#if>
                            <label for="floatingPassportSeries">Серия паспорта</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="passportNumber" value="<#if userInfo??>${userInfo.passportNumber}</#if>"
                                   class="form-control ${(passportNumberError??)?string('is-invalid', '')}"
                                   id="floatingPassportNumber" placeholder="Номер паспорта"/>
                            <#if passportNumberError??>
                                <div class="invalid-feedback">
                                    ${passportNumberError}
                                </div>
                            </#if>
                            <label for="floatingPassportNumber">Номер паспорта</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="issuedBy" value="<#if userInfo??>${userInfo.issuedBy}</#if>"
                                   class="form-control ${(issuedByError??)?string('is-invalid', '')}"
                                   id="floatingIssuedBy" placeholder="Кем выдан"/>
                            <#if issuedByError??>
                                <div class="invalid-feedback">
                                    ${issuedByError}
                                </div>
                            </#if>
                            <label for="floatingIssuedBy">Кем выдан</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="date" name="dateOfIssue" value="<#if userInfo??>${userInfo.dateOfIssue}</#if>"
                                   class="form-control ${(dateOfIssueError??)?string('is-invalid', '')}"
                                   id="floatingDateOfIssue" placeholder="Дата выдачи паспорта"/>
                            <#if dateOfIssueError??>
                                <div class="invalid-feedback">
                                    ${dateOfIssueError}
                                </div>
                            </#if>
                            <label for="floatingDateOfIssue">Дата выдачи паспорта</label>
                        </div>
                    </div>
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="identificationNumber" value="<#if userInfo??>${userInfo.identificationNumber}</#if>"
                                   class="form-control ${(identificationNumberError??)?string('is-invalid', '')}"
                                   id="floatingIdentificationNumber" placeholder="Идентификационный номер"/>
                            <#if identificationNumberError??>
                                <div class="invalid-feedback">
                                    ${identificationNumberError}
                                </div>
                            </#if>
                            <label for="floatingIdentificationNumber">Идентификационный номер</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="placeOfBirth" value="<#if userInfo??>${userInfo.placeOfBirth}</#if>"
                                   class="form-control ${(placeOfBirthError??)?string('is-invalid', '')}"
                                   id="floatingPlaceOfBirth" placeholder="Место рождения">
                            <#if placeOfBirthError??>
                                <div class="invalid-feedback">
                                    ${placeOfBirthError}
                                </div>
                            </#if>
                            <label for="floatingPlaceOfBirth">Место рождения</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="address" value="<#if userInfo??>${userInfo.address}</#if>"
                                   class="form-control ${(addressError??)?string('is-invalid', '')}"
                                   id="floatingAddress" placeholder="Адрес проживания">
                            <#if addressError??>
                                <div class="invalid-feedback">
                                    ${addressError}
                                </div>
                            </#if>
                            <label for="floatingAddress">Адрес проживания</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="registrationAddress" value="<#if userInfo??>${userInfo.registrationAddress}</#if>"
                                   class="form-control ${(registrationAddressError??)?string('is-invalid', '')}"
                                   id="floatingRegistrationAddress" placeholder="Адрес прописки">
                            <#if registrationAddressError??>
                                <div class="invalid-feedback">
                                    ${registrationAddressError}
                                </div>
                            </#if>
                            <label for="floatingRegistrationAddress">Адрес прописки</label>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="inputGroupSelect01" name="cityOfResidence">
                                <option selected value="Другое">Другое</option>
                                <option value="Минск">Минск</option>
                                <option value="Брест">Брест</option>
                                <option value="Могилев">Могилев</option>
                                <option value="Гродно">Гродно</option>
                                <option value="Гомель">Гомель</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect01">Город проживания</label>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="inputGroupSelect02" name="registrationCity">
                                <option selected value="Другое">Другое</option>
                                <option value="Минск">Минск</option>
                                <option value="Брест">Брест</option>
                                <option value="Могилев">Могилев</option>
                                <option value="Гродно">Гродно</option>
                                <option value="Гомель">Гомель</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect02">Город прописки</label>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="inputGroupSelect04" name="nationality">
                                <option selected value="Другое">Другое</option>
                                <option value="Республика Беларусь">Республика Беларусь</option>
                                <option value="Российская Федерация">Российская Федерация</option>
                                <option value="Украина">Украина</option>
                                <option value="Польша">Польша</option>
                                <option value="Германия">Германия</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect04">Гражданство</label>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="inputGroupSelect03" name="maritalStatus">
                                <option selected value="Другое">Другое</option>
                                <option value="Не замужем, не женат">Не замужем, не женат</option>
                                <option value="Замужем, женат">Замужем, женат</option>
                                <option value="Разведен, разведена">Разведен, разведена</option>
                                <option value="Вдова, вдовец">Вдова, вдовец</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect03">Семейное положение</label>
                        </div>
                        <div class="input-group mb-3">
                            <select class="form-select" id="inputGroupSelect05" name="disability">
                                <option selected value="отсутствует">отсутствует</option>
                                <option value="1 группа">1 группа</option>
                                <option value="2 группа">2 группа</option>
                                <option value="3 группа">3 группа</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect05">Инвалидность</label>
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <hr class="featurette-divider">
                </div>
            </div>
            <div class="container py-1">
                <div class="row">
                    <div class="col col-lg-11">
                        <div class="px-1">
                            <h5 class="text-muted">Информация необязательная для заполнения</h5>
                        </div>
                    </div>
                    <div class="col col-lg-1">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="homeNumber" placeholder="Дом. номер телефона в формате 123-45-67" class="form-control"
                                   id="floatingHomeNumber"/>
                            <label for="floatingHomeNumber">Дом. номер телефона в формате 123-45-67</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="phoneNumber" class="form-control"
                                   id="floatingPhoneNumber" placeholder="Номер телефона в формате 29 123-45-67"/>
                            <label for="floatingPhoneNumber">Номер телефона в формате 29 123-45-67</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="workPlace" class="form-control form-control-lg"
                                   id="floatingWorkPlace" placeholder="Место работы"/>
                            <label for="floatingWorkPlace">Место работы</label>
                        </div>
                    </div>
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="position" class="form-control"
                                   id="floatingPosition" placeholder="Должность"/>
                            <label for="floatingPosition">Должность</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="monthlyEarnings" class="form-control"
                                   id="floatingMonthlyEarnings" placeholder="Ежемесячный доход"/>
                            <label for="floatingMonthlyEarnings">Ежемесячный доход</label>
                        </div>
                    </div>
                </div>
                <div class="container py-3">
                    <hr class="featurette-divider">
                </div>
                <button type="submit" class="btn btn-outline-success">Сохранить &checkmark;</button>
                <div class="container py-3">
                    <hr class="featurette-divider">
                </div>
                <footer class="container">
                    <p class="text-muted">&copy; 2017 «СтатусБанк»</p>
                    <p class="text-muted">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
                </footer>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </main>
</@c.page>