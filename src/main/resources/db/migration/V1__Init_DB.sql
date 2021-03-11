create sequence hibernate_sequence start 1 increment 1;

create table bank_account (
    id int8 not null,
    user_account varchar(255),
    user_money float8,
    primary key (id)
);

create table bank_accounteur (
    id int8 not null,
    user_accounteur varchar(255),
    user_moneyeur float8,
    primary key (id)
);

create table bank_accountusd (
    id int8 not null,
    user_accountusd varchar(255),
    user_moneyusd float8,
    primary key (id)
);

create table bank_credit (
    id int8 not null,
    credit_sum float8,
    paid_out float8,
    primary key (id)
);

create table message (
    id int8 not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    user_id int8,
    primary key (id)
);

create table piggi_bank (
    id int8 not null,
    piggi_bank_money float8,
    piggi_bank_name varchar(255),
    target_date varchar(255),
    target_money float8,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table usr_info (
    id int8 not null,
    address varchar(255),
    city_of_residence varchar(255),
    date_of_birth varchar(255),
    date_of_issue varchar(255),
    disability varchar(255),
    first_name varchar(255),
    home_number varchar(255),
    identification_number varchar(255),
    issued_by varchar(255),
    last_name varchar(255),
    marital_status varchar(255),
    monthly_earnings varchar(255),
    nationality varchar(255),
    passport_number varchar(255),
    passport_series varchar(255),
    patronymic varchar(255),
    phone_number varchar(255),
    place_of_birth varchar(255),
    position varchar(255),
    registration_address varchar(255),
    registration_city varchar(255),
    sex varchar(255),
    work_place varchar(255),
    primary key (id)
);

create table usr (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists message
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;