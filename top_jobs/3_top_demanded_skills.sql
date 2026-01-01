SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    job_location
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'United States'
GROUP BY
    skills,
    job_location
ORDER BY
    demand_count DESC
LIMIT 5;

/*

Key Insights:

    - SQL (98 postings) is the most demanded skill, confirming its role as the backbone of data analysis.
    - Python (92 postings) is nearly as popular, reflecting the growing importance of automation, machine learning, and advanced analytics.
    - Tableau (69 postings) shows strong demand for visualization tools, highlighting the need to communicate insights effectively.
    - Excel (63 postings) remains a staple, proving that even with advanced tools, spreadsheet skills are still critical.
    - R (49 postings), while less in demand than Python, continues to be valued in statistical and academic contexts.


Observations:

    - SQL + Python form the core technical stack for most analyst roles.
    - Visualization tools (Tableau, Excel) remain critical for stakeholder communication.
    - R is niche but valuable for specialized statistical work.
    - The demand distribution shows a clear hierarchy: database + programming > visualization > statistics.


Query results in JSON format:
[
  {
    "skills": "sql",
    "demand_count": "98",
    "job_location": "United States"
  },
  {
    "skills": "python",
    "demand_count": "92",
    "job_location": "United States"
  },
  {
    "skills": "tableau",
    "demand_count": "69",
    "job_location": "United States"
  },
  {
    "skills": "excel",
    "demand_count": "63",
    "job_location": "United States"
  },
  {
    "skills": "r",
    "demand_count": "49",
    "job_location": "United States"
  }
]
*/