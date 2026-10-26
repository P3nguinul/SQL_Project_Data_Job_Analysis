/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with  specified salaries, regardless of location
 ! (I've added a condition so that the skills should be present in posts more than 20 times, so that some outliers with a very nieche skills don't stand at the top. I think that way the list is more accurate.)
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
HAVING 
    COUNT(j.job_id) > 20
ORDER BY
    average_salary DESC,
    demand_count DESC
    LIMIT 25;

/*
### Key Insights: Top-Paying Skills (Sample Size > 20 Postings)

* **Big Data & Data Streaming Lead Compensation:** Distributed computing tools like **Kafka** (~$130k), **Airflow** (~$116k), and **Spark / PySpark** (~$113k–$114k) represent the highest-paying technical bracket for data analysts.
* **Cloud Warehousing Balances Pay and Demand:** **Snowflake** stands out as a high-earning skill with major volume (241 postings, ~$111.6k avg salary), alongside **GCP** (~$113k) and **Redshift** (~$108k).
* **Engineering Environment Fluency Matters:** Foundational software engineering and command-line tools—including **Git** (~$112.2k), **Linux** (~$114.9k), and **Shell scripting** (~$111.5k)—consistently correlate with compensation above $110k.
* **Machine Learning Outperforms General Analytics:** Specializing in advanced Python libraries like **TensorFlow** (~$120.6k) and **Pandas** (~$110.8k) yields a noticeable salary boost over general spreadsheet and BI tools.
*/