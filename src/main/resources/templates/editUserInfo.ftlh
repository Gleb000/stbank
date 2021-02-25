<#import "parts/common.ftlh" as c>

<@c.page>
    <h3 class="font-italic">${username}</h3>
    <form method="post">
        <div class="container">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Серия паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportSeries" class="form-control form-control-lg" value="${passportSeries!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Номер паспорта</label>
                <div class="col-sm-6">
                    <input type="text" name="passportNumber" class="form-control form-control-lg" placeholder="1234567" value="${passportNumber!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Кем выдан</label>
                <div class="col-sm-6">
                    <input type="text" name="issuedBy" class="form-control form-control-lg" value="${issuedBy!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Дата выдачи</label>
                <div class="col-sm-6">
                    <input type="date" name="dateOfIssue" class="form-control form-control-lg" value="${dateOfIssue!''}">
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
                    <input type="text" name="address" class="form-control form-control-lg" value="${address!''}">
                </div>
                <p class="text-danger font-bolt"><strong>*</strong></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Домашний телефон</label>
                <div class="col-sm-6">
                    <input type="text" name="homeNumber" class="form-control form-control-lg" placeholder="123-45-67" value="${homeNumber!''}">
                </div>
            </div>
            <div class="form-group row">
                <label for="inLineForm" class="col-sm-4 col-form-label-lg">Мобильный телефон</label>
                <div class="col-sm-6">
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">+375</div>
                        </div>
                        <input type="text" name="phoneNumber" id="inLineForm" class="form-control form-control-lg" placeholder="29 123-45-67" value="${phoneNumber!''}">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Место работы</label>
                <div class="col-sm-6">
                    <input type="text" name="workPlace" class="form-control form-control-lg" value="${workPlace!''}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label-lg">Должность</label>
                <div class="col-sm-6">
                    <input type="text" name="position" class="form-control form-control-lg" value="${position!''}">
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
                    <input type="text" name="registrationAddress" class="form-control form-control-lg" value="${registrationAddress!''}">
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
                <label class="col-sm-4 col-form-label-lg">Ежемесячный доход</label>
                <div class="col-sm-6">
                    <input type="text" name="monthlyEarnings" class="form-control form-control-lg" value="${monthlyEarnings!''}">
                </div>
            </div>
            <div>
                <button class="btn btn-lg btn-success" type="submit">Сохранить</button>
            </div>
        </div>
        <div class="p-5">
            <p class="card-text text-secondary">2017 «СтатусБанк»</p>
            <p class="card-text text-secondary">Регистрационный номер в Едином государственном регистре юридических лиц и индивидуальных предпринимателей №807000043.</p>
        </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>