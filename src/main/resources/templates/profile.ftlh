<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    ${message!}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Пароль:</label>
            <div class="col-sm-6">
                <label>
                    <input type="password" name="password" class="form-control form-control-lg" placeholder="Новый пароль" />
                </label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Адрес электронной почты:</label>
            <div class="col-sm-6">
                <label>
                    <input type="email" name="email" class="form-control form-control-lg" placeholder="some@some.com" value="${email!''}" />
                </label>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-lg btn-success" type="submit">Сохранить</button>
    </form>
</@c.page>