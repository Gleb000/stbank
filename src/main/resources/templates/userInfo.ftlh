<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="get">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Имя:</label>
            <div class="col-sm-6">
                <#if firstName??><label class="col-form-label-lg">${firstName}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Фамилия:</label>
            <div class="col-sm-6">
                <#if lastName??><label class="col-form-label-lg">${lastName}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Отчество:</label>
            <div class="col-sm-6">
                <#if patronymic??><label class="col-form-label-lg">${patronymic}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Дата рождения:</label>
            <div class="col-sm-6">
                <#if dateOfBirth??><label class="col-form-label-lg">${dateOfBirth}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Пол:</label>
            <div class="col-sm-6">
                <#if sex??><label class="col-form-label-lg">${sex}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Серия паспорта:</label>
            <div class="col-sm-6">
                <#if passportSeries??><label class="col-form-label-lg">${passportSeries}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Номер паспорта:</label>
            <div class="col-sm-6">
                <#if passportNumber??><label class="col-form-label-lg">${passportNumber}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Кем выдан:</label>
            <div class="col-sm-6">
                <#if issuedBy??><label class="col-form-label-lg">${issuedBy}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Дата выдачи:</label>
            <div class="col-sm-6">
                <#if dateOfIssue??><label class="col-form-label-lg">${dateOfIssue}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Идентификационный номер:</label>
            <div class="col-sm-6">
                <#if identificationNumber??><label class="col-form-label-lg">${identificationNumber}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Место рождения:</label>
            <div class="col-sm-6">
                <#if placeOfBirth??><label class="col-form-label-lg">${placeOfBirth}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Город проживания:</label>
            <div class="col-sm-6">
                <#if cityOfResidence??><label class="col-form-label-lg">${cityOfResidence}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Адрес проживания:</label>
            <div class="col-sm-6">
                <#if address??><label class="col-form-label-lg">${address}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Домашний телефон:</label>
            <div class="col-sm-6">
                <#if homeNumber??><label class="col-form-label-lg">${homeNumber}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Мобильный телефон:</label>
            <div class="col-sm-6">
                <#if phoneNumber??><label class="col-form-label-lg">${phoneNumber}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Место работы:</label>
            <div class="col-sm-6">
                <#if workPlace??><label class="col-form-label-lg">${workPlace}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Должность:</label>
            <div class="col-sm-6">
                <#if position??><label class="col-form-label-lg">${position}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Город прописки:</label>
            <div class="col-sm-6">
                <#if registrationCity??><label class="col-form-label-lg">${registrationCity}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Адрес прописки:</label>
            <div class="col-sm-6">
                <#if registrationAddress??><label class="col-form-label-lg">${registrationAddress}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Семейное положение:</label>
            <div class="col-sm-6">
                <#if maritalStatus??><label class="col-form-label-lg">${maritalStatus}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Грожданство:</label>
            <div class="col-sm-6">
                <#if nationality??><label class="col-form-label-lg">${nationality}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Инвалидность:</label>
            <div class="col-sm-6">
                <#if disability??><label class="col-form-label-lg">${disability}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label-lg">Ежемесячный доход:</label>
            <div class="col-sm-6">
                <#if monthlyEarnings??><label class="col-form-label-lg">${monthlyEarnings}</label><#else><label class="col-form-label-lg">Информация отсутствует</label></#if>
            </div>
        </div>
        <div class="p-2">
            <a href="/user/editUserInfo" class="btn btn-lg btn-success" role="button" aria-pressed="true">Редактировать</a>
        </div>
        <div class="p-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>