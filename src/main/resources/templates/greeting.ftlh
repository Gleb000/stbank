<#import "parts/common.ftlh" as c>

<@c.page>
    <div>
        <div id="carouselExampleIndicators" class="p-4 carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/img/carousel1.png" width="1270" height="440" alt="">
                </div>
                <div class="carousel-item">
                    <img src="/img/carousel2.png" width="1270" height="440" alt="">
                </div>
                <div class="carousel-item">
                    <img src="/img/carousel3.png" width="1270" height="440" alt="">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="card-columns p-3">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="/img/money.png" alt="">
                <div class="card-body">
                    <p class="card-text font-italic">- от 23% годовых;</p>
                    <p class="card-text font-italic">- до 5 000 рублей на срок до 3 лет;</p>
                    <p class="card-text font-italic">- до 2 000 рублей без справки о доходах;</p>
                    <p class="card-text font-italic">- предоставление кредита на банковскую карточку;</p>
                    <p class="card-text font-italic">- без залога и поручителей;</p>
                    <p class="card-text font-italic">- досрочное погашение без комиссий и ограничений.</p>
                    <a href="/user/credit" class="btn btn-success">Оформить</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="/img/fast.png" alt="">
                <div class="card-body">
                    <p class="card-text font-italic">- от 22% годовых;</p>
                    <p class="card-text font-italic">- без справки о доходах;</p>
                    <p class="card-text font-italic">- без первоначального взноса;</p>
                    <p class="card-text font-italic">- получение товара в день оформления кредита.</p>
                    <a href="/user/credit" class="btn btn-success">Оформить</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="/img/fastOnl.png" alt="">
                <div class="card-body">
                    <p class="card-text font-italic">- в онлайн-гипермаркете E-DOSTAVKA.BY на все товары в Корзине;</p>
                    <p class="card-text font-italic">- от 22% годовых;</p>
                    <p class="card-text font-italic">- до 3500 белорусских рублей;</p>
                    <p class="card-text font-italic">- без справки о доходах;</p>
                    <p class="card-text font-italic">- без первоначального взноса;</p>
                    <p class="card-text font-italic">- досрочное погашение без комиссий и ограничений.</p>
                </div>
            </div>
        </div>
        <div>
            <img src="/img/prilSTB.png" width="1110" height="500" alt="Card image">
        </div>
        <div class="p-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
    </div>
</@c.page>