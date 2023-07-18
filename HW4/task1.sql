-- Количество групп (сообществ), в которые вступил каждый пользователь

SELECT 
	count(*) AS cnt,
	g.id
FROM groups AS g
JOIN group_requests AS gr ON (
	g.id = gr.target_user_id OR g.id = gr.initiator_user_id 
)
WHERE gr.status = 'approved'
GROUP BY g.id
ORDER BY cnt DESC