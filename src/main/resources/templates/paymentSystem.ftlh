<#import "parts/common.ftlh" as c>

<@c.page>
<form method="get">
    <#if !userFirstName??>
        <div class="form-group-row">
            <label class="col-sm-6 col-form-label-lg"><a href="/user/refillAcc" class="badge badge-success" data-toggle="modal" data-target="#ModalWindow3" aria-pressed="true">Пополнение счета</a></label>
        </div>
    <#else>
        <#if !bankAccount??>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/refillAcc" class="badge badge-success" data-toggle="modal" data-target="#ModalWindow4" aria-pressed="true">Пополнение счета</a></label>
            </div>
        <#else>
            <div class="form-group-row">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label-lg">Банковский счет:</label>
                    <div class="col-sm-6">
                        <#if bankAccount??><label class="col-form-label-lg">${bankAccount}</label><#else><label class="col-form-label-lg">Счет не оформлен</label></#if>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
                    <div class="col-sm-6">
                        <#if userAccMoney??><label class="col-form-label-lg">${userAccMoney} BYN</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
                    </div>
                </div>
                <label class="col-sm-6 col-form-label-lg"><a href="/user/refillAcc" class="badge badge-success" aria-pressed="true">Пополнение счета</a></label>
            </div>
        </#if>
    </#if>
    <#if !userFirstName??>
        <div class="form-group-row">
            <label class="col-sm-6 col-form-label-lg"><a href="/user/transferMoney" class="badge badge-success" data-toggle="modal" data-target="#ModalWindow3" aria-pressed="true">Перевод средств на другой счет</a></label>
        </div>
    <#else>
        <#if !bankAccount??>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/transferMoney" class="badge badge-success" data-toggle="modal" data-target="#ModalWindow4" aria-pressed="true">Перевод средств на другой счет</a></label>
            </div>
        <#else>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/transferMoney" class="badge badge-success" aria-pressed="true">Перевод средств на другой счет</a></label>
            </div>
        </#if>
    </#if>
    <div class="col-sm-8">
        <div class="modal fade" id="ModalWindow3" tabindex="-1" role="dialog" aria-labelledby="ModalWindow3" aria-hidden="true">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="model-title" id="modalCenterTitle">Предупреждение</h3>
                </div>
                <div class="modal-body">
                    <label class="col-form-label-lg">
                        У вашего профиля не заполнена информация о пользователе,
                        не указав ее вы не сможете совершать большинство операций на сайте,
                        перейдите по ссылке и заполните профиль
                    </label>
                </div>
                <div class="modal-footer">
                    <a href="/user/addUserInfo" class="btn btn-lg btn-success" role="button" aria-pressed="true">Заполнить профиль</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="modal fade" id="ModalWindow4" tabindex="-1" role="dialog" aria-labelledby="ModalWindow4" aria-hidden="true">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="model-title" id="modalCenterTitle">Предупреждение</h3>
                </div>
                <div class="modal-body">
                    <label class="col-form-label-lg">
                        На ваше имя не оформлен счет,
                        не оформив его вы не сможете совершать большинство операций на сайте,
                        перейдите по ссылке и оформите счет
                    </label>
                </div>
                <div class="modal-footer">
                    <a href="/user/addAccInfo" class="btn btn-lg btn-success" role="button" aria-pressed="true">Оформить счет</a>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</@c.page>