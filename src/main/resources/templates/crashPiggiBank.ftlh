<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="container">
            <h3 class="font-italic">${lastName} ${firstName} ${patronymic}</h3>
            <div class="form-group row py-4">
                <label class="col-sm-5 col-form-label-lg">Название копилки:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">${piggiName}</label>
                </div>
                <label class="col-sm-5 col-form-label-lg">Все накопленные средства будут перечислены на счет:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">${bankAcc}</label>
                </div>
                <label class="col-sm-5 col-form-label-lg">После разбития копилки вам будет начислено:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">${piggiBankMoney} BYN</label>
                </div>
                <label class="col-sm-5 col-form-label-lg">Сумма после начисления:</label>
                <div class="col-sm-7">
                    <label class="col-form-label-lg">${allMoney} BYN</label>
                </div>
            </div>
            <div class="col-sm-10">
                <button class="btn btn-lg btn-success col-sm-2" type="submit">Разбить</button>
                <a class="btn btn-lg btn-success text-white col-sm-2" href="/user/piggiBankInfo">Назад</a>
            </div>
            <div class="py-5">
                <p class="card-text text-secondary">2017 «СтатусБанк»</p>
                <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>