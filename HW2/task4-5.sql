/* 3) Написать скрипт, отмечающий несовершеннолетних пользователей
как неактивных (поле is_active = true).
Предварительно добавить такое поле в таблицу profiles
со значением по умолчанию = false (или 0) */

ALTER TABLE profile ADD COLUMN is_active ENUM('true', 'false') DEFAULT 'false';


UPDATE profile SET is_active = 'true' WHERE (YEAR(CURRENT_DATE) - YEAR(birthday)) < 18;
SELECT * FROM profile WHERE (YEAR(CURRENT_DATE) - YEAR(birthday)) < 18;



/*
    4) Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
*/


INSERT INTO messages (from_user_id, to_user_id, body, created_at) VALUES ('1', '2', 'Lorem', '2023-05-05'),
										('3', '4', 'Lorem10', '2023-08-08'),
										('3', '4', 'Lorem10', '2023-08-08'),
										('3', '4', 'Lorem10', '2023-08-08');



DELETE FROM messages WHERE
created_at > CURRENT_DATE();