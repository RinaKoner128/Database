-- 1.1
update users set updated_at = now(), created_at = now();
-- 1.2
alter table users modify column created_at char(100);
alter table users modify column updated_at char(100);
update users set updated_at = "20.10.2017 8:10", created_at = "20.10.2017 8:10";
update users set
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'), updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
alter table users modify column created_at datetime;
alter table users modify column updated_at datetime;
-- 1.3
SELECT *
FROM storehouses_products
ORDER BY IF(value > 0, false, true), value;
-- 1.4 
select id, name, date_format(birthday_at, '%D %M %Y') as birthday
from users
where month(birthday_at) like '5' or month(birthday_at) like '8';
-- 1.5 
SELECT * FROM catalogs WHERE id IN (5, 1, 2)
order by if(id = 5, 0 , 1);
-- 2.1
select avg(YEAR(CURRENT_DATE)-YEAR(birthday_at)) from users;
-- 2.2
-- К сожалению, не поняла, как получить дни недели текущего года, а не года рождения.
select DAYNAME(birthday_at) as 'День недели', count(DAYNAME(birthday_at)) as 'Количество'
from users group by DAYNAME(birthday_at);
-- 2.3
-- В качестве значений всяла количество товара на складе.
SELECT exp(sum(ln(value))) from storehouses_products;