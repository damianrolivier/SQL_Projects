//*What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, 
  offering insights into employment options and location flexibility.*//

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

//*A realistic benchmark for the highest-paying data analyst jobs in this sample is roughly $190k–$255k, 
with senior/director roles extending into the $300k+ range.

The highest-paying data jobs in the 2023 sample are heavily concentrated 
in senior/principal/director-level positions, 
with typical top-end salaries around $190k–$255k and some positions reaching $300k+, 
while the $650k listing is a substantial outlier.*//

//*[
  {
    "job_id": 226942,
    "posted_date": "2023-02-20",
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0"
  },
  {
    "job_id": 547382,
    "posted_date": "2023-08-23",
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0"
  },
  {
    "job_id": 552322,
    "posted_date": "2023-06-18",
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 99305,
    "posted_date": "2023-12-05",
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 1021647,
    "posted_date": "2023-01-17",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 168310,
    "posted_date": "2023-08-09",
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 731368,
    "posted_date": "2023-12-07",
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 310660,
    "posted_date": "2023-01-05",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 1749593,
    "posted_date": "2023-07-11",
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 387860,
    "posted_date": "2023-06-09",
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0"
  }
]*//
