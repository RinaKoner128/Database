use vk1;
-- 1
select 
from_user_id as 'Отправитель',
to_user_id as 'Получатель',
count(*) as 'Всего сообщений получателя'
from messages
where to_user_id = 7;

-- 2
select count(*) as 'Количество лайков молодежи'
from likes
where media_id in (
select id from media where user_id in
(select user_id from profiles where YEAR(CURRENT_DATE)-YEAR(birthday)<10));

-- 3
select 
    count(*) as 'Женщины',
    (select count(*)
	from likes
	where media_id in (
		select id from media where user_id in
			(select user_id from profiles where gender = 'm'))) as 'Мужчины'
from likes
where media_id in (
	select id from media where user_id in
		(select user_id from profiles where gender = 'h'));