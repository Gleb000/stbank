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
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="bd-placeholder-img" width="100%" height="100%" src="/img/carousel1.png" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>
                <div class="carousel-item">
                    <img class="bd-placeholder-img" width="100%" height="100%" src="/img/carousel2.png" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>
                <div class="carousel-item">
                    <img class="bd-placeholder-img" width="100%" height="100%" src="/img/carousel3.png" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container marketing py-4">
            <div class="row">
                <div class="col col-lg-3">
                    <h4>Курсы валют:</h4>
                </div>
                <div class="col col-lg-1">
                    <img width="55" height="32" src="/img/USDRate.png">
                </div>
                <div class="col col-lg-2">
                    <h5>1 USD</h5>
                    <h5>${USDRate} BYN</h5>
                </div>
                <div class="col col-lg-1">
                    <img width="55" height="32" src="/img/EURRate.png">
                </div>
                <div class="col col-lg-2">
                    <h5>1 EUR</h5>
                    <h5>${EURRate} BYN</h5>
                </div>
                <div class="col col-lg-1">
                    <img width="55" height="32" src="/img/RUBRate.png">
                </div>
                <div class="col col-lg-2">
                    <h5>100 RUB</h5>
                    <h5>${RUBRate} BYN</h5>
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row">
                <div class="col-lg-4">
                    <img width="300" height="300" src="/img/money.png">

                    <h6 class="text-success">«ВАШИ ДЕНЬГИ»</h6>
                    <p>&blacktriangleright; от 23% годовых;</p>
                    <p>&blacktriangleright; до 5 000 рублей на срок до 3 лет;</p>
                    <p>&blacktriangleright; предоставление кредита на счет;</p>
                    <p>&blacktriangleright; без залога и поручителей;</p>
                    <p>&blacktriangleright; досрочное погашение без комиссий и ограничений.</p>
                    <#if user??>
                        <p><a class="btn btn-outline-success" href="/user/credit">Подробнее &raquo;</a></p>
                        <#else>
                        <button class="btn btn-outline-success" disabled>Подробнее &raquo;</button>
                            <p class="text-muted">Недоступно, пока вы не авторизируетесь</p>
                    </#if>
                </div>
                <div class="col-lg-4">
                    <img width="300" height="300" src="/img/fast.png">

                    <h6 class="text-success">«БЫСТРЫЕ ПОКУПКИ»</h6>
                    <p>&blacktriangleright; от 22% годовых;</p>
                    <p>&blacktriangleright; без справки о доходах;</p>
                    <p>&blacktriangleright; без первоначального взноса;</p>
                    <p>&blacktriangleright; получение товара в день оформления кредита.</p>
                    <#if user??>
                        <p><a class="btn btn-outline-success" href="/user/credit">Подробнее &raquo;</a></p>
                    <#else>
                        <button class="btn btn-outline-success" disabled>Подробнее &raquo;</button>
                        <p class="text-muted">Недоступно, пока вы не авторизируетесь</p>
                    </#if>
                </div>
                <div class="col-lg-4">
                    <img width="300" height="300" src="/img/fastOnl.png">

                    <h6 class="text-success">«БЫСТРЫЕ ПОКУПКИ ОНЛАЙН»</h6>
                    <p>&blacktriangleright; в онлайн-гипермаркете E-DOSTAVKA.BY на все товары в Корзине;</p>
                    <p>&blacktriangleright; 36 месяцев;</p>
                    <p>&blacktriangleright; 25% годовых;</p>
                    <p>&blacktriangleright; до 5000 белорусских рублей;</p>
                    <p>&blacktriangleright; без справки о доходах;</p>
                    <p>&blacktriangleright; без первоначального взноса;</p>
                    <p>&blacktriangleright; досрочное погашение без комиссий и ограничений.</p>
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">Приложение банка</h2>
                    <h3><span class="text-muted">Вы сможете:</span></h3>
                    <p class="lead">&triangleright; Следить за своими финансами</p>
                    <p class="lead">&triangleright; Совершать платежи из дома в одно касание</p>
                    <p class="lead">&triangleright; Переводить деньги на карты</p>
                    <h4>Доступно в: <span class="text-info">Google play</span> и <span class="text-info">App Store</span></h4>
                </div>
                <div class="col-md-5">
                    <img width="400" height="400" src="/img/prilSTB.png">
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading">Копилка</h2>
                    <h3><span class="text-muted">Попробуйте в нашем банке</span></h3>
                    <p class="lead">Копилка - это очень удобно! Возможность накапливать деньги для своей мечты, воплотите в реальность то, чего хотели очень давно</p>
                    <#if user??>
                        <a class="btn btn-outline-success" href="/user/addPiggiBank">Открыть копилку &raquo;</a>
                        <#else>
                            <button class="btn btn-outline-success" disabled>Открыть копилку &raquo;</button>
                            <p class="text-muted">Недоступно, пока вы не авторизируетесь</p>
                    </#if>
                </div>
                <div class="col-md-5 order-md-1">
                    <img width="400" height="400" src="/img/piggiBank.jpg">
                </div>
            </div>

            <hr class="featurette-divider">

        </div>

        <footer class="container">
            <p class="text-muted">&copy; 2017 «СтатусБанк»</p>
            <p class="text-muted">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </footer>
    </main>
</@c.page>