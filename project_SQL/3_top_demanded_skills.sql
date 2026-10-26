/*
Question 3: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
*/

--selectez job id urile care sunt de data analyst
-- foloseste acele id uri ca sa vad ce skilluri sunt necesare
-- numara acele skilluri si vezi care se repeta cel mai mult (top 5)
-- afiseaza care sunt cele mai in folosinta skilluri cu numele skill ului si nr de aparitii langa el

SELECT 
    s.skills AS skill_name,
    COUNT(sj.job_id) AS demand_count
FROM 
    skills_job_dim AS sj
INNER JOIN job_postings_fact AS j ON sj.job_id = j.job_id
INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE 
    j.job_title_short = 'Data Analyst' AND
    j.job_location LIKE '%Bucharest%'
GROUP BY 
    skill_name
ORDER BY 
    demand_count DESC
LIMIT 5;    