SELECT  teachers.name, count(assistance_requests.*) as total_assistances
from assistance_requests join teachers on teacher_id = teachers.id
where teachers.name = 'Waylon Boehm'
group by teachers.name;


SELECT students.name as name, count(*) as total_assistances
from assistance_requests join students on student_id = students.id
group by students.name
having students.name = 'Elliot Dickinson';

select students.name as student, teachers.name as teacher, assignments.name as assignment, (ar.completed_at - ar.started_at) as duration
from assistance_requests ar
  inner join students on student_id = students.id
  inner join teachers on teacher_id = teachers.id
  inner join assignments on assignment_id = assignments.id
order by duration;


select sum(completed_at - started_at) / count(id) as average_assistance_request_duration
from assistance_requests;
SELECT avg(completed_at - started_at) as average_assistance_request_duration
FROM assistance_requests;

SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
from assistance_requests
  join students on student_id = students.id
  join cohorts on cohorts.id = students.cohort_id
  group by cohorts.name
  order by average_assistance_time;
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;


SELECT avg(started_at - created_at) as average_wait_time
FROM assistance_requests;

select cohorts.name, sum(completed_at - started_at) as total_duration
from assistance_requests
 join students on student_id = students.id
 join cohorts on cohorts.id = cohort_id
group by cohorts.name
order by total_duration;

--Calculate the average total duration of assistance requests for each cohort.
select avg(total_duration) as average_total_duration
from (
select cohorts.name, sum(completed_at - started_at) as total_duration
from assistance_requests
 join students on student_id = students.id
 join cohorts on cohorts.id = cohort_id
group by cohorts.name
order by total_duration) as tb1;

-- List each assignment with the total number of assistance requests with it.
select assignments.id, assignments.name, assignments.day, assignments.chapter, count(assistance_requests.*) as total_requests
from assistance_requests 
  join assignments on assignments.id = assignment_id
  group by assignments.id
  order by total_requests DESC;

-- Get each day with the total number of assignments and the total duration of the assignments. 
 select day, count(*) as number_of_assignments, sum(duration)
 from assignments
 group by day
 order by day;

--Get the name of all teachers that performed an assistance request during a cohort.
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;

-- Name of Teachers and Number of Assistances We need to know which teachers actually assisted students during any cohort, and how many assistances they did for that cohort.
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.id) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY total_assistances;