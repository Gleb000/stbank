<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="container">
            <h3 class="font-italic">${lastName} ${firstName} ${patronymic}</h3>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg ">Счет пользователя:</label>
                <label class="col-sm-8 col-form-label-lg ">${bankAcc}</label>
                <label class="col-sm-4 col-form-label-lg ">Сумма на счету:</label>
                <label class="col-sm-8 col-form-label-lg ">${bankMoney} BYN</label>
            </div>
            <div class="form-group row">
                <label for="inLineForm" class="col-sm-4 col-form-label-lg">Мобильный телефон</label>
                <div class="col-sm-5">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">+375</div>
                        </div>
                        <input type="text" name="phoneNumber" value="" id="inLineForm" placeholder="29 123-45-67"
                               class="form-control form-control-lg ${(phoneError??)?string('is-invalid', '')}"/>
                        <#if phoneError??>
                            <div class="invalid-feedback">
                                ${phoneError}
                            </div>
                        </#if>
                    </div>
                </div>
                <label class="col-sm-4 col-form-label-lg ">Сумма пополнения:</label>
                <div class="col-sm-5">
                    <input type="number" name="money" placeholder="BYN"
                           class="form-control form-control-lg ${(moneyError??)?string('is-invalid', '')}"/>
                    <#if moneyError??>
                        <div class="invalid-feedback">
                            ${moneyError}
                        </div>
                    </#if>
                </div>
            </div>
        </div>
        <div>
            <button class="btn btn-lg btn-success" type="submit">Пополнить</button>
            <a class="btn btn-lg btn-success" href="/user/internetBanking">Назад</a>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>