SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
   
ORDER BY
    avg_salary DESC

LIMIT 25;


/*


Key Insights:

    - Highest Paying Skill:
    - PySpark leads with an average salary of $208,172, showing the premium value of big data processing frameworks in analytics.
    - Version Control & Collaboration Tools:
    - Bitbucket ($189,155) and GitLab ($154,500) highlight how modern DevOps and collaborative coding platforms are highly valued in analyst roles.
    - Specialized Tools:
    - Couchbase and Watson both average $160,515, reflecting demand for NoSQL databases and AI-driven platforms.
    - DataRobot ($155,486) emphasizes the rising importance of automated machine learning platforms.
    - Programming & Libraries:
    - Swift ($153,750), Pandas ($151,821), NumPy ($143,513), and Scala ($124,903) show that diverse programming languages and data libraries remain lucrative.
    - Cloud & Infrastructure:
    - Databricks ($141,907), Kubernetes ($132,500), PostgreSQL ($123,879), and GCP ($122,500) demonstrate strong compensation for cloud-native and database expertise.
    - Visualization & Workflow Tools:
    - Jupyter ($152,777) and Airflow ($126,103) highlight the value of reproducible workflows and orchestration in analytics pipelines.
    - Other Notables:
    - Elasticsearch ($145,000) for search and indexing, Twilio ($127,000) for communication APIs, and MicroStrategy ($121,619) for BI platforms round out the list.



Observations:

    - Big Data & ML frameworks (PySpark, DataRobot, Databricks) dominate the top tier, reflecting the industry’s shift toward large-scale analytics and automation.
    - Collaboration & DevOps tools (Bitbucket, GitLab, Jenkins, Atlassian) show that analysts increasingly need engineering-oriented skills.
    - Programming languages & libraries (Swift, Pandas, NumPy, Scala, Golang) remain highly compensated, proving versatility across ecosystems is rewarded.
    - Cloud & infrastructure (Kubernetes, GCP, PostgreSQL) are essential for scaling analytics, with salaries consistently above $120K.



Query results in JSON format:

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

*/