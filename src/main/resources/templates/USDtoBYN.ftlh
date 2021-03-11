<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Банковский счет в валюте USD:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${USD}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${moneyUSD} USD</label>
            </div>
        </div>
        <div class="form-group row">
            <div class="container">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label-lg ">Сумма конвертации:</label>
                    <div class="col-sm-6">
                        <input type="text" name="money" placeholder="USD"
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
                <button class="btn btn-lg btn-success" type="submit">Конвертировать в BYN</button>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </div>
    </form>
</@c.page>