<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg ">Сумма пополнения:</label>
                <div class="col-sm-6">
                    <input type="number" name="money" class="form-control form-control-lg"/>
                </div>
            </div>
        </div>
        <div>
            <button class="btn btn-lg btn-success" type="submit">Пополнить</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>