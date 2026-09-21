# 📊 SQL Data Analytics Capstone Project

## 📖 Introduction

This project explores the **2023 data analyst job market** using SQL and a dataset of real-world job postings.

The analysis focuses on five questions:

1. What are the highest-paying Data Analyst roles?
2. What skills are associated with these higher-paying roles?
3. Which skills appear most frequently in Data Analyst job postings?
4. Which skills are associated with higher average salaries?
5. Where do **skill demand and salary levels intersect**?

The objective was not simply to query the data, but to use SQL to investigate a real-world question and turn raw job-posting data into meaningful insights about the data analytics job market.

🔗 **SQL Queries:** [View the SQL scripts](Capstone_Project_SQL/)

---

## 💼 Background

My transition into data analytics began with a desire to move into a career that would challenge me to continuously learn, solve problems, and develop new skills.

As I explored the field, I became increasingly interested in the data behind the profession itself — particularly the roles companies are hiring for, the skills employers are requesting, and how those skills relate to salary.

This project provided an opportunity to apply the SQL skills I developed through **Luke Barousse's SQL for Data Analytics course** to a practical dataset.

It also builds on my previous Excel projects, where I analysed the same underlying data. Working with the dataset again in SQL allowed me to approach the problem from a different perspective and strengthen my ability to use different analytical tools to answer business questions.

---

## 🛠️ Tools & Technologies

* **PostgreSQL** — database querying and analysis
* **SQL** — data exploration, transformation and analysis
* **Visual Studio Code** — SQL development environment
* **Git & GitHub** — version control and project documentation

### SQL Techniques Applied

* SELECT, WHERE and ORDER BY
* GROUP BY and aggregate functions
* INNER JOIN and LEFT JOIN
* Common Table Expressions (CTEs)
* CASE expressions
* Subqueries
* Date functions
* Filtering and conditional logic
* HAVING
* Multi-table analysis

---

# 🔍 Analysis & Findings

## 1. 💰 Highest-Paying Data Analyst Jobs

I began by identifying the highest-paying Data Analyst roles within the dataset, focusing on remote positions with reported annual salaries.

### Key finding

The highest-paying roles in the 2023 dataset included salaries ranging from approximately **$184,000 to $650,000**.

The results also showed that some of the highest-paying positions carried more senior or managerial titles, illustrating the range of career paths that exist within the broader data analytics field.

```sql
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
```

![Top Paying Data Analyst Jobs](./Assets/top_paying_data_jobs_2023.png)

---

## 2. 🧠 Skills Associated With Higher-Paying Roles

Next, I examined the skills listed in the highest-paying Data Analyst job postings.

Among the top 10 highest-paying roles:

* **SQL** appeared in 8 roles
* **Python** appeared in 7 roles
* **Tableau** appeared in 6 roles

Other skills included R, Snowflake, Pandas and Excel.

These results show that higher-paying roles in this sample often combine core analytical skills with additional technical or specialised capabilities.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills AS skill_name
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

![Skills Required for Top-Paying Data Analyst Jobs](./Assets/skills_for_top_paying_jobs_2023.png)

---

## 3. 🧰 Most In-Demand Skills

I then expanded the analysis to Data Analyst postings across the dataset to identify the skills appearing most frequently.

The five most frequently requested skills were:

| Skill    | Job Postings |
| -------- | -----------: |
| SQL      |       92,628 |
| Excel    |       67,031 |
| Python   |       57,326 |
| Tableau  |       46,554 |
| Power BI |       39,468 |

### Key finding

SQL and Excel appeared frequently in the analysed 2023 Data Analyst postings, reinforcing the continued relevance of both tools within the dataset.

```sql
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
```

![Most In-Demand Data Analyst Skills](./Assets/top_skills_demand.png)

---

## 4. 💵 Skills Associated With Higher Average Salaries

I also investigated the relationship between individual skills and average salary among remote Data Analyst positions with reported salaries.

Some specialised skills showed substantially higher average salaries within this subset of the data, including PySpark, Bitbucket and Couchbase.

### Important consideration

These results represent **associations within the dataset**, rather than evidence that possessing a particular skill directly causes a higher salary.

Salary can also be influenced by factors such as seniority, role responsibilities, industry, company, location and the combination of skills required.

```sql
SELECT 
    skills_dim.skills AS skill_name,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE 
GROUP BY
    skill_name
ORDER BY
    avg_salary DESC;
```

![Skills Associated With Higher Salaries](./Assets/high_paying_skills.png)


---

## 5. 🎯 Where Skill Demand and Salary Intersect

Finally, I combined skill demand and average salary into a single analysis.

The objective was to identify skills that appear frequently enough in job postings to demonstrate market demand while also examining their associated salary levels.

Rather than treating this as a definitive list of the "best" skills to learn, I used the analysis to identify **potential areas for further skill development**.

The results suggest a broad pattern:

* **Core analytical skills** tend to appear more frequently across job postings.
* **More specialised technical skills** can be associated with higher average salaries but may appear in fewer postings.
* Developing a combination of foundational and specialised skills may therefore provide broader exposure to different roles within the data field.

```sql
WITH 
    skills_demand AS (
    SELECT
        skills_dim.skill_id, 
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
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
),
salary_average AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skill_name,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN salary_average ON skills_demand.skill_id = salary_average.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;

--Rewritng same query more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count
LIMIT 25;
```

![Skill Demand vs Salary](./Assets/optimal_skills_results.png)
---

# 📚 What I Learned

This project strengthened my ability to use SQL as an analytical tool rather than simply as a way to retrieve data.

### Technical skills

I gained practical experience with:

* Joining multiple related tables
* Writing CTEs and subqueries
* Using aggregate functions to summarise data
* Applying conditional logic with CASE
* Filtering and grouping data
* Working with dates and calculated fields
* Structuring queries around specific analytical questions

### Analytical skills

More importantly, the project helped me develop the process of:

**Question → Query → Analysis → Insight**

I learned that writing the SQL is only part of the process. The more important step is understanding the question being asked, selecting the appropriate data, interpreting the results, and communicating what those results actually mean.

---

# 💡 Key Takeaways

The analysis of the 2023 dataset highlighted several patterns:

* Data Analyst roles can vary considerably in salary and seniority.
* SQL, Excel and Python appeared frequently across Data Analyst job postings.
* Higher-paying roles often included a combination of core analytical and specialised technical skills.
* Some specialised skills showed high average salaries despite appearing in fewer postings.
* Skill demand and salary should therefore be considered together rather than in isolation.

These findings are specific to the dataset and time period analysed and should be viewed as a snapshot of the 2023 job market rather than a prediction of current or future employment trends.

---

# 🚀 Conclusion

This capstone project represents an important step in my development as an aspiring Data Analyst.

It allowed me to take a real-world dataset, formulate analytical questions, apply SQL techniques across multiple related tables, and communicate findings from the results.

Combined with my previous Excel projects using the same dataset, the project has helped me develop a broader understanding of how different analytical tools can be used to investigate the same business problem.

Most importantly, it reinforced the value of approaching data with curiosity, asking meaningful questions, and using evidence to support conclusions.

---

## 🔗 Project Resources

* **GitHub Repository:** [SQL Data Analytics Capstone](https://github.com/damianrolivier/SQL_Projects)
* **SQL Queries:** [Capstone SQL Scripts](Capstone_Project_SQL/)
* **Course:** Luke Barousse — SQL for Data Analytics

---

## 📌 Dataset

The project uses the 2023 data jobs dataset provided as part of the SQL for Data Analytics course.

The analysis represents the data available in that dataset and should not be interpreted as a current representation of the 2026 job market.





