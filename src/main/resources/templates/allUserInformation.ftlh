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
            <label class="col-sm-6 col-form-label-lg"><a href="/user/profile" class="btn btn-success" aria-pressed="true">Изменить информацию об аккаунте</a></label>
        </div>
        <#if !userFirstName??>
        <div class="form-group-row">
            <label class="col-sm-6 col-form-label-lg"><a href="/user/userInfo" class="btn btn-success" data-toggle="modal" data-target="#ModalWindow" aria-pressed="true">Информация о пользователе</a></label>
        </div>
        <#else>
            <div class="form-group-row">
                <label class="col-sm-6 col-form-label-lg"><a href="/user/userInfo" class="btn btn-success" aria-pressed="true">Информация о пользователе</a></label>
            </div>
        </#if>
        <div class="modal fade" id="ModalWindow" tabindex="-1" aria-labelledby="ModalWindow" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Предупреждение</h5>
                        <a class="btn btn-lg text-dark" type="button" href="/">&times;</a>
                    </div>
                    <div class="modal-body">
                        У вашего профиля не заполнена информация о пользователе,
                        не указав ее вы не сможете совершать большинство операций на сайте,
                        перейдите по ссылке и заполните профиль
                    </div>
                    <div class="modal-footer">
                        <a href="/user/addUserInfo" class="btn btn-success" role="button" aria-pressed="true">Заполнить профиль</a>
                        <a href="/" class="btn btn-success" role="button" aria-pressed="true">Позже</a>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>