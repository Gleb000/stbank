<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <#if userFirstName??>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label-lg">Пользователь:</label>
                <div class="col-sm-10">
                    <label class="col-form-label-lg">${userLastName} </label>
                    <label class="col-form-label-lg">${userFirstName} </label>
                    <label class="col-form-label-lg">${userPatronymic}</label>
                </div>
            </div>
            <#if bankAccount??>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label-lg">Счет в банке:</label>
                    <div class="col-sm-8">
                        <label class="col-form-label-lg">${bankAccount}</label>
                    </div>
                </div>
            <#else>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label-lg">Не оформлен счет на ваше имя!</label>
                    <label class="col-sm-6 col-form-label-lg"><a href="/user/addUserInfo" class="btn btn-success" aria-pressed="true">Оформить</a></label>
                </div>
            </#if>
        <#else>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Нет информации о пользователе!</label>
                <label class="col-sm-6 col-form-label-lg"><a href="/user/addUserInfo" class="btn btn-success" aria-pressed="true">Заполнить</a></label>
            </div>
        </#if>
        <#if !userFirstName??>
            <div class="form-group-row">
                <a href="/user/addCredit" class="btn btn-success" data-toggle="modal" data-target="#ModalWindow" aria-pressed="true">Оформить кредит</a>
                <a href="/user/internetBanking" class="btn btn-success" aria-pressed="true">Назад</a>
            </div>
        <#else>
            <#if !bankAccount??>
                <div class="form-group-row">
                    <a href="/user/addCredit" class="btn btn-success" data-toggle="modal" data-target="#ModalWindow2" aria-pressed="true">Оформить кредит</a>
                    <a href="/user/internetBanking" class="btn btn-success" aria-pressed="true">Назад</a>
                </div>
            <#else>
                <#if !creditSum??>
                <div class="form-group-row">
                    <a href="/user/addCredit" class="btn btn-success" aria-pressed="true">Оформить кредит</a>
                    <a href="/user/internetBanking" class="btn btn-success" aria-pressed="true">Назад</a>
                </div>
                <#else>
                    <div class="form-group-row">
                        <a href="/user/creditInfo" class="btn btn-success" aria-pressed="true">Информация о кредите</a>
                        <a href="/user/internetBanking" class="btn btn-success" aria-pressed="true">Назад</a>
                    </div>
                </#if>
            </#if>
            <div class="col-sm-8">
                <div class="modal fade" id="ModalWindow" tabindex="-1" role="dialog" aria-labelledby="ModalWindow" aria-hidden="true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="model-title" id="modalCenterTitle">Предупреждение</h3>
                        </div>
                        <div class="modal-body">
                            <label class="col-form-label-lg">
                                У вашего профиля не заполнена информация о пользователе,
                                не указав ее вы не сможете совершать большинство операций на сайте,
                                перейдите по ссылке и заполните профиль
                            </label>
                        </div>
                        <div class="modal-footer">
                            <a href="/user/addUserInfo" class="btn btn-lg btn-success" role="button" aria-pressed="true">Заполнить профиль</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="modal fade" id="ModalWindow2" tabindex="-1" role="dialog" aria-labelledby="ModalWindow2" aria-hidden="true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="model-title" id="modalCenterTitle">Предупреждение</h3>
                        </div>
                        <div class="modal-body">
                            <label class="col-form-label-lg">
                                На ваше имя не оформлен счет,
                                не оформив его вы не сможете совершать большинство операций на сайте,
                                перейдите по ссылке и оформите счет
                            </label>
                        </div>
                        <div class="modal-footer">
                            <a href="/user/addAccInfo" class="btn btn-lg btn-success" role="button" aria-pressed="true">Оформить счет</a>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>