WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'United States' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*

Key Insights:

    Highest Paying Skills:
    - Go and PyTorch (MosaicML, Research Scientist / Engineer) lead at $220,000, reflecting the premium value of advanced programming and deep learning frameworks in AI research.
    - Strong Director-Level Skills:
    - Python, Tableau, Power BI, Atlassian, and Jira (Believe, Director of Data Analytics & Insights) each command $190,000, showing that leadership roles require both technical and project management tools.
    - Specialized Science Tools:
    - Unity (Denali Therapeutics, Clinical Scientist, Neuroimaging) earns ~$170K, highlighting the importance of visualization and simulation in biotech.
    - Core Data Engineering Skills:
    - SQL and Azure (Gopuff, Analytics Engineer II) are valued at $147,500, showing strong demand for database management and cloud expertise.

Observations:

    - AI-focused skills (Go, PyTorch) dominate the salary ceiling, reflecting the explosive demand for machine learning expertise.
    - Director-level analytics skills combine technical tools (Python, Tableau, Power BI) with project management platforms (Atlassian, Jira), showing the hybrid nature of leadership roles.
    - Specialized visualization tools (Unity) are highly valued in scientific research, bridging data and simulation.
    - Foundational skills (SQL, Azure) remain critical, though they sit at the lower end of this high-paying dataset compared to niche or leadership skills.

Query results in JSON format:

[
  {
    "job_id": 4635,
    "job_title": "Research Scientist / Research Engineer (Greater NYC Area, NY)",
    "salary_year_avg": "220000.0",
    "company_name": "MosaicML",
    "skills": "go"
  },
  {
    "job_id": 4635,
    "job_title": "Research Scientist / Research Engineer (Greater NYC Area, NY)",
    "salary_year_avg": "220000.0",
    "company_name": "MosaicML",
    "skills": "pytorch"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "salary_year_avg": "190000.0",
    "company_name": "Believe",
    "skills": "python"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "salary_year_avg": "190000.0",
    "company_name": "Believe",
    "skills": "tableau"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "salary_year_avg": "190000.0",
    "company_name": "Believe",
    "skills": "power bi"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "salary_year_avg": "190000.0",
    "company_name": "Believe",
    "skills": "atlassian"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "salary_year_avg": "190000.0",
    "company_name": "Believe",
    "skills": "jira"
  },
  {
    "job_id": 1367292,
    "job_title": "Clinical Scientist, Neuroimaging",
    "salary_year_avg": "169833.5",
    "company_name": "Denali Therapeutics",
    "skills": "unity"
  },
  {
    "job_id": 15709,
    "job_title": "Analytics Engineer II",
    "salary_year_avg": "147500.0",
    "company_name": "Gopuff",
    "skills": "sql"
  },
  {
    "job_id": 15709,
    "job_title": "Analytics Engineer II",
    "salary_year_avg": "147500.0",
    "company_name": "Gopuff",
    "skills": "azure"
  }
]

*/