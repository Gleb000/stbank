<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">
        <img src="/img/StatusBankLogo.png" width="152" height="30" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/main">List of ads</a>
                </li>
            </#if>
            <li class="nav-item">
                <#if !user?? || isAdmin><a class="nav-link disabled">Платежная система</a><#else><a class="nav-link text-light" href="/user/paymentSystem">Платежная система</a></#if>
            </li>
            <li class="nav-item">
                <#if !user??><a class="nav-link disabled">Профиль</a><#else><a class="nav-link text-light" href="/user/allUserInformation">Профиль</a></#if>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link text-light" href="/bankInfo">О БАНКЕ</a>
            </li>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <@l.logout />
    </div>
</nav>