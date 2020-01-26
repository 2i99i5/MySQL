/*
1.    Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека,
который больше всех общался с нашим пользователем.
2.    Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
3.    Определить кто больше поставил лайков (всего) - мужчины или женщины?

*/

use vk;

-- создание таблиц


-- наполнение нужными данными

 
-- скрипт самого задания
select count(*), id, to_user_id, from_user_id
from messages
where id in
(
	select id from messages where from_user_id = 1 and to_user_id in (
		  SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
		  union
		  SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved'
		  )
		union
	select id from messages where to_user_id = 1 and from_user_id in (
		  SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved'
		  union
		  SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved'
		  )
)
group by id;
	
SELECT 
	media_id
	, COUNT(*) -- применим агрегирующую функцию count 
FROM likes 
WHERE media_id IN ( -- 1,2,3,4,5
  SELECT id FROM media WHERE user_id = 1 -- мои медиа
)
;