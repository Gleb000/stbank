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
        <form method="get">
            <#if firstName??>
                <div class="container py-4">
                    <h4 class="text-muted">Информация о пользователе:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Фамилия: <label class="col-form-label-lg text-info">${lastName}</label></label>
                        <label class="col-form-label-lg">Имя: <label class="col-form-label-lg text-info">${firstName}</label></label>
                        <label class="col-form-label-lg">Отчество: <label class="col-form-label-lg text-info">${patronymic}</label></label>
                        <label class="col-form-label-lg">Дата рождения: <label class="col-form-label-lg text-info">${dateOfBirth}</label></label>
                        <label class="col-form-label-lg">Пол: <label class="col-form-label-lg text-info">${sex}</label></label>
                        <div class="container py-3">
                            <hr class="featurette-divider">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <h4 class="text-muted">Паспортные данные:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Серия Паспорта: <label class="col-form-label-lg text-info">${passportSeries}</label></label>
                        <label class="col-form-label-lg">Номер паспорта: <label class="col-form-label-lg text-info">${passportNumber}</label></label>
                        <label class="col-form-label-lg">Кем выдан: <label class="col-form-label-lg text-info">${issuedBy}</label></label>
                        <label class="col-form-label-lg">Дата выдачи: <label class="col-form-label-lg text-info">${dateOfIssue}</label></label>
                        <label class="col-form-label-lg">Идентификационный номер: <label class="col-form-label-lg text-info">${identificationNumber}</label></label>
                        <div class="container py-3">
                            <hr class="featurette-divider">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <h4 class="text-muted">Место рождения, проживания, прописки. Гражданство:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Место рождения: <label class="col-form-label-lg text-info">${placeOfBirth}</label></label>
                        <label class="col-form-label-lg">Город проживания: <label class="col-form-label-lg text-info">${cityOfResidence}</label></label>
                        <label class="col-form-label-lg">Адрес проживания: <label class="col-form-label-lg text-info">${address}</label></label>
                        <label class="col-form-label-lg">Город прописки: <label class="col-form-label-lg text-info">${registrationCity}</label></label>
                        <label class="col-form-label-lg">Гражданство: <label class="col-form-label-lg text-info">${nationality}</label></label>
                        <label class="col-form-label-lg">Адрес прописки: <label class="col-form-label-lg text-info">${registrationAddress}</label></label>
                        <div class="container py-3">
                            <hr class="featurette-divider">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <h4 class="text-muted">Семейное положение и инвалидность:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Семейное положение: <label class="col-form-label-lg text-info">${maritalStatus}</label></label>
                        <label class="col-form-label-lg">Инвалидность: <label class="col-form-label-lg text-info">${disability}</label></label>
                        <div class="container py-3">
                            <hr class="featurette-divider">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <h4 class="text-muted">Контактная информация:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Домашний номер телефона: <label class="col-form-label-lg text-info">${homeNumber}</label></label>
                        <label class="col-form-label-lg">Мобильный номер телефона: <label class="col-form-label-lg text-info">${phoneNumber}</label></label>
                        <div class="container py-3">
                            <hr class="featurette-divider">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <h4 class="text-muted">Информация о работе:</h4>
                    <div class="row">
                        <label class="col-form-label-lg">Место работы: <label class="col-form-label-lg text-info">${workPlace}</label></label>
                        <label class="col-form-label-lg">Ежемесяный доход: <label class="col-form-label-lg text-info">${monthlyEarnings}</label></label>
                        <label class="col-form-label-lg">Должность: <label class="col-form-label-lg text-info">${position}</label></label>
                    </div>
                    <div class="container py-3">
                        <hr class="featurette-divider">
                    </div>
                    <a class="btn btn-outline-success" href="/user/editUserInfo">Редактировать информацию &xrArr;</a>
                    <div class="container py-3">
                        <hr class="featurette-divider">
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <footer class="container">
                    <p class="text-muted">&copy; 2017 «СтатусБанк»</p>
                    <p class="text-muted">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
                </footer>
            <#else>
                <div class="container py-5 my-5">
                    <div class="row">
                        <div class="col col-lg-3">
                        </div>
                        <div class="col col-lg-6">
                            <div class="card border-danger">
                                <div class="card-header">Предупреждение</div>
                                <div class="card-body text-danger">
                                    <h5 class="card-title">Профиль не заполнен</h5>
                                    <p class="card-text">Заполните пожалуйста профиль!</p>
                                    <a class="btn btn-outline-success" href="/user/addUserInfo">Заполнить &raquo;</a>
                                </div>
                            </div>
                        </div>
                        <div class="col col-lg-3">
                        </div>
                    </div>
                </div>
            </#if>
        </form>
    </main>
</@c.page>