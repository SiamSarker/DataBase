SELECT id, age, m.mini, w.power
FROM 
    (
        SELECT code, power, MIN(coins_needed) as mini
        FROM Wands
        GROUP BY code,power
    ) as m
    JOIN
    Wands as w on w.code = m.code AND w.power = m.power AND w.coins_needed = m.mini
    JOIN
    Wands_Property as p on p.code = w.code
WHERE p.is_evil = 0
ORDER BY w.power DESC, p.age DESC;
    