/*
Question: What are the most optimal skills to learn to become a data analyst.
- Very similar to question 4, the only difference will be that we care more about the demand count than the highest average salary (that does not mean that the salary doesn't count :) )
*/

SELECT 
    s.skills AS skill_name,
    COUNT(j.job_id) AS demand_count, 
    ROUND(AVG(j.salary_year_avg),2) AS average_salary
FROM 
    job_postings_fact AS j 
INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    j.job_title_short = 'Data Analyst' AND
    j.salary_year_avg IS NOT NULL
GROUP BY 
    s.skills
ORDER BY
    demand_count DESC,
    average_salary DESC
    LIMIT 25;

/*
### Key Insights: Top In-Demand Skills & Average Salary

* **SQL is Essential:** SQL leads the industry in demand by a wide margin (3,083 postings, ~$96.4k avg. salary), solidifying it as the foundational prerequisite for any data analyst role.
* **Programming Pays More Than Spreadsheets:** While Excel remains heavily requested (2,143 postings, ~$86.4k), coding languages like Python (1,840 postings, ~$101.5k) and R (1,073 postings, ~$98.7k) offer significantly higher baseline compensation.
* **Tableau Outpaces Power BI:** Tableau shows both higher market demand (1,659 vs. 1,044 postings) and higher average pay (~$98.0k vs. ~$92.3k) than Power BI.
* **Cloud & Big Data Command the Top Salaries:** Tools tied to modern data engineering and cloud infrastructure—specifically **Spark** (~$113.0k), **Snowflake** (~$111.6k), and **AWS/Azure** (~$105k+)—command the highest compensation among high-demand technologies.
*/
