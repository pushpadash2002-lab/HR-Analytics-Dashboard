USE Attrition_cost_analysis

----JOB LEVEL SUMMARY----

--Which job levels have highest attrition rate--

SELECT
job_level,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,0) AS decimal(10,2)),'%') AS attrition_rate_by_joblevel
FROM employee_turnover_dataset
GROUP BY job_level
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END) DESC


----Job level driving highest attrition cost----

SELECT
job_level,
SUM(CASE WHEN attrition_status = 'Left' THEN [Total attrition cost per employee] END) AS highest_attrition_cost_by_joblevel
FROM employee_turnover_dataset
GROUP BY job_level
ORDER BY SUM(CASE WHEN attrition_status = 'Left' THEN [Total attrition cost per employee] END) DESC

---Which job roles have highest attrition rate?---

SELECT
job_role,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status = 'Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,0) AS decimal(10,2)),'%') AS attrition_rate_by_job_role
FROM employee_turnover_dataset
GROUP BY job_role
ORDER BY attrition_rate_by_job_role DESC


---Which job level takes the longest to fill after someone leaves?---

SELECT
job_level,
AVG([days to fill]) AS avg_days_to_fill
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY job_level
ORDER BY avg_days_to_fill DESC

 