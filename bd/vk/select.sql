-- select distinct firstname as 'Имя' from users order by firstname;
/*ALTER TABLE profiles ADD COLUMN is_active boolean default true NOT NULL;*/
update profiles set is_active = false
-- select * from profiles

where YEAR(CURRENT_DATE)-YEAR(birthday)<18;