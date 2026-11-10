-- 1. Zadania z wysokim priorytetem wedlug terminu
SELECT *
FROM tasks
WHERE priority = 'high' AND isDeleted = 0
ORDER BY deadline ASC;

-- 2. Zadania po terminie, ktore nie sa zakonczone
SELECT *
FROM tasks
WHERE deadline < CURDATE()
AND status != 'done'
AND isDeleted = 0;

-- 3. Zadania z nazwa tablicy i loginem osoby
SELECT
    tasks.title,
    boards.name,
    users.login
FROM tasks
JOIN boards ON tasks.boardId = boards.id
LEFT JOIN users ON tasks.assigneeId = users.id
WHERE tasks.isDeleted = 0;

-- 4. Liczba zadan w kazdym statusie na tablicy
SELECT status, COUNT(*) AS liczba
FROM tasks
WHERE boardId = 3 AND isDeleted = 0
GROUP BY status;

-- 5. Usuniete zadania z loginem osoby
SELECT tasks.title, users.login, tasks.deletedAt
FROM tasks
JOIN users ON tasks.deletedById = users.id
WHERE tasks.isDeleted = 1;

-- 6. Uzytkownicy bez zadania
SELECT users.login
FROM users
LEFT JOIN tasks ON users.id = tasks.assigneeId
WHERE tasks.id IS NULL;

-- 7. Szukanie zadan po slowie
SELECT *
FROM tasks
WHERE title LIKE '%danych%'
AND isDeleted = 0;

-- 8. Zmiana statusu zadania
SELECT * FROM tasks WHERE id = 2;
UPDATE tasks
SET status = 'done'
WHERE id = 2;

-- 9. Miekkie usuniecie zadania
SELECT * FROM tasks WHERE id = 4;
UPDATE tasks
SET isDeleted = 1,
    deletedAt = NOW(),
    deletedById = 1
WHERE id = 4;

-- 9. Miekkie usuniecie zadania
SELECT * FROM tasks WHERE id = 4;
UPDATE tasks
SET isDeleted = 1,
    deletedAt = NOW(),
    deletedById = 1
WHERE id = 4;

-- 10. Usuwanie zadan starszych niz 30 dni
SELECT *
FROM tasks
WHERE isDeleted = 1
AND deletedAt < NOW() - INTERVAL 30 DAY;

DELETE FROM tasks
WHERE isDeleted = 1
AND deletedAt < NOW() - INTERVAL 30 DAY;