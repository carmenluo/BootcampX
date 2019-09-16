SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date,
students.start_date as student_start_date
FROM students join cohorts on cohorts.id = cohort_id
WHERE cohorts.start_date != students.start_date;

/*
Get the total amout of time that a student has spent on all assignments
assignments, assignment_submissions, students, cohorts
 */
 SELECT sum(assignment_submissions.duration)
 FROM students JOIN assignment_submissions on students.id = assignment_submissions.student_id
 where students.name = 'Ibrahim Schimmel';

/*
Get the total amount of time that all students from a specific cohort have spent on all assignments.
 */

 SELECT sum(assignment_submissions.duration) as total_amout_time
 FROM students JOIN assignment_submissions on students.id = assignment_submissions.student_id JOIN cohorts on students.cohort_id = cohorts.id
 where cohorts.name = 'FEB12';