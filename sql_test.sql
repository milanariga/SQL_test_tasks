-- 1. Отобрать студентов, посетивших ровно 5 уроков математики
SELECT s.fio, COUNT(*) 
  FROM stud s, lect l 
 WHERE s.id = l.stud 
   AND l.subj = 'Math' 
 GROUP BY s.fio 
 HAVING COUNT(*) = 5; 

-- 2.Отобрать студентов, посетивших ровно 5 уроков математики и при этом всегда посещавших лекции только одного (любого) преподавателя
SELECT s.fio, COUNT(*) 
  FROM stud s, lect l 
 WHERE s.id = l.stud 
   AND l.subj = 'Math' 
 GROUP BY s.fio, l.teach 
 HAVING COUNT(*) = 5;

-- 3. Найти лекции, которые по ошибке начинаются в одно время в одной и той же аудитории или у одного и того же преподавателя
SELECT DISTINCT a.subj, a.teach, a.lectdate, a.room
FROM lect a,
    (SELECT lectdate, teach, COUNT(*)
    FROM lect
    GROUP BY lectdate, teach
    HAVING COUNT(*) > 1) same_teach,
    (SELECT lectdate, room, COUNT(*)
    FROM lect
    GROUP BY lectdate, room
    HAVING COUNT(*) > 1) same_room
WHERE (a.room = same_room.room AND a.lectdate = same_room.lectdate)
    OR (a.teach = same_teach.teach AND a.lectdate = same_teach.lectdate);
	
-- 4. Найти лекции, которые по ошибке пересекаются по времени в одной и той же аудитории или у одного и того же преподавателя
/*Примерный алгоритм решения
1. Выборка по преподавателю/комнате
2. Проверка, что начало лекции не находится между началом и концом другой (возможно, с использование lectdate + INTERVAL TO_CHAR(lectdur) MINUTES --> на даном этапе проблема с TO_CHAR(lectdur))
3. Вывод пересекающихся лекций
*/

-- 5. Вывести "журнал". Колонки: имя студента, "математика", "физика", "программирование", "экономика", "всего", "всего за посл. месяц".
--Строки - количество посещенных лекций соответствующего предмета или месяца.
SELECT s.fio,
       SUM(CASE WHEN l.subj = 'Math' THEN 1 ELSE 0 END) AS Math_attend,
       SUM(CASE WHEN l.subj = 'Prog' THEN 1 ELSE 0 END) AS Prog_attend,
       SUM(CASE WHEN l.subj = 'Physics' THEN 1 ELSE 0 END) AS Physics_attend,
       SUM(CASE WHEN l.subj = 'Economics' THEN 1 ELSE 0 END) AS Economics_attend,
       COUNT(*) AS Total_lect_attend,
       SUM(CASE WHEN CAST(l.lectdate AS DATE) BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE THEN 1 ELSE 0 END) AS Last_month_attend
FROM stud s, lect l
WHERE s.id = l.stud
GROUP BY s.fio
ORDER BY s.fio;

-- 6. Вывести "журнал пропусков". Колонки: имя студента, "математика", "физика", "программирование", "экономика", "всего", "всего за посл. месяц". 
--Строки - количество пропущеных лекций.
/*По-моему, структура одного select слишком сложная. При возможности я бы написала процедуру/функцию PL/SQL, 
разбив структуру на курсоры с подаваемым параметром предмета, сохраненные переменные с последующим использованием --> читабельность, проще модерировать.
*/
SELECT s.fio,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l WHERE l.subj = 'Math')) - SUM(CASE WHEN l.subj = 'Math' THEN 1 ELSE 0 END) AS Math_not_attend,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l WHERE l.subj = 'Prog')) - SUM(CASE WHEN l.subj = 'Prog' THEN 1 ELSE 0 END) AS Prog_not_attend,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l WHERE l.subj = 'Physics')) - SUM(CASE WHEN l.subj = 'Physics' THEN 1 ELSE 0 END) AS Physics_not_attend,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l WHERE l.subj = 'Economics')) - SUM(CASE WHEN l.subj = 'Economics' THEN 1 ELSE 0 END) AS Economics_not_attend,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l)) - COUNT(*) AS Total_not_attend,
       (SELECT COUNT(*) FROM (SELECT DISTINCT l.subj, l.lectdate FROM lect l WHERE CAST(l.lectdate AS DATE) BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE)) - SUM(CASE WHEN CAST(l.lectdate AS DATE) BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE THEN 1 ELSE 0 END) AS Last_month_not_attend
FROM stud s, lect l
WHERE s.id = l.stud
GROUP BY s.fio
ORDER BY s.fio;

-- 7. Data
create table maze( room1 varchar2(20) not null, room2 varchar2(20) not null);
insert into maze values ('one', 'three');
insert into maze values ('one', 'two');
insert into maze values ('one', 'five');
insert into maze values ('two', 'four');
insert into maze values ('three', 'six');
insert into maze values ('four', 'five');
insert into maze values ('four', 'six');
insert into maze values ('five', 'eight');
insert into maze values ('five', 'seven');
insert into maze values ('five', 'nine');
insert into maze values ('three', 'seven');
insert into maze values ('six', 'seven');
insert into maze values ('eight', 'nine');
insert into maze values ('eight', 'six');
insert into maze values ('two', 'nine');

--Solution (IN parameters hardcoded)
SELECT *
FROM (SELECT 
        connect_by_root room2 room1,
        room2,
        sys_connect_by_path(room2,'->') path,
        level room_count,
        min(level) OVER () as short_path
      FROM maze
      WHERE room2 = 'nine'
      connect by prior room2 = room1
      start with room1 = 'one') result
WHERE result.room_count = short_path;