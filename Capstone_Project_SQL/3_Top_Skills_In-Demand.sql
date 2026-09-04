//*What are the most in-demand skills for data analysts?

- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieve the top 5 skills with the highest demand in the job market, 
  providing insights into the most valuable skills for job seekers.*//

SELECT 
    skills_dim.skills AS skill_name,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skill_name
ORDER BY
    COUNT(job_postings_fact.job_id) DESC
LIMIT 5;

//*[
  {
    "skill_name": "sql",
    "demand_count": "92628"
  },
  {
    "skill_name": "excel",
    "demand_count": "67031"
  },
  {
    "skill_name": "python",
    "demand_count": "57326"
  },
  {
    "skill_name": "tableau",
    "demand_count": "46554"
  },
  {
    "skill_name": "power bi",
    "demand_count": "39468"
  }
]*//