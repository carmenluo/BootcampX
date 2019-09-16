SELECT id, name
FROM students
where cohort_id = 7
ORDER BY name ASC;

SELECT count(id)
from students
where cohort_id IN (1,2,3);

SELECT id, name
FROM students 
WHERE email IS NULL OR phone IS NULL;

SELECT name, id, email, cohort_id
FROM students
where email NOT LIKE '%gmail.com' and phone IS NULL;

SELECT name , id, cohort_id
from students
where end_date IS NULL
ORDER BY cohort_id;

SELECT name, email, phone
from students
where end_date IS not NULL and github is null;