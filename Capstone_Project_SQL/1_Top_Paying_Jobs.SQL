//*What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, 
  offering insights into employment options and location flexibility.*//
//*Get the following columns in the `SELECT` statement: 
`job_id`, 
`job_title`, 
`job_location`, 
`job_schedule_type`, 
`salary_year_avg`, 
`job_posted_date`.
- Filter in the `WHERE` clause for:
    - 'Data Analyst' jobs only (`job_title_short = 'Data Analyst'`)
    - A salary exists (`salary_year_avg IS NOT NULL`)
    - Only include remote jobs (`job_location = 'Anywhere'`)
- Order the results by `salary_year_avg` in descending order (using `ORDER BY`).
- Only include the top 10 jobs (`LIMIT`).*//

SELECT
    job_id,
    job_posted_date::DATE AS posted_date,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg 
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
