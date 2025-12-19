SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    job_location
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND 
    job_location = 'United States'
GROUP BY
    skills,
    job_location
ORDER BY
    demand_count DESC
LIMIT 5;


/*
Key findings:
    - Python dominates: With over 3,100 postings, Python is by far the most in‑demand skill, nearly 1.5x higher than SQL and more than 3x higher than Tableau or SAS. This reinforces Python’s role as the primary language for data science in the U.S.
    
    - SQL is essential: At 2,178 postings, SQL is the second most requested skill, highlighting that database querying and data wrangling   remain core requirements for data scientists.
    
    - R still relevant: With 1,881 postings, R shows strong demand, especially in statistical modeling and academic/healthcare contexts, though it trails Python.
    
    - Visualization tools (Tableau, SAS): Both Tableau (948) and SAS (932) have moderate demand. Tableau reflects the importance of communicating insights visually, while SAS remains valued in certain industries (finance, healthcare, government).
    
    - Demand distribution: The top three (Python, SQL, R) account for ~80% of demand, showing that programming and statistical languages are the backbone of data science hiring.

Results:
[
  {
    "skills": "python",
    "demand_count": "3123",
    "job_location": "United States"
  },
  {
    "skills": "sql",
    "demand_count": "2178",
    "job_location": "United States"
  },
  {
    "skills": "r",
    "demand_count": "1881",
    "job_location": "United States"
  },
  {
    "skills": "tableau",
    "demand_count": "948",
    "job_location": "United States"
  },
  {
    "skills": "sas",
    "demand_count": "932",
    "job_location": "United States"
  }
]

*/