
use shop;
-- 1
select 
name as 'Клиент',
orders.id as 'Номер заказа',
orders.created_at as 'Дата заказа'
from users
inner join orders
on  orders.user_id = users.id;

-- 2
select catalogs.name as 'Тип товара',
products.name as 'Наименование',
products.description as 'Описание',
products.price as 'Цена',
products.updated_at as 'Информация актуальна с:'
from catalogs
inner join products
on catalogs.id = products.catalog_id;

-- 3
DROP TABLE IF EXISTS fligths;
CREATE TABLE fligths (
	id serial primary key,
	from_fligths varchar(100) not null,
	to_fligths varchar(100) not null);
    
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label varchar(100) not null,
	name varchar(100) not null);
    
insert into fligths
value 
('1', 'moscow', 'omsk'),
('2', 'novgorod', 'kazan'),
('3', 'irkutsk', 'moscow'),
('4', 'omsk', 'irkutsk'),
('5', 'moscow', 'kazan');

insert into cities
value 
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod','Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

select
(select name from cities where label = fligths.from_fligths) as 'ИЗ',
(select name from cities where label = fligths.to_fligths) as 'В'
from fligths