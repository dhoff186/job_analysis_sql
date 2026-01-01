WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_location = 'United States'
    GROUP BY
        skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_location = 'United States'
    GROUP BY
        skills_job_dim.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
    
LIMIT 25;


/*
Key Insights:

Highest-Paying Skills:
    - Snowflake ($132K), Looker ($121K), and Go ($121K) lead the salary rankings, though demand is low (2–3 postings).
    - Azure ($118K) also commands strong pay, reflecting the premium for cloud expertise.

Best Demand + Salary Balance:
    - Python ($101K, 15 postings) and Power BI ($106K, 10 postings) stand out as optimal skills: high demand and high salaries.
    - SQL ($87K, 20 postings) remains the most requested skill, making it indispensable despite lower pay compared to niche tools.

Lower-Paying Baseline Skills
    - MS Access ($54K), Outlook ($74K), and PowerPoint ($74K) sit at the bottom, showing they’re expected baseline office tools rather than differentiators.
    - These skills don’t drive salary growth but are often required for business operations.


Observations:

    - Core Analytics Stack (SQL, Python, Tableau, Power BI, Excel) → Best mix of demand and pay.
    - Cloud/Data Engineering (Snowflake, Azure, Redshift, SQL Server) → High salaries, worth learning for specialized roles.
    - Office Tools (Word, PowerPoint, Outlook, MS Access) → Necessary but not career accelerators.
    - Emerging BI Tools (Looker, SSRS) → Niche but lucrative, especially in modern data teams.


Query results in JSON format:

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "20",
    "avg_salary": "87683"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "16",
    "avg_salary": "92220"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "15",
    "avg_salary": "101538"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "14",
    "avg_salary": "85024"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "10",
    "avg_salary": "106297"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "8",
    "avg_salary": "86363"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "8",
    "avg_salary": "78873"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": "5",
    "avg_salary": "80104"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "3",
    "avg_salary": "121483"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "3",
    "avg_salary": "121167"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "3",
    "avg_salary": "102058"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "3",
    "avg_salary": "82833"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "3",
    "avg_salary": "77933"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "3",
    "avg_salary": "74695"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "3",
    "avg_salary": "74023"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "3",
    "avg_salary": "73388"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "2",
    "avg_salary": "132225"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "2",
    "avg_salary": "118500"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "2",
    "avg_salary": "101244"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "2",
    "avg_salary": "97500"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "2",
    "avg_salary": "93525"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "2",
    "avg_salary": "93525"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "2",
    "avg_salary": "87269"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "2",
    "avg_salary": "83082"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "demand_count": "2",
    "avg_salary": "54000"
  }
]

*/