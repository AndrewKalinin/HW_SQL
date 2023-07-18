-- Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT CASE p.gender WHEN 'f' THEN 'Женщины' END AS gender, COUNT(l.id) AS morelikes
FROM profiles p JOIN likes l
ON p.user_id = l.user_id
GROUP BY p.gender
ORDER BY COUNT(*) DESC LIMIT 1;