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
                        <h5 class="px-5"><p class="text-success">Изменение данных</p></h5>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                   id="floatingPassword" placeholder="Новый пароль" name="password">
                            <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                            </#if>
                            <label for="floatingPassword">Новый пароль</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                   id="floatingEmail" placeholder="Новый адрес эл. почты" name="email"
                                   value="${email!''}">
                            <#if emailError??>
                                <div class="invalid-feedback">
                                    ${emailError}
                                </div>
                            </#if>
                            <label for="floatingEmail">Новый адрес эл. почты</label>
                        </div>
                        <div class="py-2">
                            <button class="btn btn-outline-success" type="submit">Сохранить изменения &checkmark;</button>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <hr class="featurette-divider">
                        <p class="py-1 px-5 mx-3 text-muted">&copy; 2017 «СтатусБанк»</p>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </form>
    </main>
</@c.page>