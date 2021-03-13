<#import "parts/login.ftlh" as l>
<#include "parts/security.ftlh">
<#import "parts/common.ftlh" as c>

<@c.page>
    <header class="site-header sticky-top py-1">
        <nav class="container d-flex flex-column flex-md-row">
            <a class="py-2 px-5 mx-3" href="/" aria-label="Product">
                <img width="26" height="26" src="/img/logo.png">
            </a>
            <#if user??>
                <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/user/internetBanking">Интернет банкинг</a>
                <a class="py-2 d-none d-md-inline-block" href="/user/userInfo">Профиль</a>
            <#else>
                <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/login">Интернет банкинг</a>
                <a class="py-2 d-none d-md-inline-block" href="/login">Профиль</a>
            </#if>
            <a class="py-2 px-5 mx-3 d-none d-md-inline-block" href="/bankInfo">О Банке</a>
            <li class="nav-item dropdown d-none d-md-inline-block">
                <a class="px-5 mx-4 nav-link dropdown-toggle" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Профиль
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item" href="/user/allUserInformation">Информация об аккаунте</a></li>
                    <li><a class="dropdown-item" href="/user/profile">Редактировать аккаунт</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <div class="px-1">
                        <@l.logout />
                    </div>
                </ul>
            </li>
        </nav>
    </header>

    <main>
        <div class="container py-3">
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col col-lg-12">
                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Статусбанк</h2>
                            <p class="lead">
                                ОАО «СтатусБанк» - один из самых динамично развивающихся банков Республики Беларусь,
                                который целенаправленно осваивает современные банковские технологии, обладает устойчивой
                                ресурсной базой и способен оперативно решать ваши самые насущные финансовые вопросы.
                                Мы благодарим Вас за доверие и надеемся на успешное, плодотворное и взаимовыгодное сотрудничество.
                                Мы работаем для того, чтобы ОАО «СтатусБанк» стал для вас надежным, удобным и умным финансовым
                                партнером на долгие годы.
                            </p>
                        </div>
                        <div class="col-md-5">
                            <img width="360" height="300" src="/img/oBanke1.png">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Наш банк</h2>
                            <p class="lead">
                                Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.
                                Дата принятия решения о государственной регистрации банка 25.02.2002 г.
                                Лицензия Национального банка Республики Беларусь на осуществление банковской деятельности №26 от 21 декабря 2016 г.
                                Лицензия №02200/5200-12-1134 на право осуществления профессиональной и биржевой деятельности по ценным бумагам от 29 ноября 2012 г.
                                Лицензии и устав Органы управления раскрытие информации.
                            </p>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img width="380" height="310" src="/img/oBanke2.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">О банке</h2>
                            <h4 class="text-muted">Реквизиты</h4>
                            <p class="lead">
                                ОАО «СтатусБанк», БИК (BIC SWIFT): IRJSBY22 , УНП – 807000043, к/с BY72 NBRB 3200 0073 5001 3000 0000 в Национальном Банке Республики Беларусь.
                            </p>
                            <h4 class="text-muted">Адрес</h4>
                            <p class="lead">
                                ул. Денисовская, 8А, 220006, Минск, Беларусь.
                            </p>
                        </div>
                        <div class="col-md-5">
                            <img width="250" height="250" src="/img/oBanke3.png">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Наша миссия</h2>
                            <p class="lead">
                                Удовлетворение потребностей наших клиентов в современных, доступных и качественных банковских услугах,
                                содействие успеху в достижении целей и предоставление широкого спектра финансовых инструментов предприятиям
                                всех форм собственности на базе клиентоориентированной, высокоэффективной, динамично развивающейся бизнес - модели,
                                современных информационных технологий и высоких стандартов обслуживания.
                            </p>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img width="380" height="280" src="/img/oBanke4.jpg">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-12">
                            <h2 class="featurette-heading">История банка</h2>
                            <p class="lead">
                                ОАО «СтатусБанк» (ОАО «Международный резервный банк» – с 25.02.2002 по 20.01.2013,
                                ОАО «Евроторгинвестбанк» – с 21.01.2013 по 25.05.2017) (г. Минск) создано в 2002 году для обслуживания корпоративных клиентов -
                                резидентов свободной экономической зоны «Минск» и нерезидентов Республики Беларусь, - а также частных клиентов -
                                нерезидентов Республики Беларусь. За время работы на белорусском рынке Банк приобрел имидж надежного делового партнера,
                                который оказывает своим клиентам финансовые услуги на самом высоком уровне,
                                оперативно реагирует на все изменения банковского рынка и постоянно совершенствует и расширяет спектр предлагаемых продуктов.
                                В конце 2007 года была разработана и принята новая стратегия развития, которая предусматривала поэтапный переход Банка в разряд универсальных.
                                Сегодня, продолжая работать в направлении обслуживания юридических лиц и индивидуальных предпринимателей,
                                Банк активно развивает розничный бизнес, делая акцент на широкой линейке кредитных продуктов,
                                разнообразных инструментах выдачи кредитов, развитии сети отделений и точек продаж.
                                С 2012 года основным акционером Банка является ООО "Евроторг «(владелец сети магазинов розничной торговли»Евроопт").
                                Кадровая политика ОАО "СтатусБанк" направлена на формирование команды профессионалов,
                                способных быстро и качественно решать стоящие перед банком задачи.
                                26 мая 2017 года Банк переименован в ОАО «СтатусБанк».
                            </p>
                        </div>
                    </div>

                    <hr class="featurette-divider">
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
        <div class="container py-3">
            <div class="row">
                <div class="col col-lg-4">
                    <img width="300" height="260" src="/img/RSB.png">
                </div>
                <div class="col col-lg-4">
                    <img width="300" height="260" src="/img/VUS.png">
                </div>
                <div class="col col-lg-4">
                    <img width="300" height="260" src="/img/IPiU.png">
                </div>
            </div>
        </div>
        <div class="container py-3">
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col col-lg-12">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-liz">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                    Перечень лицензий:
                                </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-liz" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <p class="font-italic">
                                        &squarf; Лицензия Национального банка Республики Беларусь на осуществление банковской деятельности №26 от 25 мая 2017 г.
                                    </p>
                                    <p class="font-italic">
                                        &squarf; Лицензия №02200/5200-12-1134 на право осуществления профессиональной и биржевой деятельности по ценным бумагам от 15 июня 2017 г.
                                    </p>
                                    <p class="font-italic">
                                        &squarf; Свидетельство о принятии на учет в государственном учреждении «Агентство по гарантированному возмещению банковских вкладов (депозитов) физических лиц»
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-bankOper">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                    Перечень банковских операций в соответствии с лицензией:
                                </button>
                            </h2>
                            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-bankOper" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <p class="font-italic">
                                        &triangleright; привлечение денежных средств физических и юридических лиц на счета и во вклады (депозиты);
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; размещение привлеченных денежных средств физических и юридических лиц на счета и во вклады (депозиты) от своего имени и за свой счет на условиях возвратности, платности и срочности;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; открытие и ведение банковских счетов физических и юридических лиц;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; осуществление расчетного и кассового обслуживания физических и юридических лиц, в том числе банков-корреспондентов;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; валютно-обменные операции;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; выдача банковских гарантий;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; доверительное управление денежными средствами по договору доверительного управления денежными средствами;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; выпуск в обращение (эмиссия) банковских платежных карточек;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; выпуск в обращение (эмиссия) электронных денег;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; выдача ценных бумаг, подтверждающих привлечение денежных средств во вклады (депозиты) и размещение их на счета;
                                    </p>
                                    <p class="font-italic">
                                        &triangleright; финансирование под уступку денежного требования (факторинг).
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-fond">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThird" aria-expanded="false" aria-controls="flush-collapseThird">
                                    Уставной фонд:
                                </button>
                            </h2>
                            <div id="flush-collapseThird" class="accordion-collapse collapse" aria-labelledby="flush-fond" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <p class="font-italic">
                                        Уставный фонд Банка составляет 43 000 000 (Cорок три миллиона) белорусских рублей 10 (Десять) белорусских копеек.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
        <div class="container py-3">
            <hr class="featurette-divider">
        </div>
        <footer class="container">
            <p class="text-muted">&copy; 2017 «СтатусБанк»</p>
            <p class="text-muted">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </footer>
    </main>
</@c.page>