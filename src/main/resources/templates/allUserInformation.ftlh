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
            <div class="container py-5">
                <div class="row">
                    <div class="col col-lg-5">
                    </div>
                    <div class="col col-lg-2">
                        <img width="100" height="100" src="/img/logo2.png">
                    </div>
                    <div class="col col-lg-5">
                    </div>
                </div>
            </div>
            <div class="container py-1">
                <div class="row">
                    <div class="col col-lg-4">
                    </div>
                    <div class="col col-lg-2">
                        <label class="px-4 col-form-label-lg">Логин:</label>
                    </div>
                    <div class="col col-lg-6">
                        <label class="col-form-label-lg text-info">${userName}</label>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col col-lg-2">
                    </div>
                    <div class="col col-lg-4">
                        <label class="col-form-label-lg">Адрес электронной почты:</label>
                    </div>
                    <div class="col col-lg-6">
                        <label class="col-form-label-lg text-info">${gmail}</label>
                    </div>
                </div>
            </div>
            <div class="container py-3">
                <div class="row">
                    <div class="col col-lg-2">
                    </div>
                    <div class="col col-lg-7">
                        <a class="btn btn-outline-success" href="/user/profile">Редактировать информацию об аккаунте &raquo;</a>
                    </div>
                    <div class="col col-lg-3">
                    </div>
                </div>
            </div>
            <div class="container py-1">
                <div class="row">
                    <div class="col col-lg-2">
                    </div>
                    <div class="col col-lg-7">
                        <hr class="featurette-divider">
                        <p class="py-1 text-muted">&copy; 2017 «СтатусБанк»</p>
                    </div>
                    <div class="col col-lg-3">
                    </div>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </main>
</@c.page>