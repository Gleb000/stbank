<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control form-control-lg ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Логин" />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password"
                       class="form-control form-control-lg ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Пароль" />
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Подтверждение пароля:</label>
                <div class="col-sm-6">
                    <input type="password" name="password2"
                           class="form-control form-control-lg ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Введите пароль заново" />
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Адрес электронной почты:</label>
                <div class="col-sm-6">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control form-control-lg ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@some.com" />
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6LcA4DUaAAAAAC7ilIpqTdfIwqJ7G3x7SIpbbzuE"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if user?? && !isRegisterForm>
            <div>
                <label class="col-sm-7 col-form-label">Enter the password and confirm the money transfer!!!</label>
            </div>
        </#if>
        <#if !isRegisterForm && !user??><a class="text-lg text-success" href="/registration">Создать аккаунт</a></#if>
        <button class="btn btn-lg btn-success" type="submit"><#if isRegisterForm>Создать<#else><#if !user??>Авторизоваться<#else>Успешно!</#if></#if></button>
    </form>
</#macro>

<#include "security.ftlh">

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if user??>
            <button class="btn btn-success" type="submit">Выход</button>
        </#if>
        <#if !user??>
            <button class="btn btn-success" type="submit">Авторизоваться</button>
        </#if>
    </form>
</#macro>