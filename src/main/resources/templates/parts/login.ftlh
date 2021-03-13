<#macro login path isRegisterForm>

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
        <form action="${path}" method="post">
            <div class="container py-3">
                <div class="row">
                    <div class="col-sm">
                    </div>
                    <div class="col col-lg-4">
                        <div class="py-5 px-5 mx-5">
                            <img width="100" height="100" src="/img/logo2.png">
                        </div>
                        <#if isRegisterForm>
                            <h5 class="px-3"><p class="text-success">Регистрация пользователя</p></h5>
                            <#else>
                                <h5 class="px-5"><p class="text-success">Пожалуйста войдите</p></h5>
                        </#if>
                        <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                            <div class="alert alert-danger" role="alert">
                                Введены некорректные данные
                            </div>
                        </#if>
                        <div class="form-floating mb-1">
                            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                   id="floatingInput" placeholder="Логин"/>
                            <#if usernameError??>
                                <div class="invalid-feedback">
                                    ${usernameError}
                                </div>
                            </#if>
                            <label for="floatingInput">Логин</label>
                        </div>
                        <div class="form-floating mb-1">
                            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}
                                   ${(numberError??)?string('is-invalid', '')}
                                   ${(symbolError??)?string('is-invalid', '')} ${(symbol2Error??)?string('is-invalid', '')}
                                   ${(specSymbolError??)?string('is-invalid', '')} ${(spaceError??)?string('is-invalid', '')}
                                   ${(toSmallError??)?string('is-invalid', '')}"
                                   id="floatingPassword" placeholder="Пароль" name="password">
                            <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                                <#else>
                                    <#if numberError??>
                                        <div class="invalid-feedback">
                                            &horbar; ${numberError}
                                        </div>
                                    </#if>
                                    <#if symbolError??>
                                        <div class="invalid-feedback">
                                            &horbar; ${symbolError}
                                        </div>
                                    </#if>
                                    <#if symbol2Error??>
                                        <div class="invalid-feedback">
                                            &horbar; ${symbol2Error}
                                        </div>
                                    </#if>
                                    <#if specSymbolError??>
                                        <div class="invalid-feedback">
                                            &horbar; ${specSymbolError}
                                        </div>
                                    </#if>
                                    <#if spaceError??>
                                        <div class="invalid-feedback">
                                            &horbar; ${spaceError}
                                        </div>
                                    </#if>
                                    <#if toSmallError??>
                                        <div class="invalid-feedback">
                                            &horbar; ${toSmallError}
                                        </div>
                                    </#if>
                            </#if>
                            <label for="floatingPassword">Пароль</label>
                        </div>
                        <#if isRegisterForm>
                            <div class="form-floating mb-1">
                                <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                       id="floatingPassword2" placeholder="Подтверждение пароля" name="password2">
                                <#if password2Error??>
                                    <div class="invalid-feedback">
                                        ${password2Error}
                                    </div>
                                </#if>
                                <label for="floatingPassword2">Подтверждение пароля</label>
                            </div>
                            <div class="form-floating mb-1">
                                <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                       id="floatingEmail" placeholder="Электронная почта" name="email"
                                       value="<#if user??>${user.email}</#if>">
                                <#if emailError??>
                                    <div class="invalid-feedback">
                                        ${emailError}
                                    </div>
                                </#if>
                                <label for="floatingEmail">Электронная почта</label>
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LcA4DUaAAAAAC7ilIpqTdfIwqJ7G3x7SIpbbzuE"></div>
                        </#if>
                        <div class="py-2">
                            <button class="btn btn-success px-3" type="submit"><#if isRegisterForm>Создать<#else><#if !user??>Войти<#else>Успешно!</#if></#if></button>
                            <#if !isRegisterForm && !user??><a class="btn btn-outline-success" href="/registration">Создать аккаунт</a></#if>
                            <#if isRegisterForm><a class="btn btn-outline-success" href="/login">&xlarr; Назад</a></#if>
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
</#macro>

<#include "security.ftlh">

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if user??>
            <button class="btn btn-outline-success" type="submit">Выйти &hArr;</button>
        </#if>
        <#if !user??>
            <button class="btn btn-outline-success" type="submit">Войти &rArr;</button>
        </#if>
    </form>
</#macro>