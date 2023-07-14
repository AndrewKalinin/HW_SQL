-- Выведите количество мужчин старше 35 лет [COUNT]

SELECT profiles, id, gender, age
FROM users
WHERE gender = 'm' AND age > 35
ORDER BY age DESC