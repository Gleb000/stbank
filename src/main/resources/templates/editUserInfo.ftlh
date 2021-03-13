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
                                   class="form-control" id="floatingPassportSeries" placeholder="Серия паспорта"/>
                            <label for="floatingPassportSeries">Серия паспорта</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="passportNumber" value="${passportNumber!''}"
                                   class="form-control" id="floatingPassportNumber" placeholder="Номер паспорта"/>
                            <label for="floatingPassportNumber">Номер паспорта</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="issuedBy" value="${issuedBy!''}"
                                   class="form-control" id="floatingIssuedBy" placeholder="Кем выдан"/>
                            <label for="floatingIssuedBy">Кем выдан</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="date" name="dateOfIssue" value="${dateOfIssue!''}"
                                   class="form-control" id="floatingDateOfIssue" placeholder="Дата выдачи паспорта"/>
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
                                   class="form-control" id="floatingAddress" placeholder="Адрес проживания">
                            <label for="floatingAddress">Адрес проживания</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="text" name="registrationAddress" value="${registrationAddress!''}"
                                   class="form-control" id="floatingRegistrationAddress" placeholder="Адрес прописки">
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

<!--
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Серия паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportSeries" class="form-control form-control-lg" value="${passportSeries!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Номер паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportNumber" class="form-control form-control-lg" placeholder="1234567" value="${passportNumber!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Кем выдан</label>
                <div class="col-sm-6">
                    <input type="text" name="issuedBy" class="form-control form-control-lg" value="${issuedBy!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Дата выдачи</label>
                <div class="col-sm-6">
                    <input type="date" name="dateOfIssue" class="form-control form-control-lg" value="${dateOfIssue!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state1" class="col-sm-4 col-form-label-lg">Город проживания</label>
                <div class=" col-sm-6">
                    <select class="form-control form-control-lg" id="state1" name="cityOfResidence">
                        <option>Минск</option>
                        <option>Гродно</option>
                        <option>Брест</option>
                        <option>Гомель</option>
                        <option>Могилев</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Адрес</label>
                <div class="col-sm-6">
                    <input type="text" name="address" class="form-control form-control-lg" value="${address!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Домашний телефон</label>
                <div class="col-sm-6">
                    <input type="text" name="homeNumber" class="form-control form-control-lg" placeholder="123-45-67" value="${homeNumber!''}">
                </div>
            </div>
            <div class="form-group row">
                <label for="inLineForm" class="col-sm-4 col-form-label-lg">Мобильный телефон</label>
                <div class="col-sm-6">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">+375</div>
                        </div>
                        <input type="text" name="phoneNumber" id="inLineForm" class="form-control form-control-lg" placeholder="29 123-45-67" value="${phoneNumber!''}">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Место работы</label>
                <div class="col-sm-6">
                    <input type="text" name="workPlace" class="form-control form-control-lg" value="${workPlace!''}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Должность</label>
                <div class="col-sm-6">
                    <input type="text" name="position" class="form-control form-control-lg" value="${position!''}">
                </div>
            </div>
            <div class="form-group row">
                <label for="state2" class="col-sm-4 col-form-label-lg">Город прописки</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state2" name="registrationCity">
                        <option>Минск</option>
                        <option>Гродно</option>
                        <option>Брест</option>
                        <option>Гомель</option>
                        <option>Могилев</option>
                        <option>другое</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Адрес прописки</label>
                <div class="col-sm-6">
                    <input type="text" name="registrationAddress" class="form-control form-control-lg" value="${registrationAddress!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state3" class="col-sm-4 col-form-label-lg">Семейное положение</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state3" name="maritalStatus">
                        <option>Не замужем, не женат</option>
                        <option>Замужем, женат</option>
                        <option>Разведен, разведена</option>
                        <option>Вдова, вдовец</option>
                        <option>другое</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Ежемесячный доход</label>
                <div class="col-sm-6">
                    <input type="text" name="monthlyEarnings" class="form-control form-control-lg" value="${monthlyEarnings!''}">
                </div>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Сохранить</button>
            </div>
        </div>
        <div class="p-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
        </div>
    </form>
-->