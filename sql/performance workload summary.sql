USE Attrition_cost_analysis

------PERFORMANCE WORKLOAD SUMMARY-------

--Do high performers or low performers leave more often?--

SELECT
performance_rating,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS DECIMAL(10,2)),'%') AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY performance_rating
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*) DESC

--Does workload (average work hours, projects completed) affect attrition?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN average_work_hours END),2) AS avg_work_hours_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed'THEN average_work_hours END),2) AS avg_work_hours_who_stayed,
ROUND(AVG(CASE WHEN attrition_status='Left' THEN projects_completed END),2) AS avg_projects_completed_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN projects_completed END),2) AS avg_projects_completed_who_stayed

FROM employee_turnover_dataset

--Do employees with higher absenteeism leave more often?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN absenteeism_days END),2) AS avg_absenteesim_days_of_employees_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN absenteeism_days END),2) AS avg_absenteeism_days_of_employees_stayed
FROM employee_turnover_dataset


--Does training investment affect whether an employee stays?--


SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN training_hours END),2) AS avg_training_investment_of_employees_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN training_hours END),2) AS avg_training_investment_of_employees_stayed
FROM employee_turnover_dataset