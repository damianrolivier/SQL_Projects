//*What are the top skills based on salary? 

- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve.*//

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

//*[
  {
    "skill_name": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skill_name": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skill_name": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill_name": "watson",
    "avg_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill_name": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skill_name": "swift",
    "avg_salary": "153750"
  },
  {
    "skill_name": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skill_name": "pandas",
    "avg_salary": "151821"
  },
  {
    "skill_name": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skill_name": "golang",
    "avg_salary": "145000"
  },
  {
    "skill_name": "numpy",
    "avg_salary": "143513"
  },
  {
    "skill_name": "databricks",
    "avg_salary": "141907"
  },
  {
    "skill_name": "linux",
    "avg_salary": "136508"
  },
  {
    "skill_name": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skill_name": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skill_name": "twilio",
    "avg_salary": "127000"
  },
  {
    "skill_name": "airflow",
    "avg_salary": "126103"
  },
  {
    "skill_name": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skill_name": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skill_name": "notion",
    "avg_salary": "125000"
  },
  {
    "skill_name": "scala",
    "avg_salary": "124903"
  },
  {
    "skill_name": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skill_name": "gcp",
    "avg_salary": "122500"
  },
  {
    "skill_name": "microstrategy",
    "avg_salary": "121619"
  },
  {
    "skill_name": "crystal",
    "avg_salary": "120100"
  },
  {
    "skill_name": "go",
    "avg_salary": "115320"
  },
  {
    "skill_name": "confluence",
    "avg_salary": "114210"
  },
  {
    "skill_name": "db2",
    "avg_salary": "114072"
  },
  {
    "skill_name": "hadoop",
    "avg_salary": "113193"
  },
  {
    "skill_name": "snowflake",
    "avg_salary": "112948"
  },
  {
    "skill_name": "git",
    "avg_salary": "112000"
  },
  {
    "skill_name": "ibm cloud",
    "avg_salary": "111500"
  },
  {
    "skill_name": "azure",
    "avg_salary": "111225"
  },
  {
    "skill_name": "bigquery",
    "avg_salary": "109654"
  },
  {
    "skill_name": "aws",
    "avg_salary": "108317"
  },
  {
    "skill_name": "shell",
    "avg_salary": "108200"
  },
  {
    "skill_name": "unix",
    "avg_salary": "107667"
  },
  {
    "skill_name": "java",
    "avg_salary": "106906"
  },
  {
    "skill_name": "ssis",
    "avg_salary": "106683"
  },
  {
    "skill_name": "jira",
    "avg_salary": "104918"
  },
  {
    "skill_name": "oracle",
    "avg_salary": "104534"
  },
  {
    "skill_name": "dax",
    "avg_salary": "104500"
  },
  {
    "skill_name": "looker",
    "avg_salary": "103795"
  },
  {
    "skill_name": "sap",
    "avg_salary": "102920"
  },
  {
    "skill_name": "nosql",
    "avg_salary": "101414"
  },
  {
    "skill_name": "python",
    "avg_salary": "101397"
  },
  {
    "skill_name": "r",
    "avg_salary": "100499"
  },
  {
    "skill_name": "redshift",
    "avg_salary": "99936"
  },
  {
    "skill_name": "qlik",
    "avg_salary": "99631"
  },
  {
    "skill_name": "tableau",
    "avg_salary": "99288"
  },
  {
    "skill_name": "ssrs",
    "avg_salary": "99171"
  },
  {
    "skill_name": "spark",
    "avg_salary": "99077"
  },
  {
    "skill_name": "c++",
    "avg_salary": "98958"
  },
  {
    "skill_name": "c",
    "avg_salary": "98938"
  },
  {
    "skill_name": "sas",
    "avg_salary": "98902"
  },
  {
    "skill_name": "sql server",
    "avg_salary": "97786"
  },
  {
    "skill_name": "javascript",
    "avg_salary": "97587"
  },
  {
    "skill_name": "rust",
    "avg_salary": "97500"
  },
  {
    "skill_name": "power bi",
    "avg_salary": "97431"
  },
  {
    "skill_name": "sql",
    "avg_salary": "97237"
  },
  {
    "skill_name": "phoenix",
    "avg_salary": "97230"
  },
  {
    "skill_name": "flow",
    "avg_salary": "97200"
  },
  {
    "skill_name": "bash",
    "avg_salary": "96558"
  },
  {
    "skill_name": "t-sql",
    "avg_salary": "96365"
  },
  {
    "skill_name": "visio",
    "avg_salary": "95842"
  },
  {
    "skill_name": "unity",
    "avg_salary": "95500"
  },
  {
    "skill_name": "powershell",
    "avg_salary": "95275"
  },
  {
    "skill_name": "mysql",
    "avg_salary": "95224"
  },
  {
    "skill_name": "php",
    "avg_salary": "95000"
  },
  {
    "skill_name": "mariadb",
    "avg_salary": "95000"
  },
  {
    "skill_name": "matlab",
    "avg_salary": "94200"
  },
  {
    "skill_name": "alteryx",
    "avg_salary": "94145"
  },
  {
    "skill_name": "cognos",
    "avg_salary": "93264"
  },
  {
    "skill_name": "spss",
    "avg_salary": "92170"
  },
  {
    "skill_name": "pascal",
    "avg_salary": "92000"
  },
  {
    "skill_name": "github",
    "avg_salary": "91580"
  },
  {
    "skill_name": "outlook",
    "avg_salary": "90077"
  },
  {
    "skill_name": "clickup",
    "avg_salary": "90000"
  },
  {
    "skill_name": "vb.net",
    "avg_salary": "90000"
  },
  {
    "skill_name": "sqlite",
    "avg_salary": "89167"
  },
  {
    "skill_name": "vba",
    "avg_salary": "88783"
  },
  {
    "skill_name": "powerpoint",
    "avg_salary": "88701"
  },
  {
    "skill_name": "microsoft teams",
    "avg_salary": "87854"
  },
  {
    "skill_name": "excel",
    "avg_salary": "87288"
  },
  {
    "skill_name": "c#",
    "avg_salary": "86540"
  },
  {
    "skill_name": "html",
    "avg_salary": "86438"
  },
  {
    "skill_name": "sheets",
    "avg_salary": "86088"
  },
  {
    "skill_name": "ms access",
    "avg_salary": "85519"
  },
  {
    "skill_name": "chef",
    "avg_salary": "85000"
  },
  {
    "skill_name": "node.js",
    "avg_salary": "83500"
  },
  {
    "skill_name": "arch",
    "avg_salary": "82750"
  },
  {
    "skill_name": "word",
    "avg_salary": "82576"
  },
  {
    "skill_name": "spring",
    "avg_salary": "82000"
  },
  {
    "skill_name": "spreadsheet",
    "avg_salary": "81892"
  },
  {
    "skill_name": "sharepoint",
    "avg_salary": "81634"
  },
  {
    "skill_name": "webex",
    "avg_salary": "81250"
  },
  {
    "skill_name": "zoom",
    "avg_salary": "80740"
  },
  {
    "skill_name": "terminal",
    "avg_salary": "80625"
  },
  {
    "skill_name": "express",
    "avg_salary": "80000"
  },
  {
    "skill_name": "plotly",
    "avg_salary": "78750"
  },
  {
    "skill_name": "seaborn",
    "avg_salary": "77500"
  },
  {
    "skill_name": "planner",
    "avg_salary": "76800"
  },
  {
    "skill_name": "matplotlib",
    "avg_salary": "76301"
  },
  {
    "skill_name": "ggplot2",
    "avg_salary": "75000"
  },
  {
    "skill_name": "windows",
    "avg_salary": "74124"
  },
  {
    "skill_name": "erlang",
    "avg_salary": "72500"
  },
  {
    "skill_name": "julia",
    "avg_salary": "71148"
  },
  {
    "skill_name": "colocation",
    "avg_salary": "67500"
  },
  {
    "skill_name": "sass",
    "avg_salary": "67500"
  },
  {
    "skill_name": "mongodb",
    "avg_salary": "66020"
  },
  {
    "skill_name": "smartsheet",
    "avg_salary": "63000"
  },
  {
    "skill_name": "visual basic",
    "avg_salary": "62500"
  },
  {
    "skill_name": "ruby",
    "avg_salary": "61780"
  },
  {
    "skill_name": "css",
    "avg_salary": "52500"
  },
  {
    "skill_name": "ruby on rails",
    "avg_salary": "51059"
  },
  {
    "skill_name": "wire",
    "avg_salary": "42500"
  }
]*//
