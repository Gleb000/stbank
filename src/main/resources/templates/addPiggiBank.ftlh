<#import "parts/common.ftlh" as c>

<@c.page>
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-10 col-form-label-lg ">Открытие копилки:</label>
                <label class="col-sm-10 col-form-label-lg ">1) Создайте копилку со своим уникальным названием;</label>
                <label class="col-sm-10 col-form-label-lg ">2) Деньги в копилке будут накапливаться для достижения ваших целей;</label>
                <label class="col-sm-10 col-form-label-lg ">3) Никаких платежей за открытие копилки;</label>
                <label class="col-sm-10 col-form-label-lg ">4) Важно: Вы не сможете перевести себе чать денег из копилки, копилку возможно только разбить, при этом все накопленные вами средства перечислятся вам на счет!</label>
            </div>
            <div class="form-group row">
                <label class="col-sm-5 col-form-label-lg">Копилка будет открыта на пользователя:</label>
                <div class="col-sm-5">
                    <label class="col-form-label-lg">${lastName} ${firstName} ${patronymic}</label>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg ">Название копилки:</label>
                <div class="col-sm-6">
                    <input type="text" name="piggiBankName" value="<#if piggiBank??>${piggiBank.piggiBankName}</#if>"
                           class="form-control form-control-lg ${(piggiBankNameError??)?string('is-invalid', '')}"/>
                    <#if piggiBankNameError??>
                        <div class="invalid-feedback">
                            ${piggiBankNameError}
                        </div>
                    </#if>
                </div>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Открыть</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>