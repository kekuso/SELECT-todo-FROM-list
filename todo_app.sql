-- 1
DROP USER IF EXISTS michael;
-- 2
CREATE USER michael
  WITH ENCRYPTED PASSWORD 'stonebreaker';
--3
DROP DATABASE IF EXISTS todo_app;
--4
CREATE DATABASE todo_app;
 -- 5
\c "todo_app";
 -- 6
CREATE TABLE tasks
-- 7
  (id SERIAL PRIMARY KEY NOT NULL,
    title character varying (255) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone,
    completed boolean NOT NULL DEFAULT false);
-- 8i
ALTER TABLE tasks DROP COLUMN IF EXISTS completed,
--8ii
ADD COLUMN completed_at timestamp DEFAULT NULL,
--8iii
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT now();
--8iv
INSERT INTO tasks VALUES(DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
--8v
INSERT INTO tasks VALUES(DEFAULT, 'Study PostgreSQL', 'Read all the documentation');
--8vi
SELECT title FROM tasks WHERE completed_at IS NULL;
--8vii
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';
--8viii
SELECT title, description FROM tasks WHERE completed_at IS NULL;
--8ix
SELECT * FROM tasks ORDER BY created_at DESC;
--8x
INSERT INTO tasks VALUES(DEFAULT, 'mistake 1', 'a test entry');
--8xi
INSERT INTO tasks VALUES(DEFAULT, 'mistake 2', 'another test entry');
--8xii
INSERT INTO tasks VALUES(DEFAULT, 'third mistake', 'another test entry');
--8xiii
SELECT title FROM tasks WHERE title LIKE '%mistake%';
--8xiv
DELETE FROM tasks WHERE title = 'mistake 1';
--8xv
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';
--8xvi
DELETE FROM tasks WHERE title LIKE '%mistake%';
--8xvii
SELECT * FROM tasks ORDER BY title ASC;