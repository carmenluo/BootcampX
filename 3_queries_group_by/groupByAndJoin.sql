/*
Get the total number of assignments for each day of bootcamp.
 */
SELECT day, count(name)
from assignments
GROUP BY day
ORDER BY day;

/*
Get the total number of assignments for each day of bootcamp which has more than 10 assignments
 */
SELECT day, count(name)
from assignments
GROUP BY day
HAVING (count(name) >= 10)
ORDER BY day;

/*
Get all cohorts with 18 or more students.
*/
select cohorts.name as cohort_name , count(*) as student_count
from cohorts join students on cohorts.id =  students.cohort_id
GROUP BY cohorts.name
having (count(*) >= 18);

/*
Get the total number of assignment submissions for each cohort.
*/
select cohorts.name as cohort_name , count(*) as total_submissions
from cohorts join students on cohorts.id =  students.cohort_id join assignment_submissions on students.id = assignment_submissions.student_id
GROUP BY cohorts.name
order by total_submissions DESC;

/*
Get currently enrolled students' average assignment completion time.
*/
select students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
from students join assignment_submissions on students.id = assignment_submissions.student_id
where students.end_date is null
group by students.name
order by average_assignment_duration DESC;

/*Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
*/
select students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as estimated_duration
from students join assignment_submissions on students.id = assignment_submissions.student_id join assignments on assignment_submissions.assignment_id = assignments.id
where students.end_date is null
group by students.name
having avg(assignment_submissions.duration) < avg(assignments.duration)
order by average_assignment_duration DESC;