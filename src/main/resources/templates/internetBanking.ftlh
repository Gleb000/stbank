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
            <#if userBankAcc??>
                <div class="container py-3">
                    <div class="row">
                        <div class="col col-lg-2">
                            <div class="py-2">
                                <img width="100" height="100" src="/img/logo2.png">
                            </div>
                        </div>
                        <div class="col col-lg-10">
                            <h3>${lastName}</h3>
                            <h3>${firstName}</h3>
                            <h3>${patronymic}</h3>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="container py-3">
                        <hr class="featurette-divider">
                    </div>
                    <div class="row">
                        <div class="col col-lg-6">
                            <div class="card border-success">
                                <div class="card-header"><h5 class="text-muted">Счет в валюте BYN</h5></div>
                                <div class="card-body">
                                    <h6 class="px-4">Счет: <label class="text-success">${userBankAcc}</label></h6>
                                    <h6 class="px-4">Сумма на счету: <label class="text-success">${userAccMoney} BYN</label></h6>
                                    <div class="container py-1">
                                        <div class="row">
                                            <div class="col col-lg-6">
                                                <#if creditSum??>
                                                    <h6>Кредит: <label class="text-success">открыт</label></h6>
                                                    <a class="btn btn-outline-success" href="/user/creditInfo">Подробнее &raquo;</a>
                                                <#else>
                                                    <h6>Кредит: <label class="text-danger">закрыт</label></h6>
                                                    <a class="btn btn-outline-success" href="/user/addCredit">Открыть &raquo;</a>
                                                </#if>
                                            </div>
                                            <div class="col col-lg-6">
                                                <#if piggiName??>
                                                    <h6>Копилка: <label class="text-success">открыта</label></h6>
                                                    <a class="btn btn-outline-success" href="/user/piggiBankInfo">Подробнее &raquo;</a>
                                                <#else>
                                                    <h6>Копилка: <label class="text-danger">закрыта</label></h6>
                                                    <a class="btn btn-outline-success" href="/user/addPiggiBank">Открыть &raquo;</a>
                                                </#if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-lg-6">
                            <div class="accordion accordion-flush" id="accordionFlushExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingOne">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                            Счет в валюте USD
                                        </button>
                                    </h2>
                                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            <#if bankAccountUSD??>
                                                <h6>Счет в USD: <label class="text-success">${bankAccountUSD}</label></h6>
                                                <h6>Сумма на счету: <label class="text-success">${userAccMoneyUSD} USD</label></h6>
                                            <#else>
                                                <h6 class="text-danger">Счет в валюте USD не оформлен!</h6>
                                                <a class="btn btn-outline-success" href="/user/addAccInfoUSD">Перейти к оформлению &raquo;</a>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                            Счет в валюте EUR
                                        </button>
                                    </h2>
                                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            <#if bankAccountEUR??>
                                                <h6>Счет в EUR: <label class="text-success">${bankAccountEUR}</label></h6>
                                                <h6>Сумма на счету: <label class="text-success">${userAccMoneyEUR} EUR</label></h6>
                                            <#else>
                                                <h6 class="text-danger">Счет в валюте EUR не оформлен!</h6>
                                                <a class="btn btn-outline-success" href="/user/addAccInfoEUR">Перейти к оформлению &raquo;</a>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <hr class="featurette-divider">
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <h5 class="text-muted py-2">Конвертация валюты:</h5>
                        <div class="col col-lg-3">
                            <#if userBankAcc?? && bankAccountUSD?? && bankAccountEUR??>
                                <a class="btn btn-outline-success" href="/user/BYNtoUSD">BYN &xrArr; USD</a>
                            <#else>
                                <#if userBankAcc?? && bankAccountUSD?? && !bankAccountEUR??>
                                    <a class="btn btn-outline-success" href="/user/BYNtoUSD">BYN &xrArr; USD</a>
                                <#else>
                                    <#if userBankAcc?? && bankAccountEUR?? && !bankAccountUSD??>
                                        <button class="btn btn-outline-danger" disabled>BYN &xrArr; USD</button>
                                    <#else>
                                        <#if userBankAcc?? && !bankAccountUSD?? && !bankAccountEUR??>
                                            <button class="btn btn-outline-danger" disabled>BYN &xrArr; USD</button>
                                        </#if>
                                    </#if>
                                </#if>
                            </#if>
                        </div>
                        <div class="col col-lg-3">
                            <#if userBankAcc?? && bankAccountUSD?? && bankAccountEUR??>
                                <a class="btn btn-outline-success" href="/user/BYNtoEUR">BYN &xrArr; EUR</a>
                            <#else>
                                <#if userBankAcc?? && bankAccountUSD?? && !bankAccountEUR??>
                                    <button class="btn btn-outline-danger" disabled>BYN &xrArr; EUR</button>
                                <#else>
                                    <#if userBankAcc?? && bankAccountEUR?? && !bankAccountUSD??>
                                        <a class="btn btn-outline-success" href="/user/BYNtoEUR">BYN &xrArr; EUR</a>
                                    <#else>
                                        <#if userBankAcc?? && !bankAccountUSD?? && !bankAccountEUR??>
                                            <button class="btn btn-outline-danger" disabled>BYN &xrArr; EUR</button>
                                        </#if>
                                    </#if>
                                </#if>
                            </#if>
                        </div>
                        <div class="col col-lg-3">
                            <#if userBankAcc?? && bankAccountUSD?? && bankAccountEUR??>
                                <a class="btn btn-outline-success" href="/user/USDtoBYN">USD &xrArr; BYN</a>
                            <#else>
                                <#if userBankAcc?? && bankAccountUSD?? && !bankAccountEUR??>
                                    <a class="btn btn-outline-success" href="/user/USDtoBYN">USD &xrArr; BYN</a>
                                <#else>
                                    <#if userBankAcc?? && bankAccountEUR?? && !bankAccountUSD??>
                                        <button class="btn btn-outline-danger" disabled>USD &xrArr; BYN</button>
                                    <#else>
                                        <#if userBankAcc?? && !bankAccountUSD?? && !bankAccountEUR??>
                                            <button class="btn btn-outline-danger" disabled>USD &xrArr; BYN</button>
                                        </#if>
                                    </#if>
                                </#if>
                            </#if>
                        </div>
                        <div class="col col-lg-3">
                            <#if userBankAcc?? && bankAccountUSD?? && bankAccountEUR??>
                                <a class="btn btn-outline-success" href="/user/EURtoBYN">EUR &xrArr; BYN</a>
                            <#else>
                                <#if userBankAcc?? && bankAccountUSD?? && !bankAccountEUR??>
                                    <button class="btn btn-outline-danger" disabled>EUR &xrArr; BYN</button>
                                <#else>
                                    <#if userBankAcc?? && bankAccountEUR?? && !bankAccountUSD??>
                                        <a class="btn btn-outline-success" href="/user/EURtoBYN">EUR &xrArr; BYN</a>
                                    <#else>
                                        <#if userBankAcc?? && !bankAccountUSD?? && !bankAccountEUR??>
                                            <button class="btn btn-outline-danger" disabled>EUR &xrArr; BYN</button>
                                        </#if>
                                    </#if>
                                </#if>
                            </#if>
                        </div>
                    </div>
                    <div class="container py-3">
                        <hr class="featurette-divider">
                    </div>
                </div>
                <div class="container">
                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Пополнение счета</h2>
                            <h3><span class="text-muted">Это очень удобно</span></h3>
                            <p class="lead">&triangleright; Моментальное зачисление на счет</p>
                            <p class="lead">&triangleright; Нужно сделать всего пару кликов</p>
                            <p class="lead">&triangleright; Деньги будут всегда</p>
                            <a class="btn btn-outline-success" href="/user/refillAcc">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5">
                            <img width="300" height="300" src="/img/refill.png">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Перевод на другой счет</h2>
                            <h3><span class="text-muted">Быстро и просто</span></h3>
                            <p class="lead">&triangleright; Перевод на другой счет в валюте BYN</p>
                            <p class="lead">&triangleright; Быстрый перевод средств</p>
                            <p class="lead">&triangleright; Без лишних действий</p>
                            <a class="btn btn-outline-success" href="/user/transferMoney">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img width="320" height="320" src="/img/transfer.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Оплата коммунальных услуг</h2>
                            <h3><span class="text-muted">Платите за все сразу</span></h3>
                            <p class="lead">&triangleright; Счет за все виды коммунальных услуг уже выставлен, остается лишь оплатить</p>
                            <p class="lead">&triangleright; Без номера договора</p>
                            <a class="btn btn-outline-success" href="/user/utilities">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5">
                            <img width="300" height="300" src="/img/utils.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Оплата мобильной связи</h2>
                            <h3><span class="text-muted">Все очень просто</span></h3>
                            <p class="lead">&triangleright; Оплата по номеру телефона</p>
                            <p class="lead">&triangleright; Без указания оператора</p>
                            <a class="btn btn-outline-success" href="/user/payMobile">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img width="300" height="300" src="/img/phone.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Кредит</h2>
                            <h3><span class="text-muted">Не хватает денег?</span></h3>
                            <p class="lead">&triangleright; Кредит без договоров</p>
                            <p class="lead">&triangleright; До 5 000 белорусских рублей</p>
                            <p class="lead">&triangleright; Под 20% годовых</p>
                            <a class="btn btn-outline-success" href="/user/credit">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5">
                            <img width="270" height="270" src="/img/credit.png">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Копилка</h2>
                            <h3><span class="text-muted">Не получается накопить на мечту?</span></h3>
                            <p class="lead">&triangleright; Накопление до 10 000 белорусских рублей</p>
                            <p class="lead">&triangleright; Возможность разбить копилку в любое время</p>
                            <p class="lead">&triangleright; Абсолютно бесплатно</p>
                            <a class="btn btn-outline-success" href="/user/piggiBank">Перейти &raquo;</a>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img width="330" height="330" src="/img/piggiBank.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <footer class="container">
                        <p class="text-muted">&copy; 2017 «СтатусБанк»</p>
                        <p class="text-muted">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
                    </footer>
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