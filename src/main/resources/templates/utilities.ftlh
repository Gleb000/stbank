<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div>
            <h3 class="font-italic">${lastName} ${firstName} ${patronymic}</h3>
        </div>
        <div class="card-columns py-4">
            <div class="card" style="width: 18rem;">
                <img src="/img/water.png" class="card-img-top" alt="water">
                <div class="card-body">
                    <p class="card-text">Оплата за воду.</p>
                    <p class="card-text">К оплате ${water} BYN</p>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="/img/electr.jpg" class="card-img-top" alt="electr">
                <div class="card-body">
                    <p class="card-text">Оплата за электричество.</p>
                    <p class="card-text">К оплате ${electr} BYN</p>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="/img/gas.png" class="card-img-top" alt="gas">
                <div class="card-body">
                    <p class="card-text">Оплата за газ.</p>
                    <p class="card-text">К оплате ${gas} BYN</p>
                </div>
            </div>
        </div>
        <div class="card text-center py-4">
            <div class="card-header">
                Оплата коммунальных услуг
            </div>
            <div class="card-body">
                <div>
                    <h5 class="card-title">Ваша общая сумма выплаты составляет ${sum} BYN</h5>
                </div>
                <div class="form-group-row py-2">
                    <p class="card-text">Аккаунт: ${lastName} ${firstName}</p>
                    <p class="card-text">Счет для оплаты: ${bankAcc}</p>
                    <p class="card-text">Сумма на счету: ${userMoney} BYN</p>
                </div>
                <#if moneyError??>
                    <div class="alert alert-danger" role="alert">
                        ${moneyError}
                    </div>
                    <div class="py-3">
                        <button class="btn btn-success" disabled type="submit">Оплатить ${sum} BYN</button>
                    </div>
                    <#else>
                        <div class="py-3">
                            <button class="btn btn-success" type="submit">Оплатить ${sum} BYN</button>
                        </div>
                </#if>
            </div>
        </div>
        <div class="py-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>