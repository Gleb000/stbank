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
                        <div>
                            <h4 class="text-success">Редактирование профиля</h4>
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row">
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="passportSeries" value="${passportSeries!''}"
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
                            <input type="text" name="passportNumber" value="${passportNumber!''}"
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
                            <input type="text" name="issuedBy" value="${issuedBy!''}"
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
                            <input type="date" name="dateOfIssue" value="${dateOfIssue!''}"
                                   class="form-control ${(dateOfIssueError??)?string('is-invalid', '')}"
                                   id="floatingDateOfIssue" placeholder="Дата выдачи паспорта"/>
                            <#if dateOfIssueError??>
                                <div class="invalid-feedback">
                                    ${dateOfIssueError}
                                </div>
                            </#if>
                            <label for="floatingDateOfIssue">Дата выдачи паспорта</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="homeNumber" placeholder="Дом. номер телефона в формате 123-45-67" class="form-control"
                                   id="floatingHomeNumber" value="${homeNumber!''}"/>
                            <label for="floatingHomeNumber">Дом. номер телефона в формате 123-45-67</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="phoneNumber" class="form-control" value="${phoneNumber!''}"
                                   id="floatingPhoneNumber" placeholder="Номер телефона в формате 29 123-45-67"/>
                            <label for="floatingPhoneNumber">Номер телефона в формате 29 123-45-67</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="workPlace" class="form-control form-control-lg"
                                   id="floatingWorkPlace" placeholder="Место работы" value="${workPlace!''}"/>
                            <label for="floatingWorkPlace">Место работы</label>
                        </div>
                    </div>
                    <div class="col col-lg-6">
                        <div class="form-floating mb-1">
                            <input type="text" name="address" value="${address!''}"
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
                            <input type="text" name="registrationAddress" value="${registrationAddress!''}"
                                   class="form-control ${(registrationAddressError??)?string('is-invalid', '')}"
                                   id="floatingRegistrationAddress" placeholder="Адрес прописки">
                            <#if registrationAddressError??>
                                <div class="invalid-feedback">
                                    ${registrationAddressError}
                                </div>
                            </#if>
                            <label for="floatingRegistrationAddress">Адрес прописки</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="position" class="form-control"
                                   id="floatingPosition" placeholder="Должность" value="${position!''}"/>
                            <label for="floatingPosition">Должность</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="monthlyEarnings" class="form-control" value="${monthlyEarnings!''}"
                                   id="floatingMonthlyEarnings" placeholder="Ежемесячный доход"/>
                            <label for="floatingMonthlyEarnings">Ежемесячный доход</label>
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
                            <select class="form-select" id="inputGroupSelect03" name="maritalStatus">
                                <option selected value="Другое">Другое</option>
                                <option value="Не замужем, не женат">Не замужем, не женат</option>
                                <option value="Замужем, женат">Замужем, женат</option>
                                <option value="Разведен, разведена">Разведен, разведена</option>
                                <option value="Вдова, вдовец">Вдова, вдовец</option>
                            </select>
                            <label class="input-group-text" for="inputGroupSelect03">Семейное положение</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="container py-3">
                    <hr class="featurette-divider">
                </div>
                <button type="submit" class="btn btn-outline-success">Сохранить &checkmark;</button>
                <a class="btn btn-success" href="/user/userInfo">Назад &xlArr;</a>
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