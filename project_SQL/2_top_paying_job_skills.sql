/*
Question 2: What skills are required for the top_paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these
*/

SELECT 
    s.skills AS skill,
    COUNT(*) AS times_skill_mentioned_in_top_10_job_posts
FROM (
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
    LIMIT 10
) AS j
INNER JOIN 
    skills_job_dim AS sj 
ON 
    j.job_id = sj.job_id
INNER JOIN
    skills_dim AS s
ON 
    sj.skill_id = s.skill_id
GROUP BY
    s.skills
ORDER BY
    times_skill_mentioned_in_top_10_job_posts DESC;

/*
Analysis & Key Insights

The dataset analyzes the most frequently mentioned skills in job postings from the top 10 highest-paying Data Analyst jobs in 2023.

SQL (80%) was the most frequently mentioned skill, followed by Python (70%) and Tableau (60%).

Data analysis and visualization were key themes, with R (40%), Pandas (30%), and Excel (30%) also appearing frequently.

Cloud and data warehouse technologies, such as Snowflake, AWS, and Azure, suggest that some roles required experience with modern data infrastructure.

Collaboration tools, including Jira, Confluence, GitLab, and Bitbucket, indicate the importance of teamwork and development workflows.

Conclusion

The results suggest that SQL, Python, and data visualization were the core technical skills sought in these high-paying Data Analyst positions. However, since the dataset contains only 10 job postings from 2023, these findings should be treated as indicative rather than representative of the entire job market. The data shows skill frequency, not a direct relationship between specific skills and salary levels.
*/