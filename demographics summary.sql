USE Attrition_cost_analysis

------DEMOGRAPHIC SUMMARY-------

--Which age group has the highest attrition rate?--
WITH age_segment AS(
SELECT
attrition_status,
CASE WHEN age BETWEEN 20 AND 29 THEN 'age20-29'
	WHEN age BETWEEN 30 AND 39 THEN 'age30-39'
	WHEN age BETWEEN 40 AND 49 THEN 'age40-50'
	ELSE 'age above 50'
END AS age_group
FROM employee_turnover_dataset
)

SELECT
age_group,
CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS decimal(10,2)) AS attrition_rate_pct
FROM age_segment
GROUP BY age_group
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*) DESC


--Does attrition rate differ by gender?--

SELECT
gender,
CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS decimal(10,2)) AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY gender

--Does marital status affect attrition rate?--

SELECT
marital_status,
CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS decimal(10,2)) AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY marital_status

--Does education level affect attrition rate?--

SELECT
education_level,
CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS decimal(10,2)) AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY education_level
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*) DESC

--Does years of experience affect attrition likelihood?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN years_of_experience END),2) AS avg_years_of_exp_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN years_of_experience END),2) AS avg_years_of_exp_who_stayed
FROM employee_turnover_dataset