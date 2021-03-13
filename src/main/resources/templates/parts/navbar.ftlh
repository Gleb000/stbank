<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="container d-flex flex-column flex-md-row">
    <a class="py-2 px-5 mx-3" href="#" aria-label="Product">
        <img width="26" height="26" src="/img/logo.png">
    </a>
    <#if user??>
        <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="#">Интернет банкинг</a>
        <a class="py-2 d-none d-md-inline-block" href="#">Профиль</a>
    <#else>
        <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/login">Интернет банкинг</a>
        <a class="py-2 d-none d-md-inline-block" href="/login">Профиль</a>
    </#if>
    <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="#">О Банке</a>
    <li class="nav-item dropdown d-none d-md-inline-block">
        <a class="px-5 mx-4 nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Профиль
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="#">Информация об аккаунте</a></li>
            <li><a class="dropdown-item" href="#">Редактировать аккаунт</a></li>
            <li><hr class="dropdown-divider"></li>
            <div class="px-1">
                <@l.logout />
            </div>
        </ul>
    </li>
</nav>