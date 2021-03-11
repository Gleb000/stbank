<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-5 col-form-label-lg">Кредит будет оформлен на пользователя:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${lastName} </label>
                <label class="col-form-label-lg">${firstName} </label>
                <label class="col-form-label-lg">${patronymic}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-5 col-form-label-lg">На счет:</label>
            <div class="col-sm-7">
                <label class="col-form-label-lg">${bankAccount}</label>
            </div>
        </div>
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label-lg ">Оформив кредит вы:</label>
                <label class="col-sm-10 col-form-label-lg ">1) Мгновенно получите деньги на свой чет;</label>
                <label class="col-sm-10 col-form-label-lg ">2) Сможете его погасить досрочно без процентов;</label>
                <label class="col-sm-10 col-form-label-lg ">3) Не должны приносить справку о доходах.</label>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg ">Сумма кредита:</label>
                <div class="col-sm-6">
                    <input type="text" name="money" placeholder="BYN"
                           class="form-control form-control-lg ${(moneyError??)?string('is-invalid', '')}"/>
                    <#if moneyError??>
                        <div class="invalid-feedback">
                            ${moneyError}
                        </div>
                    </#if>
                </div>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Оформить</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>