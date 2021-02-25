<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg ">Имя</label>
                <div class="col-sm-6">
                    <input type="text" name="firstName" value="<#if userInfo??>${userInfo.firstName}</#if>"
                           class="form-control form-control-lg ${(firstNameError??)?string('is-invalid', '')}"/>
                    <#if firstNameError??>
                        <div class="invalid-feedback">
                            ${firstNameError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Фамилия</label>
                <div class="col-sm-6">
                    <input type="text" name="lastName" value="<#if userInfo??>${userInfo.lastName}</#if>"
                           class="form-control form-control-lg ${(lastNameError??)?string('is-invalid', '')}"/>
                    <#if lastNameError??>
                        <div class="invalid-feedback">
                            ${lastNameError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Отчество</label>
                <div class="col-sm-6">
                    <input type="text" name="patronymic" value="<#if userInfo??>${userInfo.patronymic}</#if>"
                           class="form-control form-control-lg ${(patronymicError??)?string('is-invalid', '')}"/>
                    <#if patronymicError??>
                        <div class="invalid-feedback">
                            ${patronymicError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Дата рождения</label>
                <div class="col-sm-6">
                    <input type="date" name="dateOfBirth" class="form-control form-control-lg">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-5 col-form-label-lg">Пол</label>
                <div>
                    <div class="form-check  col-sm-2">
                        <input class="form-check-input" type="radio" name="sex" id="radio1" value="Мужской">
                        <label class="form-check-label font-bolt" for="radio1">
                            Мужской
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sex" id="radio2" value="Женский">
                        <label class="form-check-label font-bolt" for="radio2">
                            Женский
                        </label>
                    </div>
                    <div class="invalid-feedback">Выберите хотя-бы одно</div>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Серия паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportSeries" value="<#if userInfo??>${userInfo.passportSeries}</#if>"
                           class="form-control form-control-lg ${(passportSeriesError??)?string('is-invalid', '')}"/>
                    <#if passportSeriesError??>
                        <div class="invalid-feedback">
                            ${passportSeriesError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Номер паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportNumber" value="<#if userInfo??>${userInfo.passportNumber}</#if>"
                           class="form-control form-control-lg ${(passportNumberError??)?string('is-invalid', '')}"
                            placeholder="1234567"/>
                    <#if passportNumberError??>
                        <div class="invalid-feedback">
                            ${passportNumberError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Кем выдан</label>
                <div class="col-sm-6">
                    <input type="text" name="issuedBy" value="<#if userInfo??>${userInfo.issuedBy}</#if>"
                           class="form-control form-control-lg ${(issuedByError??)?string('is-invalid', '')}"/>
                    <#if issuedByError??>
                        <div class="invalid-feedback">
                            ${issuedByError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Дата выдачи</label>
                <div class="col-sm-6">
                    <input type="date" name="dateOfIssue" class="form-control form-control-lg">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Идентификационный номер</label>
                <div class="col-sm-6">
                    <input type="text" name="identificationNumber" value="<#if userInfo??>${userInfo.identificationNumber}</#if>"
                           class="form-control form-control-lg ${(identificationNumberError??)?string('is-invalid', '')}"
                           placeholder="1234567А123РБ1"/>
                    <#if identificationNumberError??>
                        <div class="invalid-feedback">
                            ${identificationNumberError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Место рождения</label>
                <div class="col-sm-6">
                    <input type="text" name="placeOfBirth" value="<#if userInfo??>${userInfo.placeOfBirth}</#if>"
                           class="form-control form-control-lg ${(placeOfBirthError??)?string('is-invalid', '')}"/>
                    <#if placeOfBirthError??>
                        <div class="invalid-feedback">
                            ${placeOfBirthError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state1" class="col-sm-4 col-form-label-lg">Город проживания</label>
                <div class=" col-sm-6">
                    <select class="form-control form-control-lg" id="state1" name="cityOfResidence">
                        <option>Минск</option>
                        <option>Гродно</option>
                        <option>Брест</option>
                        <option>Гомель</option>
                        <option>Могилев</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Адрес</label>
                <div class="col-sm-6">
                    <input type="text" name="address" value="<#if userInfo??>${userInfo.address}</#if>"
                           class="form-control form-control-lg ${(addressError??)?string('is-invalid', '')}"/>
                    <#if addressError??>
                        <div class="invalid-feedback">
                            ${addressError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Домашний телефон</label>
                <div class="col-sm-6">
                    <input type="text" name="homeNumber" class="form-control form-control-lg" placeholder="123-45-67">
                </div>
            </div>
            <div class="form-group row">
                <label for="inLineForm" class="col-sm-4 col-form-label-lg">Мобильный телефон</label>
                <div class="col-sm-6">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">+375</div>
                        </div>
                        <input type="text" name="phoneNumber" id="inLineForm" class="form-control form-control-lg" placeholder="29 123-45-67">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Место работы</label>
                <div class="col-sm-6">
                    <input type="text" name="workPlace" class="form-control form-control-lg">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Должность</label>
                <div class="col-sm-6">
                    <input type="text" name="position" class="form-control form-control-lg">
                </div>
            </div>
            <div class="form-group row">
                <label for="state2" class="col-sm-4 col-form-label-lg">Город прописки</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state2" name="registrationCity">
                        <option>Минск</option>
                        <option>Гродно</option>
                        <option>Брест</option>
                        <option>Гомель</option>
                        <option>Могилев</option>
                        <option>другое</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Адрес прописки</label>
                <div class="col-sm-6">
                    <input type="text" name="registrationAddress" value="<#if userInfo??>${userInfo.registrationAddress}</#if>"
                           class="form-control form-control-lg ${(registrationAddressError??)?string('is-invalid', '')}"/>
                    <#if registrationAddressError??>
                        <div class="invalid-feedback">
                            ${registrationAddressError}
                        </div>
                    </#if>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state3" class="col-sm-4 col-form-label-lg">Семейное положение</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state3" name="maritalStatus">
                        <option>Не замужем, не женат</option>
                        <option>Замужем, женат</option>
                        <option>Разведен, разведена</option>
                        <option>Вдова, вдовец</option>
                        <option>другое</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state4" class="col-sm-4 col-form-label-lg">Гражданство</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state4" name="nationality">
                        <option>Республика Беларусь</option>
                        <option>Российская Федерация</option>
                        <option>Украина</option>
                        <option>Польша</option>
                        <option>Германия</option>
                        <option>Америка</option>
                        <option>другое</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label for="state5" class="col-sm-4 col-form-label-lg">Инвалидность</label>
                <div class="col-sm-6">
                    <select class="form-control form-control-lg" id="state5" name="disability">
                        <option>отсутствует</option>
                        <option>1 группа</option>
                        <option>2 группа</option>
                        <option>3 группа</option>
                    </select>
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Ежемесячный доход</label>
                <div class="col-sm-6">
                    <input type="text" name="monthlyEarnings" class="form-control form-control-lg">
                </div>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Сохранить</button>
            </div>
            <div class="p-5">
                <p class="card-text text-secondary">2017 «СтатусБанк»</p>
                <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>