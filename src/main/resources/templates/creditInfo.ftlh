<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Оформлено на пользователя:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${lastName} </label>
                <label class="col-form-label-lg">${firstName} </label>
                <label class="col-form-label-lg">${patronymic}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Счет пользователя:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${bankAccount}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${userMoney}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Кредит на сумму:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${credit}</label>
            </div>
            <label class="col-sm-4 col-form-label-lg">Выплачено:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${paidOut}</label>
            </div>
        </div>
        <#if percent20??>
            <div class="progress" style="height: 40px;">
                <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <#else>
            <#if percent40??>
                <div class="progress" style="height: 40px;">
                    <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <#else>
                <#if percent60??>
                    <div class="progress" style="height: 40px;">
                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <#else>
                    <#if percent80??>
                        <div class="progress" style="height: 40px;">
                            <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <#else>
                            <div class="progress" style="height: 40px;">
                                <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                    </#if>
                </#if>
            </#if>
        </#if>
        <label class="col-sm-6 col-form-label-lg"><a href="/user/payCredit" class="btn btn-success" aria-pressed="true">Выплатить кредит</a></label>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>