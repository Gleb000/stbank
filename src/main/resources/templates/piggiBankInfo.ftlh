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
                    <div class="col col-lg-5">
                        <h5 class="text-success px-5 mx-4">Информация о копилке</h5>
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
                                <h6>Пользователь: <label class="text-success">${lastName} ${firstName} ${patronymic}</label></h6>
                                <h6>Счет: <label class="text-success">${bankAcc}</label></h6>
                                <h6>Сумма на счету: <label class="text-success">${userMoney} BYN</label></h6>
                                <h6>Название копилки: <label class="text-success">${piggiName} BYN</label></h6>
                                <h6>Дата накопления: <label class="text-success">${date} BYN</label></h6>
                                <h6>Цель накопления: <label class="text-success">${money} BYN</label></h6>
                                <h6>Накоплено: <label class="text-success">${piggiBankMoney} BYN</label></h6>
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
                        <a class="btn btn-outline-success" href="/user/topUpPiggiBank">Пополнить &raquo;</a>
                        <a class="btn btn-outline-success" href="/user/crashPiggiBank">Разбить &times;</a>
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
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </main>
</@c.page>