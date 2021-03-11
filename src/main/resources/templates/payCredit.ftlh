<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <label class="col-sm-5 col-form-label-lg">Информация о кредите:</label>
        <div class="form-group row">
            <label class="col-sm-5 col-form-label-lg">Сумма кредита:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${credit} </label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-5 col-form-label-lg">Выплачено:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${paidOut} </label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg ">Сумма погашения:</label>
            <div class="col-sm-6">
                <input type="text" name="money" placeholder="BYN" value="${leftToPay}"
                       class="form-control form-control-lg ${(moneyError??)?string('is-invalid', '')}"/>
                <#if moneyError??>
                    <div class="invalid-feedback">
                        ${moneyError}
                    </div>
                </#if>
            </div>
        </div>
        <div>
            <button class="btn btn-lg btn-success" type="submit">Выплатить</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>