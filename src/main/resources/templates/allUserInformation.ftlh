<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="get">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Логин:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${userName}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Пароль:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">Информация скрыта в целях безопасности</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Адрес электронной почты:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">${gmail}</label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Статус:</label>
            <div class="col-sm-6">
                <label class="col-form-label-lg">Пользователь банка</label>
            </div>
        </div>
        <div class="form-group-row">
            <label class="col-sm-6 col-form-label-lg"><a href="/user/profile" class="badge badge-success" aria-pressed="true">Изменить информацию об аккаунте</a></label>
        </div>
        <#if !userFirstName??>
        <div class="form-group-row">
            <label class="col-sm-6 col-form-label-lg"><a href="/user/userInfo" class="badge badge-success" data-toggle="modal" data-target="#ModalWindow" aria-pressed="true">Информация о пользователе</a></label>
        </div>
        <#else>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/userInfo" class="badge badge-success" aria-pressed="true">Информация о пользователе</a></label>
            </div>
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
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>