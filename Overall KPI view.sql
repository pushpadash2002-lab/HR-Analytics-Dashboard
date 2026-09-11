USE [Attrition_cost_analysis];
---OVERALL KPIs Calculation--

CREATE VIEW vw_overall_kpis AS
SELECT
COUNT(*) AS total_employees,
SUM(CASE WHEN attrition_status = 'Left' THEN 1 ELSE 0 END) AS employees_left,
SUM(CASE WHEN attrition_status ='Stayed' THEN 1 ELSE 0 END) AS employees_stayed,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status = 'Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,0)AS decimal(10,2)),'%')AS overall_attrition_rate_pct,
SUM(CASE WHEN attrition_status = 'Left' THEN [Total attrition cost per employee] ELSE 0 END) AS total_annual_attrition_cost,
ROUND(AVG(CASE WHEN attrition_status = 'Left' THEN [Total attrition cost per employee] END),2)AS avg_attrition_cost_per_leaver
FROM dbo.employee_turnover_dataset


SELECT * FROM vw_overall_kpis


--Which department cost contribute the most to the attrition cost?--

SELECT TOP 1 department,
SUM([Total attrition cost per employee]) AS total_attrition_cost_by_department
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY department
ORDER BY total_attrition_cost_by_department DESC

--Which JOB LEVEL cost contribute the most to the attrition cost?--

SELECT TOP 1
job_level,
SUM([Total attrition cost per employee]) AS total_attrition_cost_by_job_level
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY job_level
ORDER BY total_attrition_cost_by_job_level DESC

--Most contribution to attrition cost by department and job level---

SELECT TOP 1
department,
job_level,
SUM([Total attrition cost per employee]) AS total_attrition_cost_by_dep_joblevel
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY department, job_level
ORDER BY total_attrition_cost_by_dep_joblevel DESC