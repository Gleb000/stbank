<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Банковский счет:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${BYN}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${moneyBYN} BYN</label>
            </div>
        </div>
        <div class="form-group row">
            <div class="container">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label-lg ">Сумма конвертации:</label>
                    <div class="col-sm-6">
                        <input type="number" name="money" value="0"
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
                <button class="btn btn-lg btn-success" type="submit">Конвертировать в USD</button>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </div>
    </form>
</@c.page>