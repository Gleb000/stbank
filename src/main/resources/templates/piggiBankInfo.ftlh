<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <h3 class="font-italic">${lastName} ${firstName} ${patronymic}</h3>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Счет пользователя:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${bankAcc}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Сумма на счету:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${userMoney}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Название копилки:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${piggiName}</label>
            </div>
            <label class="col-sm-4 col-form-label-lg">Накоплено:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${piggiBankMoney}</label>
            </div>
        </div>
        <label class="col-sm-6 col-form-label-lg"><a href="#" class="badge badge-success" aria-pressed="true">Пополнить копилку</a></label>
        <label class="col-sm-6 col-form-label-lg"><a href="#" class="badge badge-success" aria-pressed="true">Разбить копилку</a></label>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>