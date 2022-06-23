-- 1
select 
concat(users.firstname, ' ', users.lastname) as 'Отправитель',
max(users.id) as 'Кол-во сообщений'
from messages
inner join users
on users.id = messages.from_user_id
where messages.to_user_id = 7;

-- 2
select count(*) as 'Количество лайков молодежи'
from likes
inner join media
on likes.media_id = media.id
inner join profiles
on profiles.user_id = media.user_id
where YEAR(CURRENT_DATE)-YEAR(birthday)<10;

-- 3
select 
case(profiles.gender) 
when 'h' then 'Женщин'
when 'm' then 'Мужчин'
end as 'Пол',
count(*) as 'Количество'
from likes
inner join media
on likes.media_id = media.id
inner join profiles
on profiles.user_id = media.user_id
group by profiles.gender;
