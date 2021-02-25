<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-1"><label class="col-sm-4 col-form-label-lg">Создание аккаунта</label></div>
    ${message!}
    <@l.login "/registration" true />
</@c.page>