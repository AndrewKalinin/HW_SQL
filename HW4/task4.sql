-- Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..

SELECT COUNT(l.id) AS likes_junior_users
FROM users u JOIN likes l
ON l.user_id = u.id
JOIN profiles p
ON p.user_id = u.id
WHERE p.birthday BETWEEN DATE_ADD(NOW(), INTERVAL -18 YEAR) AND NOW();