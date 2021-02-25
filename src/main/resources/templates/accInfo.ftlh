<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="get">
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
                    <#if bankAccountUSD??>
                        <label class="col-sm-6 col-form-label-lg"><a href="/user/BYNtoUSD" class="badge badge-success" aria-pressed="true">Конвертировать в USD</a></label>
                    </#if>
                    <#if bankAccountEUR??>
                        <label class="col-sm-6 col-form-label-lg"><a href="/user/BYNtoEUR" class="badge badge-success" aria-pressed="true">Конвертировать в EUR</a></label>
                    </#if>
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
                            <label class="col-sm-6 col-form-label-lg"><a href="/user/USDtoBYN" class="badge badge-success" aria-pressed="true">Конвертировать в BYN</a></label>
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
                        <label class="col-sm-6 col-form-label-lg"><a href="/user/EURtoBYN" class="badge badge-success" aria-pressed="true">Конвертировать в BYN</a></label>
                    <#else>
                        <label class="col-sm-4 col-form-label-lg">Счет в валюте "EUR" не оформлен</label>
                        <a href="/user/addAccInfoEUR" class="btn btn-lg btn-success">Оформить</a>
                    </#if>
                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>