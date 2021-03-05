<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <div class="form-group row">
            <label class="col-sm-3 col-form-label-lg">Пользователь:</label>
            <div class="col-sm-9">
                <label class="col-form-label-lg">${lastName} </label>
                <label class="col-form-label-lg">${firstName} </label>
                <label class="col-form-label-lg">${patronymic}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label-lg">Счет в банке:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${userAcc}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label-lg">Сумма на счету:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${userMoney}</label>
            </div>
        </div>
        <#if piggiBank??>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label-lg">Статус копилки:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">Открыта</label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label-lg">Денег накоплено:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">${piggiMoney}</label>
                </div>
            </div>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/piggiBankInfo" class="btn btn-success" aria-pressed="true">Информация о копилке</a></label>
            </div>
        <#else>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label-lg">Статус копилки:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">Закрыта</label>
                </div>
            </div>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/addPiggiBank" class="btn btn-success" aria-pressed="true">Открыть копилку</a></label>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>