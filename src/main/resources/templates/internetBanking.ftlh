<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <#if firstName??>
            <h3 class="font-italic">${lastName} ${firstName} ${patronymic}</h3>
            <#if userBankAcc??>
                <div>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active text-success" id="BYN-tab" data-toggle="tab" href="#BYN" role="tab" aria-controls="BYN" aria-selected="true">Счет в белорусских рублях</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success" id="USD-tab" data-toggle="tab" href="#USD" role="tab" aria-controls="USD" aria-selected="false">Счет в долларах</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-success" id="EUR-tab" data-toggle="tab" href="#EUR" role="tab" aria-controls="EUR" aria-selected="false">Счет в евро</a>
                        </li>
                        <#if creditSum??>
                            <li class="nav-item">
                                <a class="nav-link text-success" id="credit-tab" data-toggle="tab" href="#credit" role="tab" aria-controls="credit" aria-selected="false">Информация о кредите</a>
                            </li>
                        </#if>
                        <#if piggiName??>
                            <li class="nav-item">
                                <a class="nav-link text-success" id="piggi-tab" data-toggle="tab" href="#piggi" role="tab" aria-controls="piggi" aria-selected="false">Информация о копилке</a>
                            </li>
                        </#if>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="BYN" role="tabpanel" aria-labelledby="BYN-tab">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label-lg">Банковский счет:</label>
                                <div class="col-sm-6">
                                    <#if userBankAcc??><label class="col-form-label-lg">${userBankAcc}</label><#else><label class="col-form-label-lg">Счет не оформлен</label></#if>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
                                <div class="col-sm-6">
                                    <#if userAccMoney??><label class="col-form-label-lg">${userAccMoney} BYN</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="USD" role="tabpanel" aria-labelledby="USD-tab">
                            <#if bankAccountUSD??>
                                <div class="tab-pane fade show active" id="BYN" role="tabpanel" aria-labelledby="BYN-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Банковский счет в валюте USD:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${bankAccountUSD}</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${userAccMoneyUSD} USD</label>
                                        </div>
                                    </div>
                                </div>
                            <#else>
                                <label class="col-sm-4 col-form-label-lg">Счет в валюте "USD" не оформлен</label>
                                <a href="/user/addAccInfoUSD" class="btn btn-lg btn-success">Оформить</a>
                            </#if>
                        </div>
                        <div class="tab-pane fade" id="EUR" role="tabpanel" aria-labelledby="EUR-tab">
                            <#if bankAccountEUR??>
                                <div class="tab-pane fade show active" id="BYN" role="tabpanel" aria-labelledby="BYN-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Банковский счет в валюте EUR:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${bankAccountEUR}</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${userAccMoneyEUR} EUR</label>
                                        </div>
                                    </div>
                                </div>
                            <#else>
                                <label class="col-sm-4 col-form-label-lg">Счет в валюте "EUR" не оформлен</label>
                                <a href="/user/addAccInfoEUR" class="btn btn-lg btn-success">Оформить</a>
                            </#if>
                        </div>
                        <#if creditSum??>
                            <div class="tab-pane fade" id="credit" role="tabpanel" aria-labelledby="credit-tab">
                                <div class="tab-pane fade show active" id="BYN" role="tabpanel" aria-labelledby="BYN-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Сумма кредита:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${creditSum} BYN</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Выплачено:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${paidOut} BYN</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#if>
                        <#if piggiName??>
                            <div class="tab-pane fade" id="piggi" role="tabpanel" aria-labelledby="piggi-tab">
                                <div class="tab-pane fade show active" id="BYN" role="tabpanel" aria-labelledby="BYN-tab">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Название копилки:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${piggiName}</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label-lg">Накоплено:</label>
                                        <div class="col-sm-6">
                                            <label class="col-form-label-lg">${piggiMoney} BYN</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="py-3">
                    <label class="col-form-label-lg">Конвертация валюты между счетами:</label>
                    <#if userBankAcc?? && bankAccountUSD?? && bankAccountEUR??>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a class="text-success" href="/user/BYNtoUSD">BYN -> USD</a></li>
                                <li class="breadcrumb-item"><a class="text-success" href="/user/BYNtoEUR">BYN -> EUR</a></li>
                                <li class="breadcrumb-item"><a class="text-success" href="/user/USDtoBYN">USD -> BYN</a></li>
                                <li class="breadcrumb-item"><a class="text-success" href="/user/EURtoBYN">EUR -> BYN</a></li>
                            </ol>
                        </nav>
                        <#else>
                        <#if userBankAcc?? && bankAccountUSD?? && !bankAccountEUR??>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a class="text-success" href="/user/BYNtoUSD">BYN -> USD</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">BYN -> EUR</li>
                                    <li class="breadcrumb-item"><a class="text-success" href="/user/USDtoBYN">USD -> BYN</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">EUR -> BYN</li>
                                </ol>
                            </nav>
                            <#else>
                            <#if userBankAcc?? && bankAccountEUR?? && !bankAccountUSD??>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">BYN -> USD</li>
                                        <li class="breadcrumb-item"><a class="text-success" href="/user/BYNtoEUR">BYN -> EUR</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">USD -> BYN</li>
                                        <li class="breadcrumb-item"><a class="text-success" href="/user/EURtoBYN">EUR -> BYN</a></li>
                                    </ol>
                                </nav>
                                <#else>
                                <#if userBankAcc?? && !bankAccountUSD?? && !bankAccountEUR??>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item active" aria-current="page">BYN -> USD</li>
                                            <li class="breadcrumb-item active" aria-current="page">BYN -> EUR</li>
                                            <li class="breadcrumb-item active" aria-current="page">USD -> BYN</li>
                                            <li class="breadcrumb-item active" aria-current="page">EUR -> BYN</li>
                                        </ol>
                                    </nav>
                                    <#else>
                                    <label class="text-dander">Конвертация недоступна, оформите счет!</label>
                                </#if>
                            </#if>
                        </#if>
                    </#if>
                </div>
                <div class="card-columns py-4">
                    <div class="card" style="width: 19rem;">
                        <img src="/img/refill.png" class="card-img-top" alt="refill">
                        <div class="card-body">
                            <h5 class="card-title">Пополнение</h5>
                            <p class="card-text">Пополнение своего счета в несколько шагов</p>
                            <a href="/user/refillAcc" class="btn btn-success">Пополнить</a>
                        </div>
                    </div>
                    <div class="card" style="width: 19rem;">
                        <img src="/img/transfer.jpg" class="card-img-top" alt="transfer">
                        <div class="card-body">
                            <h5 class="card-title">Перевод</h5>
                            <p class="card-text">Перевод средств со своего счета на счет другого клиента банка</p>
                            <a href="/user/transferMoney" class="btn btn-success">Перевести</a>
                        </div>
                    </div>
                    <div class="card" style="width: 19rem;">
                        <img src="/img/utils.jpg" class="card-img-top" alt="utilities">
                        <div class="card-body">
                            <h5 class="card-title">Коммунальные услуги</h5>
                            <p class="card-text">Оплата коммунальных услуг (вода, электричество, газ)</p>
                            <a href="/user/utilities" class="btn btn-success">Оплатить</a>
                        </div>
                    </div>
                </div>
                <div class="card-columns py-4">
                    <div class="card" style="width: 19rem;">
                        <img src="/img/phone.jpg" class="card-img-top" alt="phone">
                        <div class="card-body">
                            <h5 class="card-title">Телефон</h5>
                            <p class="card-text">Оплата за телефонное соединение без указания оператора</p>
                            <a href="#" class="btn btn-success">Оплатить</a>
                        </div>
                    </div>
                    <div class="card" style="width: 19rem;">
                        <img src="/img/credit.png" class="card-img-top" alt="credit">
                        <div class="card-body">
                            <h5 class="card-title">Кредит</h5>
                            <p class="card-text">Быстрое оформление кредита на ваш счет</p>
                            <a href="/user/credit" class="btn btn-success">Подробнее</a>
                        </div>
                    </div>
                    <div class="card" style="width: 19rem;">
                        <img src="/img/piggiBank.jpg" class="card-img-top" alt="piggiBank">
                        <div class="card-body">
                            <h5 class="card-title">Копилка</h5>
                            <p class="card-text">Открытие копилки для удобного хранения и накопления средств</p>
                            <a href="/user/piggiBank" class="btn btn-success">Подробнее</a>
                        </div>
                    </div>
                </div>
                <div class="py-5">
                    <p class="card-text text-secondary">2017 «СтатусБанк»</p>
                    <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
                </div>
            <#else>
                <div>
                    <label class="col-sm-4 col-form-label-lg">Счет на ваше имя не оформлен</label>
                    <a href="/user/addAccInfo" class="btn btn-lg btn-success">Оформить</a>
                </div>
            </#if>
            <#else>
                <div>
                    <label class="col-sm-4 col-form-label-lg">Ваш профиль не заполнен</label>
                    <a href="/user/addUserInfo" class="btn btn-lg btn-success">Заполнить</a>
                </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>