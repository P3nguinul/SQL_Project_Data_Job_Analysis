SELECT *
FROM january_jobs
WHERE salary_year_avg > 70000

UNION ALL 

SELECT * 
FROM february_jobs
WHERE salary_year_avg > 70000

UNION ALL 

SELECT * 
FROM march_jobs
WHERE salary_year_avg > 70000;

SELECT 
    job_title_short,
    salary_hour_avg
FROM job_postings_fact
WHERE salary_hour_avg > 100;