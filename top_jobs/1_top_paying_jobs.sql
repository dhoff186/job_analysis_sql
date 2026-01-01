SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;

/*
Key insights:

    - Salary Range: These roles span from $110,000 (Insight Global) to $220,000 (MosaicML).
    - Top Tier Roles:
    - Research Scientist / Engineer (MosaicML) leads at $220K, reflecting advanced technical expertise in AI research.
    - Director, Data Analytics & Insights (Believe) follows at $190K, showing leadership positions command strong compensation.
    - Specialized Science Roles: The Clinical Scientist, Neuroimaging (Denali Therapeutics) earns ~$170K, highlighting niche expertise in biotech.
    - Mid-Level Engineering/Analytics: Roles like Analytics Engineer II (Gopuff) at $147.5K bridge technical depth with applied analytics.
    - General Analyst Positions: Salaries cluster between $110K–$120K, including Insight Global, Bixal, and Greater NY Mutual Insurance Company.

Observations:

    - Executive leadership roles dominate the upper salary range, exceeding $180K.
    - Scientific specialization (Neuroimaging, AI research) commands premium salaries, reflecting high demand for advanced skills.
    - General analyst positions remain strong at $110K–$120K, but significantly lower than specialized or leadership roles.
    - The spread between the lowest and highest salaries is $110K, showing a wide gap in compensation depending on role type and expertise.

Query results in JSON format:

    [
  {
    "job_id": 4635,
    "job_title": "Research Scientist / Research Engineer (Greater NYC Area, NY)",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "220000.0",
    "job_posted_date": "2023-05-15 07:20:31",
    "company_name": "MosaicML"
  },
  {
    "job_id": 386558,
    "job_title": "Director, Data Analytics & Insights",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "190000.0",
    "job_posted_date": "2023-05-10 02:26:36",
    "company_name": "Believe"
  },
  {
    "job_id": 1367292,
    "job_title": "Clinical Scientist, Neuroimaging",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "169833.5",
    "job_posted_date": "2023-07-24 08:36:08",
    "company_name": "Denali Therapeutics"
  },
  {
    "job_id": 15709,
    "job_title": "Analytics Engineer II",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "147500.0",
    "job_posted_date": "2023-04-26 09:37:36",
    "company_name": "Gopuff"
  },
  {
    "job_id": 70981,
    "job_title": "Energy Data Analyst",
    "job_location": "United States",
    "job_schedule_type": "Full-time and Part-time",
    "salary_year_avg": "119550.0",
    "job_posted_date": "2023-11-20 12:03:58",
    "company_name": "Booz Allen Hamilton"
  },
  {
    "job_id": 124123,
    "job_title": "Data Analyst, Operations Engineering",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118640.0",
    "job_posted_date": "2023-10-29 16:26:25",
    "company_name": "Invenergy"
  },
  {
    "job_id": 999982,
    "job_title": "Director, Customer Success Data Analytics",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "116950.0",
    "job_posted_date": "2023-02-09 12:04:26",
    "company_name": "Emburse"
  },
  {
    "job_id": 1218751,
    "job_title": "Data Science Analyst",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "112350.0",
    "job_posted_date": "2023-11-22 22:05:05",
    "company_name": "Greater New York Mutual Insurance Company"
  },
  {
    "job_id": 321008,
    "job_title": "Data Analyst",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-17 17:05:59",
    "company_name": "Bixal"
  },
  {
    "job_id": 572735,
    "job_title": "Data Analyst",
    "job_location": "United States",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "110000.0",
    "job_posted_date": "2023-10-10 23:18:50",
    "company_name": "Insight Global"
  }
]




*/