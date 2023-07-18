-- Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем 
-- (написал ему сообщений)

SET @count_send_messages := (SELECT from_user_id FROM messages WHERE to_user_id = 1 GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1);

SELECT CONCAT(firstname,' ', lastname) AS name, (SELECT COUNT(id) AS countmessages FROM messages 
WHERE from_user_id = @count_send_messages) AS send_mesasges FROM users 
WHERE id = (SELECT from_user_id FROM messages WHERE to_user_id = 1 GROUP BY from_user_id ORDER BY COUNT(*) DESC LIMIT 1);