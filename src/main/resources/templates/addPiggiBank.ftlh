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
            <#if userBankAcc??>
                <div class="container py-2">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col col-lg-4">
                            <div class="py-4 px-5 mx-5">
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
                            <h5 class="text-success px-5 mx-2">Открытие копилки</h5>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col col-lg-6">
                            <div class="card border-success">
                                <div class="card-header">Справочная информация</div>
                                <div class="card-body">
                                    <h6>Требователь: <label class="text-success">${lastName} ${firstName} ${patronymic}</label></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
                <div class="container py-2">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col col-lg-6">
                            <div class="card border-success">
                                <div class="card-header">Информация об открытии копилки</div>
                                <div class="card-body">
                                    <h6>&blacktriangleright; <label class="text-success">Создание копилки со своим названием;</label></h6>
                                    <h6>&blacktriangleright; <label class="text-success">Абсолютно бесплатно;</label></h6>
                                    <h6>&blacktriangleright; <label class="text-danger">Важно! <label class="text-success">Возможно только разбить копилку</label></label></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
                <div class="container py-2">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col col-lg-6">
                            <div class="form-floating mb-1 py-2">
                                <input type="text" class="form-control ${(piggiBankNameError??)?string('is-invalid', '')}"
                                       value="<#if piggiBank??>${piggiBank.piggiBankName}</#if>" name="piggiBankName"
                                       id="floatingPiggiName" placeholder="Название копилки">
                                <#if piggiBankNameError??>
                                    <div class="invalid-feedback">
                                        ${piggiBankNameError}
                                    </div>
                                </#if>
                                <label for="floatingPiggiName">Название копилки</label>
                            </div>
                            <div class="form-floating mb-1 py-1">
                                <input type="date" class="form-control ${(targetDateError??)?string('is-invalid', '')}"
                                       name="targetDate" value="<#if piggiBank??>${piggiBank.targetDate}</#if>"
                                       id="floatingTargetDate" placeholder="Дата накопления">
                                <#if targetDateError??>
                                    <div class="invalid-feedback">
                                        ${targetDateError}
                                    </div>
                                </#if>
                                <label for="floatingTargetDate">Дата накопления</label>
                            </div>
                            <div class="form-floating mb-1 py-2">
                                <input type="text" class="form-control ${(moneyError??)?string('is-invalid', '')}"
                                       name="money" <#if currentMoney??>value="${currentMoney}"</#if> placeholder="BYN"
                                       id="floatingPhone" placeholder="Цель накопления">
                                <#if moneyError??>
                                    <div class="invalid-feedback">
                                        ${moneyError}
                                    </div>
                                </#if>
                                <label for="floatingPhone">Цель накопления</label>
                            </div>
                            <button class="btn btn-outline-success" type="submit">Открыть &checkmark;</button>
                            <a class="btn btn-success" href="/user/internetBanking">На главную &curvearrowleft;</a>
                            <hr class="featurette-divider">
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                        </div>
                        <div class="col col-lg-3">
                            <p class="px-4 text-muted">&copy; 2017 «СтатусБанк»</p>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            <#else>
                <#if firstName??>
                    <div class="container py-5 my-5">
                        <div class="row">
                            <div class="col col-lg-3">
                            </div>
                            <div class="col col-lg-6">
                                <div class="card border-danger">
                                    <div class="card-header">Предупреждение</div>
                                    <div class="card-body text-danger">
                                        <h5 class="card-title">Счет не оформлен</h5>
                                        <p class="card-text">Оформите пожалуйста счет!</p>
                                        <a class="btn btn-outline-success" href="/user/addAccInfo">Оформить &raquo;</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-lg-3">
                            </div>
                        </div>
                    </div>
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
            </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </main>
</@c.page>