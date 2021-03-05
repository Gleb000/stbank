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
        <div class="form-group row py-4">
            <label class="col-sm-4 col-form-label-lg">Название копилки:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${piggiName}</label>
            </div>
            <label class="col-sm-4 col-form-label-lg">Накоплено:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${piggiBankMoney}</label>
            </div>
            <label class="col-sm-4 col-form-label-lg">Дата конца накопления:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${date}</label>
            </div>
            <label class="col-sm-4 col-form-label-lg">Цель накопления:</label>
            <div class="col-sm-8">
                <label class="col-form-label-lg">${money}</label>
            </div>
        </div>
        <label class="col-sm-6 col-form-label-lg"><a href="/user/topUpPiggiBank" class="btn btn-success" aria-pressed="true">Пополнить копилку</a></label>
        <label class="col-sm-6 col-form-label-lg"><a href="#" class="btn btn-success" aria-pressed="true">Разбить копилку</a></label>
        <div class="py-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>