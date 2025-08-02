/*
 Question : What are the top skills based on salary?
 - Look at the average salary associated with each skill for data analyst positions.
 - Focuses on roles with specific salaries, regardless of location.
 - Why? It reveals how different skills impact salary levels for data analysts and
 help identify the most financially rewarding skills to acquire or improve.
 */
SELECT skills,
    ROUND (AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL --    AND job_work_from_home = True
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25