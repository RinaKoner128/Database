drop table if exists catalogs;
create table catalogs(
id serial primary key,
name varchar(255) comment 'Название раздела'
) comment = 'Разделы интернет-магазина';

drop table if exists users;
create table users(
id serial primary key,
name varchar(255) comment 'Имя покупателя',
birthday_at date comment 'Дата рождения',
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp
) comment = 'Покупатели';

drop table if exists products;
create table products(
id serial primary key,
id_catalog int unsigned,
name varchar(255) comment 'Название',
desription text comment 'Описание',
price decimal (11,2) comment 'Цена',
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp,
key index_of_id_catalog (id_catalog)
) comment = 'Товарные позиции';

drop table if exists orders;
create table orders(
id serial primary key,
id_users int unsigned,
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp,
key index_of_id_users (id_users)
) comment = 'Заказы';

drop table if exists orders_products;
create table orders_products(
id serial primary key,
id_orders int unsigned,
id_products int unsigned,
total int unsigned default 1 comment 'Количество заказанных товаров',
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp
) comment = 'Состав зааказа';

drop table if exists discounts;
create table discounts(
id serial primary key,
id_users int unsigned,
id_products int unsigned,
discount float unsigned comment 'Величина скидки от 0,0 до 1,0',
started_ad datetime,
finished_ad datetime,
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp,
key index_of_id_users (id_users),
key index_of_id_products (id_products)
) comment = 'Скидки';

drop table if exists storehouses;
create table storehouses(
id serial primary key,
name varchar(255) comment 'Название',
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp
) comment = 'Склады';

drop table if exists storehouses_products;
create table storehouses_products(
id serial primary key,
id_storehouses int unsigned,
id_products int unsigned,
value int unsigned comment 'Запас товарной позиции на складе',
created_ad datetime default current_timestamp,
updated_ad datetime default current_timestamp on update current_timestamp
) comment = 'Запасы на складе';
