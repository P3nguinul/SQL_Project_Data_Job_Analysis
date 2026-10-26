/*
Question 1: What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely.
-Focuses on job postings with specified salaries (Remove nulls)
*/

SELECT 
    j.job_id,
    j.job_title,
    j.job_location,
    c.name AS company_name,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
FROM
    job_postings_fact AS j
LEFT JOIN 
    company_dim AS c
ON
    j.company_id = c.company_id
WHERE 
    j.job_title_short = 'Data Analyst' AND 
    j.salary_year_avg IS NOT NULL AND 
    j.job_location = 'Anywhere'
ORDER BY j.salary_year_avg DESC
LIMIT 10;
