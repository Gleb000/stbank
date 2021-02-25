<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label-lg ">Оформив счет вы получите следующие преимущества:</label>
                <label class="col-sm-10 col-form-label-lg ">1) Отражение всех операций в документах;</label>
                <label class="col-sm-10 col-form-label-lg ">2) Защита от получения поддельных купюр или ошибок продавца;</label>
                <label class="col-sm-10 col-form-label-lg ">3) Снижение риска кражи средств;</label>
                <label class="col-sm-10 col-form-label-lg ">4) Снижение потерь времени на посещение банковской структуры;</label>
                <label class="col-sm-10 col-form-label-lg ">4) Возможность более удобной оплаты в других странах или иностранных сервисах;</label>
                <label class="col-sm-10 col-form-label-lg ">5) Оформление банковских карт в иностранной валюте.</label>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Оформить в EUR</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>