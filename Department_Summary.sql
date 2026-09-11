USE Attrition_cost_analysis

-----DEPARTMENT SUMMARY-----

---Highest attrition rate by DEPARTMENT---

SELECT
department,
CAST(ROUND(SUM(CASE WHEN attrition_status = 'Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,0) AS decimal(10,2) )AS highest_attr_rate_by_dep_pct
FROM employee_turnover_dataset
GROUP BY department
ORDER BY highest_attr_rate_by_dep_pct DESC

--DEPARTMENTS who incurred highest attrition cost--

SELECT
department,
SUM(CASE WHEN attrition_status='Left' THEN [Total attrition cost per employee] END) AS highest_total_attrition_cost_by_dep
FROM employee_turnover_dataset
GROUP BY department
ORDER BY highest_total_attrition_cost_by_dep DESC

/*DEPARTMENTS having high attrition volume and low attrition cost 
and low volume high cost*/

SELECT 
department,
COUNT(*) AS leaver_count,
SUM([Total attrition cost per employee]) AS total_cost,
RANK()OVER(ORDER BY COUNT(*)DESC) AS volume_rank,
RANK()OVER(ORDER BY SUM([Total attrition cost per employee])) AS cost_rank
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY department

--Highest recruitment cost by departmet--

SELECT
department,
SUM(Recruitment_cost) AS total_recruitment_cost
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'
GROUP BY department
ORDER BY total_recruitment_cost DESC